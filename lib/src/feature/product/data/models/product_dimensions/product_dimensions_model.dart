import 'package:dart_mappable/dart_mappable.dart';
import '../../../domain/entities/product_dimensions.dart';

part 'product_dimensions_model.mapper.dart';

@MappableClass()
class ProductDimensionsModel extends ProductDimensions
    with ProductDimensionsModelMappable {
  const ProductDimensionsModel({
    required super.width,
    required super.height,
    required super.depth,
  });

  factory ProductDimensionsModel.fromMap(Map<String, dynamic> json) =>
      ProductDimensionsModelMapper.fromMap(json);

  factory ProductDimensionsModel.fromEntity(ProductDimensions entity) {
    return ProductDimensionsModel(
      width: entity.width,
      height: entity.height,
      depth: entity.depth,
    );
  }
}
