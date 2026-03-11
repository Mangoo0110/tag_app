import 'package:async_handler/async_handler.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

final class GetProductByIdUseCase {
  const GetProductByIdUseCase(this._repository);

  final ProductRepository _repository;

  AsyncRequest<Product?> call(String id) => _repository.getProductById(id);
}
