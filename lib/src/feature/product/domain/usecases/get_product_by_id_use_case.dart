import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

final class GetProductByIdUseCase
    implements AsyncUsecase<Product?, String> {
  const GetProductByIdUseCase(this._repository);

  final ProductRepository _repository;

  @override
  AsyncRequest<Product?> call(String id) => _repository.getProductById(id);
}
