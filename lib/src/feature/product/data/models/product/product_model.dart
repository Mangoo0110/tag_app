import 'package:dart_mappable/dart_mappable.dart';
import '../../../domain/entities/product.dart';
import '../product_dimensions/product_dimensions_model.dart';
import '../product_meta/product_meta_model.dart';
import '../product_review/product_review_model.dart';

part 'product_model.mapper.dart';

@MappableClass()
class ProductModel extends Product with ProductModelMappable {
  const ProductModel({
    required super.id,
    required super.title,
    required super.category,
    required super.price,
    super.description,
    super.discountPercentage,
    super.rating,
    super.stock,
    super.tags,
    super.brand,
    super.sku,
    super.weight,
    ProductDimensionsModel? super.dimensions,
    ProductMetaModel? super.meta,
    super.warrantyInformation,
    super.shippingInformation,
    super.availabilityStatus,
    List<ProductReviewModel>? super.reviews,
    super.returnPolicy,
    super.minimumOrderQuantity,
    super.thumbnail,
    super.images,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) =>
      ProductModelMapper.fromMap(json);

  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      category: entity.category,
      price: entity.price,
      description: entity.description,
      discountPercentage: entity.discountPercentage,
      rating: entity.rating,
      stock: entity.stock,
      tags: entity.tags,
      brand: entity.brand,
      sku: entity.sku,
      weight: entity.weight,
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
      thumbnail: entity.thumbnail,
      images: entity.images,
    );
  }
}
