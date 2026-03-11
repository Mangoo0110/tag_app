import 'package:async_handler/async_handler.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

final class GetCategoryByIdUseCase {
  const GetCategoryByIdUseCase(this._repository);

  final CategoryRepository _repository;

  AsyncRequest<Category?> call(String id) => _repository.getCategoryById(id);
}
