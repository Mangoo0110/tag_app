import 'package:async_handler/async_handler.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

final class SearchCategoriesUseCase {
  const SearchCategoriesUseCase(this._repository);

  final CategoryRepository _repository;

  AsyncRequest<List<Category>> call(
    String query, {
    bool onlyActive = true,
  }) =>
      _repository.searchCategories(
        query,
        onlyActive: onlyActive,
      );
}
