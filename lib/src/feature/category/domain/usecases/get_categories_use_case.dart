import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class GetCategoriesParams {
  const GetCategoriesParams({this.onlyActive = true});

  final bool onlyActive;
}

final class GetCategoriesUseCase
    implements AsyncUsecase<List<Category>, GetCategoriesParams> {
  const GetCategoriesUseCase(this._repository);

  final CategoryRepository _repository;

  @override
  AsyncRequest<List<Category>> call(GetCategoriesParams params) =>
      _repository.getCategories(onlyActive: params.onlyActive);
}
