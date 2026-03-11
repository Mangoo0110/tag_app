import 'package:async_handler/async_handler.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

final class GetCategoriesUseCase {
  const GetCategoriesUseCase(this._repository);

  final CategoryRepository _repository;

  AsyncRequest<List<Category>> call({bool onlyActive = true}) =>
      _repository.getCategories(onlyActive: onlyActive);
}
