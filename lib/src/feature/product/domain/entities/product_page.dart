import 'product.dart';

class ProductPage {
  final List<Product> items;
  final int page;
  final int limit;
  final int? total;

  ProductPage({
    required this.items,
    required this.page,
    required this.limit,
    this.total,
  });
}
