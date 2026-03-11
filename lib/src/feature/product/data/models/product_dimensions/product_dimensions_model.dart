import 'package:dart_mappable/dart_mappable.dart';
import '../../../domain/entities/product_dimensions.dart';

part 'product_dimensions_model.mapper.dart';

@MappableClass()
class ProductDimensionsModel with ProductDimensionsModelMappable {
  const ProductDimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  final double width;
  final double height;
  final double depth;

  factory ProductDimensionsModel.fromEntity(ProductDimensions entity) {
    return ProductDimensionsModel(
      width: entity.width,
      height: entity.height,
      depth: entity.depth,
    );
  }

  ProductDimensions toEntity() {
    return ProductDimensions(width: width, height: height, depth: depth);
  }
}
