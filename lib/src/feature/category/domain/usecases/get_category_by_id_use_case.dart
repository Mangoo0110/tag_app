import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

final class GetCategoryByIdUseCase
    implements AsyncUsecase<Category?, String> {
  const GetCategoryByIdUseCase(this._repository);

  final CategoryRepository _repository;

  @override
  AsyncRequest<Category?> call(String id) => _repository.getCategoryById(id);
}
