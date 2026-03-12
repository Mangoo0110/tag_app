import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/product.dart';
import '../entities/product_page.dart';
import '../entities/product_query_params.dart';
import '../repositories/product_repository.dart';

final class GetProductsUseCase
    implements AsyncUsecase<ProductPage, ProductQueryParams> {
  const GetProductsUseCase(this._repository);

  final ProductRepository _repository;

  @override
  AsyncRequest<ProductPage> call(ProductQueryParams params) =>
      _repository.getProducts(params);
}
