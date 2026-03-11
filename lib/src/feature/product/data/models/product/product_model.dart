import 'package:dart_mappable/dart_mappable.dart';
import '../../../domain/entities/product.dart';
import '../product_dimensions/product_dimensions_model.dart';
import '../product_meta/product_meta_model.dart';
import '../product_review/product_review_model.dart';
part 'product_model.mapper.dart';

@MappableClass()
class ProductModel with ProductModelMappable {
  const ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    this.description,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.meta,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.thumbnail,
    this.images,
  });

  final int id;
  final String title;
  final String category;
  final double price;
  final String? description;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final ProductDimensionsModel? dimensions;
  final ProductMetaModel? meta;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<ProductReviewModel>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final String? thumbnail;
  final List<String>? images;

  factory ProductModel.fromMap(Map<String, dynamic> json) =>
      ProductModelMapper.fromMap(json);

  factory ProductModel.fromEntity(Product entity) {
    final firstVariant = entity.variants.isNotEmpty ? entity.variants.first : null;
    return ProductModel(
      id: int.tryParse(entity.id) ?? 0,
      title: entity.name,
      category: entity.categoryIds.isNotEmpty ? entity.categoryIds.first : '',
      price: firstVariant?.price ?? 0.0,
      discountPercentage:
          firstVariant?.salePrice != null && firstVariant!.price > 0
              ? ((firstVariant.price - firstVariant.salePrice!) /
                  firstVariant.price *
                  100)
              : null,
      stock: firstVariant?.inStock == true ? 1 : 0,
      brand: _attributeValue(entity, 'Brand'),
      sku: firstVariant?.sku,
      thumbnail: entity.imageUrl,
      images: entity.imageUrl == null ? null : <String>[entity.imageUrl!],
      dimensions: entity.dimensions == null
          ? null
          : ProductDimensionsModel.fromEntity(entity.dimensions!),
      meta: entity.meta == null ? null : ProductMetaModel.fromEntity(entity.meta!),
      warrantyInformation: entity.warrantyInformation,
      shippingInformation: entity.shippingInformation,
      availabilityStatus: entity.availabilityStatus,
      reviews: entity.reviews?.map(ProductReviewModel.fromEntity).toList(),
      returnPolicy: entity.returnPolicy,
      minimumOrderQuantity: entity.minimumOrderQuantity,
    );
  }

  Product toEntity() {
    final discount = discountPercentage ?? 0.0;
    final discounted =
        discount > 0 ? (price - (price * discount / 100)) : null;
    final inStock = (stock ?? 0) > 0;
    final categoryValue = category.trim();
    final brandValue = brand?.trim() ?? '';
    final attributes = <VariantAttribute>[
      if (categoryValue.isNotEmpty)
        VariantAttribute(name: 'Category', value: categoryValue),
      if (brandValue.isNotEmpty)
        VariantAttribute(name: 'Brand', value: brandValue),
    ];
    final idStr = id.toString();
    final variantId = 'v_$idStr';
    final image = thumbnail ?? (images != null && images!.isNotEmpty ? images!.first : null);
    return Product(
      id: idStr,
      name: title.trim().isEmpty ? 'Untitled' : title,
      categoryIds:
          categoryValue.isEmpty ? const <String>[] : <String>[categoryValue],
      description: description,
      imageUrl: image,
      variants: <ProductVariant>[
        ProductVariant(
          id: variantId,
          productId: idStr,
          price: price,
          salePrice: discounted,
          sku: sku,
          barcode: meta?.barcode,
          imageUrl: thumbnail,
          isActive: true,
          inStock: inStock,
          attributes: attributes,
        ),
      ],
      isActive: inStock,
      brand: brandValue.isEmpty ? null : brandValue,
      rating: rating,
      tags: tags,
      thumbnail: thumbnail,
      images: images,
      dimensions: dimensions?.toEntity(),
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      availabilityStatus: availabilityStatus,
      reviews: reviews?.map((e) => e.toEntity()).toList(),
      returnPolicy: returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity,
      meta: meta?.toEntity(),
    );
  }
}

String? _attributeValue(Product entity, String name) {
  for (final variant in entity.variants) {
    for (final attribute in variant.attributes) {
      if (attribute.name == name) return attribute.value;
    }
  }
  return null;
}
