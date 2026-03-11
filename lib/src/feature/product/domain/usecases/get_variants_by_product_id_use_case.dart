import 'package:async_handler/async_handler.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

final class GetVariantsByProductIdUseCase {
  const GetVariantsByProductIdUseCase(this._repository);

  final ProductRepository _repository;

  AsyncRequest<List<ProductVariant>> call(String productId) =>
      _repository.getVariantsByProductId(productId);
}
