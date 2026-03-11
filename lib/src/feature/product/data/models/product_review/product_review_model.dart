import 'package:dart_mappable/dart_mappable.dart';
import '../../../domain/entities/product_review.dart';

part 'product_review_model.mapper.dart';

@MappableClass()
class ProductReviewModel with ProductReviewModelMappable {
  const ProductReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  factory ProductReviewModel.fromEntity(ProductReview entity) {
    return ProductReviewModel(
      rating: entity.rating,
      comment: entity.comment,
      date: entity.date,
      reviewerName: entity.reviewerName,
      reviewerEmail: entity.reviewerEmail,
    );
  }

  ProductReview toEntity() {
    return ProductReview(
      rating: rating,
      comment: comment,
      date: date,
      reviewerName: reviewerName,
      reviewerEmail: reviewerEmail,
    );
  }
}
