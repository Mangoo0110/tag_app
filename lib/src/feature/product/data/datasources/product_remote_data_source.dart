import 'package:app_pigeon/app_pigeon.dart';
import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/constants/api_endpoints.dart';
import 'package:tag_app/src/core/utils/extensions/app_pigeon_response_handler.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_page.dart';
import '../../domain/entities/product_query_params.dart';
import '../models/product/product_model.dart';
import '../models/product_page_model.dart';

final class ProductRemoteDataSource with ErrorHandler {
  ProductRemoteDataSource(this._appPigeon);

  final AppPigeon _appPigeon;

  Future<ProductPage> getProducts(ProductQueryParams params) async {
    final skip = (params.page - 1) * params.limit;
    final response = await _appPigeon.get(
      ApiEndpoints.getProducts,
      queryParameters: <String, dynamic>{
        'limit': params.limit,
        'skip': skip,
      },
    );
    final body = response.data;
    if (body is Map<String, dynamic>) {
      return ProductPageModel.fromMap(body).toEntity();
    }
    if (body is List) {
      final items = body
          .whereType<Map>()
          .map((e) => ProductModel.fromMap(e.cast<String, dynamic>()))
          .toList();
      return ProductPage(
        items: items.map((e) => e.toEntity()).toList(),
        page: params.page,
        limit: params.limit,
        total: items.length,
      );
    }
    throw ServerException();
  }

  Future<Product?> getProductById(String id) async {
    final response = await _appPigeon.get(ApiEndpoints.singleProduct(id));
    final body = response.data;
    if (body is Map<String, dynamic>) {
      return ProductModel.fromMap(body).toEntity();
    }
    final wrapped = extractBodyData(response);
    if (wrapped is Map<String, dynamic>) {
      return ProductModel.fromMap(wrapped).toEntity();
    }
    return null;
  }
}
