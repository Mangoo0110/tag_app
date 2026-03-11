import 'package:dart_mappable/dart_mappable.dart';
import '../../../domain/entities/product_meta.dart';

part 'product_meta_model.mapper.dart';

@MappableClass()
class ProductMetaModel extends ProductMeta with ProductMetaModelMappable {
  const ProductMetaModel({
    super.createdAt,
    super.updatedAt,
    super.barcode,
    super.qrCode,
  });

  factory ProductMetaModel.fromMap(Map<String, dynamic> json) =>
      ProductMetaModelMapper.fromMap(json);

  factory ProductMetaModel.fromEntity(ProductMeta entity) {
    return ProductMetaModel(
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      barcode: entity.barcode,
      qrCode: entity.qrCode,
    );
  }
}
