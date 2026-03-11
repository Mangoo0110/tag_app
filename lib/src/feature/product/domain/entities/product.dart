import 'product_dimensions.dart';
import 'product_meta.dart';
import 'product_review.dart';
import 'product_variant.dart';

export 'product_variant.dart';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.categoryIds,
    required this.variants,
    this.description,
    this.imageUrl,
    this.isActive = true,
    this.brand,
    this.rating,
    this.tags,
    this.thumbnail,
    this.images,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
  });

  final String id;
  final String name;
  final List<String> categoryIds;
  final String? description;
  final String? imageUrl;
  final List<ProductVariant> variants;
  final bool isActive;
  final String? brand;
  final double? rating;
  final List<String>? tags;
  final String? thumbnail;
  final List<String>? images;
  final ProductDimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<ProductReview>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final ProductMeta? meta;
}
