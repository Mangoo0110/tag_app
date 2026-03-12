import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class SearchCategoriesParams {
  const SearchCategoriesParams({required this.query, this.onlyActive = true});

  final String query;
  final bool onlyActive;
}

final class SearchCategoriesUseCase
    implements AsyncUsecase<List<Category>, SearchCategoriesParams> {
  const SearchCategoriesUseCase(this._repository);

  final CategoryRepository _repository;

  @override
  AsyncRequest<List<Category>> call(SearchCategoriesParams params) =>
      _repository.searchCategories(
        params.query,
        onlyActive: params.onlyActive,
      );
}
