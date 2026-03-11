import 'package:app_pigeon/app_pigeon.dart';
import 'package:async_handler/async_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:tag_app/src/core/constants/api_endpoints.dart';
import 'package:tag_app/src/core/utils/extensions/app_pigeon_response_handler.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_page.dart';
import '../../domain/entities/product_query_params.dart';
import '../models/product/product_model.dart';

final class ProductRemoteDataSource with ErrorHandler {
  ProductRemoteDataSource(this._appPigeon);

  final AppPigeon _appPigeon;

  Future<ProductPage> getProducts(ProductQueryParams params) async {
    final skip = (params.page - 1) * params.limit;
    final response = await _appPigeon.get(
      ApiEndpoints.getProducts,
      queryParameters: params.toMap()
    );
    final body = response.data;
    final List<ProductModel> products = [];
    final rawList = response.data['products'] as List<dynamic>;
    int cnt = 1;
    for(final data in rawList) {
      try {
        debugPrint('cnt: $cnt');
        debugPrint(data.toString());
        products.add(ProductModel.fromMap(data));
        cnt++;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return ProductPage(
        items: products,
        page: params.page,
        limit: params.limit,
        total: products.length,
      );
  }

  Future<Product?> getProductById(String id) async {
    final response = await _appPigeon.get(ApiEndpoints.singleProduct(id));
    final body = response.data;
    if (body is Map<String, dynamic>) {
      return ProductModel.fromMap(body);
    }
    final wrapped = extractBodyData(response);
    if (wrapped is Map<String, dynamic>) {
      return ProductModel.fromMap(wrapped);
    }
    return null;
  }
}
