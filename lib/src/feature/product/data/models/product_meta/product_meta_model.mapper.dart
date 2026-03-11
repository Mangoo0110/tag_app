// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_meta_model.dart';

class ProductMetaModelMapper extends ClassMapperBase<ProductMetaModel> {
  ProductMetaModelMapper._();

  static ProductMetaModelMapper? _instance;
  static ProductMetaModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductMetaModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductMetaModel';

  static DateTime? _$createdAt(ProductMetaModel v) => v.createdAt;
  static const Field<ProductMetaModel, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(ProductMetaModel v) => v.updatedAt;
  static const Field<ProductMetaModel, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static String? _$barcode(ProductMetaModel v) => v.barcode;
  static const Field<ProductMetaModel, String> _f$barcode = Field(
    'barcode',
    _$barcode,
    opt: true,
  );
  static String? _$qrCode(ProductMetaModel v) => v.qrCode;
  static const Field<ProductMetaModel, String> _f$qrCode = Field(
    'qrCode',
    _$qrCode,
    opt: true,
  );

  @override
  final MappableFields<ProductMetaModel> fields = const {
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #barcode: _f$barcode,
    #qrCode: _f$qrCode,
  };

  static ProductMetaModel _instantiate(DecodingData data) {
    return ProductMetaModel(
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      barcode: data.dec(_f$barcode),
      qrCode: data.dec(_f$qrCode),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProductMetaModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductMetaModel>(map);
  }

  static ProductMetaModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProductMetaModel>(json);
  }
}

mixin ProductMetaModelMappable {
  String toJson() {
    return ProductMetaModelMapper.ensureInitialized()
        .encodeJson<ProductMetaModel>(this as ProductMetaModel);
  }

  Map<String, dynamic> toMap() {
    return ProductMetaModelMapper.ensureInitialized()
        .encodeMap<ProductMetaModel>(this as ProductMetaModel);
  }

  ProductMetaModelCopyWith<ProductMetaModel, ProductMetaModel, ProductMetaModel>
  get copyWith =>
      _ProductMetaModelCopyWithImpl<ProductMetaModel, ProductMetaModel>(
        this as ProductMetaModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProductMetaModelMapper.ensureInitialized().stringifyValue(
      this as ProductMetaModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProductMetaModelMapper.ensureInitialized().equalsValue(
      this as ProductMetaModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ProductMetaModelMapper.ensureInitialized().hashValue(
      this as ProductMetaModel,
    );
  }
}

extension ProductMetaModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductMetaModel, $Out> {
  ProductMetaModelCopyWith<$R, ProductMetaModel, $Out>
  get $asProductMetaModel =>
      $base.as((v, t, t2) => _ProductMetaModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProductMetaModelCopyWith<$R, $In extends ProductMetaModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  });
  ProductMetaModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProductMetaModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductMetaModel, $Out>
    implements ProductMetaModelCopyWith<$R, ProductMetaModel, $Out> {
  _ProductMetaModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductMetaModel> $mapper =
      ProductMetaModelMapper.ensureInitialized();
  @override
  $R call({
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? barcode = $none,
    Object? qrCode = $none,
  }) => $apply(
    FieldCopyWithData({
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (barcode != $none) #barcode: barcode,
      if (qrCode != $none) #qrCode: qrCode,
    }),
  );
  @override
  ProductMetaModel $make(CopyWithData data) => ProductMetaModel(
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    barcode: data.get(#barcode, or: $value.barcode),
    qrCode: data.get(#qrCode, or: $value.qrCode),
  );

  @override
  ProductMetaModelCopyWith<$R2, ProductMetaModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProductMetaModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

