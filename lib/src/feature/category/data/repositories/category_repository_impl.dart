import 'package:app_pigeon/app_pigeon.dart';
import 'package:tag_app/src/core/constants/api_endpoints.dart';
import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/utils/extensions/app_pigeon_response_handler.dart';
import '../models/category_model.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl with ErrorHandler implements CategoryRepository  {
  CategoryRepositoryImpl({required this.appPigeon});

  final AppPigeon appPigeon;

  @override
  AsyncRequest<List<Category>> getCategories({bool onlyActive = true}) async {
    final all = await _derivedCategories();
    final filtered = onlyActive ? all.where((e) => e.isActive).toList() : all;
    return SuccessResponse<List<Category>>(data: filtered);
  }

  @override
  AsyncRequest<Category?> getCategoryById(String id) async {
    final all = await _derivedCategories();
    for (final category in all) {
      if (category.id == id) {
        return SuccessResponse<Category?>(data: category);
      }
    }
    return SuccessResponse<Category?>(data: null);
  }

  @override
  AsyncRequest<List<Category>> searchCategories(
    String query, {
    bool onlyActive = true,
  }) async {
    final q = query.trim().toLowerCase();
    final all = await _derivedCategories();
    final filtered = all.where((category) {
      if (onlyActive && !category.isActive) {
        return false;
      }
      if (q.isEmpty) {
        return true;
      }
      return category.name.toLowerCase().contains(q);
    }).toList();
    return SuccessResponse<List<Category>>(data: filtered);
  }

  Future<List<Category>> _derivedCategories() async {
    return asyncTryCatch<List<Category>>(
      tryFunc: () async {
        final res = await appPigeon.get(ApiEndpoints.getProducts);
        final products = _extractProductList(res);
        final names = <String>{};

        for (final product in products) {
          final category = product['category']?.toString().trim() ?? '';
          if (category.isNotEmpty) {
            names.add(category);
          }
        }

        final categories =
            names
                .map(
                  (name) => CategoryModel(
                    id: name,
                    name: name,
                    imageUrl: null,
                    isActive: true,
                  ),
                )
                .toList()
              ..sort((a, b) => a.name.compareTo(b.name));
        return SuccessResponse<List<Category>>(data: categories);
      },
    ).then(
      (res) => (res is SuccessResponse<List<Category>> && res.data != null)
          ? res.data!
          : <Category>[],
    );
  }

  List<Map<String, dynamic>> _extractProductList(Response<dynamic> response) {
    final dynamic body = response.data;
    if (body is List) {
      return body
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }

    final dynamic wrapped = extractBodyData(response);
    if (wrapped is List) {
      return wrapped
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }
    return const <Map<String, dynamic>>[];
  }
}
