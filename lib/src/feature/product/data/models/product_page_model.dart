// import '../../domain/entities/product.dart';
// import '../../domain/entities/product_page.dart';
// import 'product/product_model.dart';

// class ProductPageModel extends ProductPage {


//   const ProductPageModel({
//     required super.items,
//     required super.total,
//     required super.page,
//     required super.limit,
//   });

//   factory ProductPageModel.fromMap(Map<String, dynamic> json) {
//     final products = json['products'];
//     final items =
//         (products is List ? products : const <dynamic>[])
//             .whereType<Map>()
//             .map((e) => ProductModel.fromMap(e.cast<String, dynamic>()))
//             .toList();
//     return ProductPageModel(
//       items: items,
//       total: (json['total'] as num?)?.toInt() ?? items.length,
//       page: (json['skip'] as num?)?.toInt() ?? 0,
//       limit: (json['limit'] as num?)?.toInt() ?? items.length,
//     );
//   }

//   ProductPage toEntity() {
//     final page = limit == 0 ? 1 : (skip ~/ limit) + 1;
//     return ProductPage(
//       items: List<Product>.from(items),
//       page: page,
//       limit: limit,
//       total: total,
//     );
//   }
// }
