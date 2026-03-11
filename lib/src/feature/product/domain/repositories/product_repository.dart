import 'package:async_handler/async_handler.dart';
import '../entities/product.dart';
import '../entities/product_page.dart';
import '../entities/product_query_params.dart';

abstract interface class ProductRepository {
  AsyncRequest<ProductPage> getProducts(ProductQueryParams params);

  AsyncRequest<Product?> getProductById(String id);

  AsyncRequest<List<ProductVariant>> getVariantsByProductId(String productId);
}
