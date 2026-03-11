import 'package:async_handler/async_handler.dart';
import '../entities/product.dart';
import '../entities/product_page.dart';
import '../entities/product_query_params.dart';
import '../repositories/product_repository.dart';

final class GetProductsUseCase {
  const GetProductsUseCase(this._repository);

  final ProductRepository _repository;

  AsyncRequest<ProductPage> call(ProductQueryParams params) =>
      _repository.getProducts(params);
}
