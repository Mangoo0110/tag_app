import 'package:async_handler/async_handler.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:tag_app/src/core/shared/reactive_notifier/process_notifier.dart';
import 'package:tag_app/src/core/shared/reactive_notifier/snackbar_notifier.dart';
import 'package:tag_app/src/core/utils/helpers/handle_future_request.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/get_categories_use_case.dart';

final class CategoryController extends ChangeNotifier {
  CategoryController(this._getCategories);

  final GetCategoriesUseCase _getCategories;

  final ProcessStatusNotifier processNotifier = ProcessStatusNotifier(
    initialStatus: ProcessLoading(message: 'Loading'),
  );

  List<Category> _categories = const <Category>[];

  List<Category> get categories => _categories;

  Future<void> load({
    SnackbarNotifier? errorSnackbarNotifier,
  }) async {
    final result = await handleFutureRequest<List<Category>>(
      futureRequest: () => _getCategories(const GetCategoriesParams()),
      processStatusNotifier: processNotifier,
      errorSnackbarNotifier: errorSnackbarNotifier,
      onSuccess: (data) {
        _categories = data;
      },
    );
    if (result == null) {
      processNotifier.setError(message: 'Failed');
    }
    notifyListeners();
  }
}
