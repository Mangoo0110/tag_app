import 'package:dart_mappable/dart_mappable.dart';
import '../../../domain/entities/product_meta.dart';

part 'product_meta_model.mapper.dart';

@MappableClass()
class ProductMetaModel with ProductMetaModelMappable {
  const ProductMetaModel({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  factory ProductMetaModel.fromEntity(ProductMeta entity) {
    return ProductMetaModel(
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      barcode: entity.barcode,
      qrCode: entity.qrCode,
    );
  }

  ProductMeta toEntity() {
    return ProductMeta(
      createdAt: createdAt,
      updatedAt: updatedAt,
      barcode: barcode,
      qrCode: qrCode,
    );
  }
}
