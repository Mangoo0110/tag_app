import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

final class GetVariantsByProductIdUseCase
    implements AsyncUsecase<List<ProductVariant>, String> {
  const GetVariantsByProductIdUseCase(this._repository);

  final ProductRepository _repository;

  @override
  AsyncRequest<List<ProductVariant>> call(String productId) =>
      _repository.getVariantsByProductId(productId);
}
