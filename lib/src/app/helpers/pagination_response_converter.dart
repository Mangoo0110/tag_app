import 'package:async_handler/async_handler.dart';
import 'package:pagination_pkg/pagination_pkg.dart';
import 'package:tag_app/src/feature/category/domain/entities/category.dart';
import 'package:tag_app/src/feature/product/domain/entities/product.dart';
import '../../feature/product/domain/entities/product_page.dart';


extension ProductPaginationResponseConverter on ApiResponse<ProductPage> {
  PageFetchResponse<String, Product> toProductPaginationResponse({required OnDemandPage<Product> onDemandPage}) {
    switch (this) {        
      case SuccessResponse<ProductPage> _:
        if (data == null) {
          return PaginationError(page: onDemandPage.pageNo, message: "No products found");
        }
        final items = <String, Product>{};
        for (var product in data!.items) {
          items[product.id] = product;
        }
        return PaginationPage(
          items: items,
          page: onDemandPage.pageNo,
        );
      case ErrorResponse<ProductPage> _:
        return PaginationError(
          message: message,
          page: onDemandPage.pageNo,
        );
    }
  }
}

extension CategoryPaginationResponseConverter on ApiResponse<List<Category>> {
  PageFetchResponse<String, Category> toCategoryPaginationResponse({required OnDemandPage<Category> onDemandPage}) {
    switch (this) {
      case SuccessResponse<List<Category>> _:
        if (data == null) {
          return PaginationError(page: onDemandPage.pageNo, message: "No categories found");
        }
        final items = <String, Category>{};
        for (var category in data!) {
          items[category.id] = category;
        }
        return PaginationPage(
          items: items,
          page: onDemandPage.pageNo,
        );
      case ErrorResponse<List<Category>> _:
        return PaginationError(
          message: message,
          page: onDemandPage.pageNo,
        );
    }
  }
}
