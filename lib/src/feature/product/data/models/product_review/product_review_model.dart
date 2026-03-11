import 'package:dart_mappable/dart_mappable.dart';
import '../../../domain/entities/product_review.dart';

part 'product_review_model.mapper.dart';

@MappableClass()
class ProductReviewModel extends ProductReview with ProductReviewModelMappable {
  const ProductReviewModel({
    required super.rating,
    required super.comment,
    required super.date,
    required super.reviewerName,
    required super.reviewerEmail,
  });

  factory ProductReviewModel.fromMap(Map<String, dynamic> json) =>
      ProductReviewModelMapper.fromMap(json);

  factory ProductReviewModel.fromEntity(ProductReview entity) {
    return ProductReviewModel(
      rating: entity.rating,
      comment: entity.comment,
      date: entity.date,
      reviewerName: entity.reviewerName,
      reviewerEmail: entity.reviewerEmail,
    );
  }
}
