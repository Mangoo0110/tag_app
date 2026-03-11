import '../../domain/entities/product_page.dart';
import 'product/product_model.dart';

class ProductPageModel {
  final List<ProductModel> items;
  final int total;
  final int skip;
  final int limit;

  const ProductPageModel({
    required this.items,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductPageModel.fromMap(Map<String, dynamic> json) {
    final products = json['products'];
    final items =
        (products is List ? products : const <dynamic>[])
            .whereType<Map>()
            .map((e) => ProductModel.fromMap(e.cast<String, dynamic>()))
            .toList();
    return ProductPageModel(
      items: items,
      total: (json['total'] as num?)?.toInt() ?? items.length,
      skip: (json['skip'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? items.length,
    );
  }

  ProductPage toEntity() {
    final page = limit == 0 ? 1 : (skip ~/ limit) + 1;
    return ProductPage(
      items: items.map((e) => e.toEntity()).toList(),
      page: page,
      limit: limit,
      total: total,
    );
  }
}
