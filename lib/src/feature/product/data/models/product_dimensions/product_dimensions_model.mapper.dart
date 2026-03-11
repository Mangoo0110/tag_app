// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_dimensions_model.dart';

class ProductDimensionsModelMapper
    extends ClassMapperBase<ProductDimensionsModel> {
  ProductDimensionsModelMapper._();

  static ProductDimensionsModelMapper? _instance;
  static ProductDimensionsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductDimensionsModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductDimensionsModel';

  static double _$width(ProductDimensionsModel v) => v.width;
  static const Field<ProductDimensionsModel, double> _f$width = Field(
    'width',
    _$width,
  );
  static double _$height(ProductDimensionsModel v) => v.height;
  static const Field<ProductDimensionsModel, double> _f$height = Field(
    'height',
    _$height,
  );
  static double _$depth(ProductDimensionsModel v) => v.depth;
  static const Field<ProductDimensionsModel, double> _f$depth = Field(
    'depth',
    _$depth,
  );

  @override
  final MappableFields<ProductDimensionsModel> fields = const {
    #width: _f$width,
    #height: _f$height,
    #depth: _f$depth,
  };

  static ProductDimensionsModel _instantiate(DecodingData data) {
    return ProductDimensionsModel(
      width: data.dec(_f$width),
      height: data.dec(_f$height),
      depth: data.dec(_f$depth),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProductDimensionsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductDimensionsModel>(map);
  }

  static ProductDimensionsModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProductDimensionsModel>(json);
  }
}

mixin ProductDimensionsModelMappable {
  String toJson() {
    return ProductDimensionsModelMapper.ensureInitialized()
        .encodeJson<ProductDimensionsModel>(this as ProductDimensionsModel);
  }

  Map<String, dynamic> toMap() {
    return ProductDimensionsModelMapper.ensureInitialized()
        .encodeMap<ProductDimensionsModel>(this as ProductDimensionsModel);
  }

  ProductDimensionsModelCopyWith<
    ProductDimensionsModel,
    ProductDimensionsModel,
    ProductDimensionsModel
  >
  get copyWith =>
      _ProductDimensionsModelCopyWithImpl<
        ProductDimensionsModel,
        ProductDimensionsModel
      >(this as ProductDimensionsModel, $identity, $identity);
  @override
  String toString() {
    return ProductDimensionsModelMapper.ensureInitialized().stringifyValue(
      this as ProductDimensionsModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProductDimensionsModelMapper.ensureInitialized().equalsValue(
      this as ProductDimensionsModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ProductDimensionsModelMapper.ensureInitialized().hashValue(
      this as ProductDimensionsModel,
    );
  }
}

extension ProductDimensionsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductDimensionsModel, $Out> {
  ProductDimensionsModelCopyWith<$R, ProductDimensionsModel, $Out>
  get $asProductDimensionsModel => $base.as(
    (v, t, t2) => _ProductDimensionsModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ProductDimensionsModelCopyWith<
  $R,
  $In extends ProductDimensionsModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? width, double? height, double? depth});
  ProductDimensionsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProductDimensionsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductDimensionsModel, $Out>
    implements
        ProductDimensionsModelCopyWith<$R, ProductDimensionsModel, $Out> {
  _ProductDimensionsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductDimensionsModel> $mapper =
      ProductDimensionsModelMapper.ensureInitialized();
  @override
  $R call({double? width, double? height, double? depth}) => $apply(
    FieldCopyWithData({
      if (width != null) #width: width,
      if (height != null) #height: height,
      if (depth != null) #depth: depth,
    }),
  );
  @override
  ProductDimensionsModel $make(CopyWithData data) => ProductDimensionsModel(
    width: data.get(#width, or: $value.width),
    height: data.get(#height, or: $value.height),
    depth: data.get(#depth, or: $value.depth),
  );

  @override
  ProductDimensionsModelCopyWith<$R2, ProductDimensionsModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProductDimensionsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

