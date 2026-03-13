import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/utils/utils.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_page.dart';
import '../../domain/entities/product_query_params.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl with ErrorHandler implements ProductRepository{
  ProductRepositoryImpl({
    required ProductRemoteDataSource remote,
  }) : _remote = remote;

  final ProductRemoteDataSource _remote;
  final Debugger _debugger = ServiceDebugger();

  List<Product>? _cache;


  @override
  AsyncRequest<ProductPage> getProducts(ProductQueryParams params) async {
    final remote = await asyncTryCatch<ProductPage>(
      tryFunc: () async {
        _debugger.dekhao('Fetching products with params:::: ${params.toMap().toString()}');
        final page = await _remote.getProducts(params);

        return SuccessResponse<ProductPage>(
          data: page
        );
      },
    );
    return remote;
  }

  @override
  AsyncRequest<Product?> getProductById(String id) async {
    final remote = await asyncTryCatch<Product?>(
      tryFunc: () async {
        final product = await _remote.getProductById(id);
        return SuccessResponse<Product?>(data: product);
      },
    );
    return remote;
  }

  @override
  AsyncRequest<List<ProductVariant>> getVariantsByProductId(
    String productId,
  ) async {
    final remote = await asyncTryCatch<List<ProductVariant>>(
      tryFunc: () async {
        final products = await getProducts(const ProductQueryParams(page: 1, limit: 100)).then(
          (res) => res is SuccessResponse<ProductPage> ? (res.data?.items ?? []) : [],
        );
        List<ProductVariant> variants = const <ProductVariant>[];
        for (final product in products) {
          if (product.id.toString() == productId) {
            variants = product.variants;
            break;
          }
        }
        return SuccessResponse<List<ProductVariant>>(data: variants);
      },
    );
    return remote;
  }

  List<Product> _filterProducts(
    List<Product> products,
    ProductQueryParams params,
  ) {
    final query = params.query?.trim().toLowerCase() ?? '';
    return products.where((product) {
      if (params.onlyActive && !product.isActive) {
        return false;
      }
      if (params.categoryId != null &&
          product.category != params.categoryId) {
        return false;
      }
      if (query.isNotEmpty && !product.name.toLowerCase().contains(query)) {
        return false;
      }
      final minVariantPrice = _minVariantPrice(product.variants);
      if (params.minPrice != null && minVariantPrice < params.minPrice!) {
        return false;
      }
      if (params.maxPrice != null && minVariantPrice > params.maxPrice!) {
        return false;
      }
      return true;
    }).toList();
  }

}

double _minVariantPrice(List<ProductVariant> variants) {
  if (variants.isEmpty) {
    return 0;
  }
  var min = variants.first.effectivePrice;
  for (final variant in variants) {
    if (variant.effectivePrice < min) {
      min = variant.effectivePrice;
    }
  }
  return min;
}
