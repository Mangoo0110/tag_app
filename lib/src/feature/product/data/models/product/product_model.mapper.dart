// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_model.dart';

class ProductModelMapper extends ClassMapperBase<ProductModel> {
  ProductModelMapper._();

  static ProductModelMapper? _instance;
  static ProductModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductModelMapper._());
      ProductDimensionsModelMapper.ensureInitialized();
      ProductMetaModelMapper.ensureInitialized();
      ProductReviewModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProductModel';

  static int _$id(ProductModel v) => v.id;
  static const Field<ProductModel, int> _f$id = Field('id', _$id);
  static String _$title(ProductModel v) => v.title;
  static const Field<ProductModel, String> _f$title = Field('title', _$title);
  static String _$category(ProductModel v) => v.category;
  static const Field<ProductModel, String> _f$category = Field(
    'category',
    _$category,
  );
  static double _$price(ProductModel v) => v.price;
  static const Field<ProductModel, double> _f$price = Field('price', _$price);
  static String? _$description(ProductModel v) => v.description;
  static const Field<ProductModel, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static double? _$discountPercentage(ProductModel v) => v.discountPercentage;
  static const Field<ProductModel, double> _f$discountPercentage = Field(
    'discountPercentage',
    _$discountPercentage,
    opt: true,
  );
  static double? _$rating(ProductModel v) => v.rating;
  static const Field<ProductModel, double> _f$rating = Field(
    'rating',
    _$rating,
    opt: true,
  );
  static int? _$stock(ProductModel v) => v.stock;
  static const Field<ProductModel, int> _f$stock = Field(
    'stock',
    _$stock,
    opt: true,
  );
  static List<String>? _$tags(ProductModel v) => v.tags;
  static const Field<ProductModel, List<String>> _f$tags = Field(
    'tags',
    _$tags,
    opt: true,
  );
  static String? _$brand(ProductModel v) => v.brand;
  static const Field<ProductModel, String> _f$brand = Field(
    'brand',
    _$brand,
    opt: true,
  );
  static String? _$sku(ProductModel v) => v.sku;
  static const Field<ProductModel, String> _f$sku = Field(
    'sku',
    _$sku,
    opt: true,
  );
  static int? _$weight(ProductModel v) => v.weight;
  static const Field<ProductModel, int> _f$weight = Field(
    'weight',
    _$weight,
    opt: true,
  );
  static const Field<ProductModel, ProductDimensionsModel> _f$dimensions =
      Field('dimensions', null, mode: FieldMode.param, opt: true);
  static const Field<ProductModel, ProductMetaModel> _f$meta = Field(
    'meta',
    null,
    mode: FieldMode.param,
    opt: true,
  );
  static String? _$warrantyInformation(ProductModel v) => v.warrantyInformation;
  static const Field<ProductModel, String> _f$warrantyInformation = Field(
    'warrantyInformation',
    _$warrantyInformation,
    opt: true,
  );
  static String? _$shippingInformation(ProductModel v) => v.shippingInformation;
  static const Field<ProductModel, String> _f$shippingInformation = Field(
    'shippingInformation',
    _$shippingInformation,
    opt: true,
  );
  static String? _$availabilityStatus(ProductModel v) => v.availabilityStatus;
  static const Field<ProductModel, String> _f$availabilityStatus = Field(
    'availabilityStatus',
    _$availabilityStatus,
    opt: true,
  );
  static const Field<ProductModel, List<ProductReviewModel>> _f$reviews = Field(
    'reviews',
    null,
    mode: FieldMode.param,
    opt: true,
  );
  static String? _$returnPolicy(ProductModel v) => v.returnPolicy;
  static const Field<ProductModel, String> _f$returnPolicy = Field(
    'returnPolicy',
    _$returnPolicy,
    opt: true,
  );
  static int? _$minimumOrderQuantity(ProductModel v) => v.minimumOrderQuantity;
  static const Field<ProductModel, int> _f$minimumOrderQuantity = Field(
    'minimumOrderQuantity',
    _$minimumOrderQuantity,
    opt: true,
  );
  static String? _$thumbnail(ProductModel v) => v.thumbnail;
  static const Field<ProductModel, String> _f$thumbnail = Field(
    'thumbnail',
    _$thumbnail,
    opt: true,
  );
  static List<String>? _$images(ProductModel v) => v.images;
  static const Field<ProductModel, List<String>> _f$images = Field(
    'images',
    _$images,
    opt: true,
  );

  @override
  final MappableFields<ProductModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #category: _f$category,
    #price: _f$price,
    #description: _f$description,
    #discountPercentage: _f$discountPercentage,
    #rating: _f$rating,
    #stock: _f$stock,
    #tags: _f$tags,
    #brand: _f$brand,
    #sku: _f$sku,
    #weight: _f$weight,
    #dimensions: _f$dimensions,
    #meta: _f$meta,
    #warrantyInformation: _f$warrantyInformation,
    #shippingInformation: _f$shippingInformation,
    #availabilityStatus: _f$availabilityStatus,
    #reviews: _f$reviews,
    #returnPolicy: _f$returnPolicy,
    #minimumOrderQuantity: _f$minimumOrderQuantity,
    #thumbnail: _f$thumbnail,
    #images: _f$images,
  };

  static ProductModel _instantiate(DecodingData data) {
    return ProductModel(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      category: data.dec(_f$category),
      price: data.dec(_f$price),
      description: data.dec(_f$description),
      discountPercentage: data.dec(_f$discountPercentage),
      rating: data.dec(_f$rating),
      stock: data.dec(_f$stock),
      tags: data.dec(_f$tags),
      brand: data.dec(_f$brand),
      sku: data.dec(_f$sku),
      weight: data.dec(_f$weight),
      dimensions: data.dec(_f$dimensions),
      meta: data.dec(_f$meta),
      warrantyInformation: data.dec(_f$warrantyInformation),
      shippingInformation: data.dec(_f$shippingInformation),
      availabilityStatus: data.dec(_f$availabilityStatus),
      reviews: data.dec(_f$reviews),
      returnPolicy: data.dec(_f$returnPolicy),
      minimumOrderQuantity: data.dec(_f$minimumOrderQuantity),
      thumbnail: data.dec(_f$thumbnail),
      images: data.dec(_f$images),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductModel>(map);
  }

  static ProductModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProductModel>(json);
  }
}

mixin ProductModelMappable {
  String toJson() {
    return ProductModelMapper.ensureInitialized().encodeJson<ProductModel>(
      this as ProductModel,
    );
  }

  Map<String, dynamic> toMap() {
    return ProductModelMapper.ensureInitialized().encodeMap<ProductModel>(
      this as ProductModel,
    );
  }

  ProductModelCopyWith<ProductModel, ProductModel, ProductModel> get copyWith =>
      _ProductModelCopyWithImpl<ProductModel, ProductModel>(
        this as ProductModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProductModelMapper.ensureInitialized().stringifyValue(
      this as ProductModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProductModelMapper.ensureInitialized().equalsValue(
      this as ProductModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ProductModelMapper.ensureInitialized().hashValue(
      this as ProductModel,
    );
  }
}

extension ProductModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductModel, $Out> {
  ProductModelCopyWith<$R, ProductModel, $Out> get $asProductModel =>
      $base.as((v, t, t2) => _ProductModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProductModelCopyWith<$R, $In extends ProductModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tags;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get images;
  $R call({
    int? id,
    String? title,
    String? category,
    double? price,
    String? description,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    ProductDimensionsModel? dimensions,
    ProductMetaModel? meta,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ProductReviewModel>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    String? thumbnail,
    List<String>? images,
  });
  ProductModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductModel, $Out>
    implements ProductModelCopyWith<$R, ProductModel, $Out> {
  _ProductModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductModel> $mapper =
      ProductModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tags =>
      $value.tags != null
      ? ListCopyWith(
          $value.tags!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get images =>
      $value.images != null
      ? ListCopyWith(
          $value.images!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(images: v),
        )
      : null;
  @override
  $R call({
    int? id,
    String? title,
    String? category,
    double? price,
    Object? description = $none,
    Object? discountPercentage = $none,
    Object? rating = $none,
    Object? stock = $none,
    Object? tags = $none,
    Object? brand = $none,
    Object? sku = $none,
    Object? weight = $none,
    ProductDimensionsModel? dimensions,
    ProductMetaModel? meta,
    Object? warrantyInformation = $none,
    Object? shippingInformation = $none,
    Object? availabilityStatus = $none,
    List<ProductReviewModel>? reviews,
    Object? returnPolicy = $none,
    Object? minimumOrderQuantity = $none,
    Object? thumbnail = $none,
    Object? images = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (category != null) #category: category,
      if (price != null) #price: price,
      if (description != $none) #description: description,
      if (discountPercentage != $none) #discountPercentage: discountPercentage,
      if (rating != $none) #rating: rating,
      if (stock != $none) #stock: stock,
      if (tags != $none) #tags: tags,
      if (brand != $none) #brand: brand,
      if (sku != $none) #sku: sku,
      if (weight != $none) #weight: weight,
      #dimensions: dimensions,
      #meta: meta,
      if (warrantyInformation != $none)
        #warrantyInformation: warrantyInformation,
      if (shippingInformation != $none)
        #shippingInformation: shippingInformation,
      if (availabilityStatus != $none) #availabilityStatus: availabilityStatus,
      #reviews: reviews,
      if (returnPolicy != $none) #returnPolicy: returnPolicy,
      if (minimumOrderQuantity != $none)
        #minimumOrderQuantity: minimumOrderQuantity,
      if (thumbnail != $none) #thumbnail: thumbnail,
      if (images != $none) #images: images,
    }),
  );
  @override
  ProductModel $make(CopyWithData data) => ProductModel(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    category: data.get(#category, or: $value.category),
    price: data.get(#price, or: $value.price),
    description: data.get(#description, or: $value.description),
    discountPercentage: data.get(
      #discountPercentage,
      or: $value.discountPercentage,
    ),
    rating: data.get(#rating, or: $value.rating),
    stock: data.get(#stock, or: $value.stock),
    tags: data.get(#tags, or: $value.tags),
    brand: data.get(#brand, or: $value.brand),
    sku: data.get(#sku, or: $value.sku),
    weight: data.get(#weight, or: $value.weight),
    dimensions: data.get(#dimensions),
    meta: data.get(#meta),
    warrantyInformation: data.get(
      #warrantyInformation,
      or: $value.warrantyInformation,
    ),
    shippingInformation: data.get(
      #shippingInformation,
      or: $value.shippingInformation,
    ),
    availabilityStatus: data.get(
      #availabilityStatus,
      or: $value.availabilityStatus,
    ),
    reviews: data.get(#reviews),
    returnPolicy: data.get(#returnPolicy, or: $value.returnPolicy),
    minimumOrderQuantity: data.get(
      #minimumOrderQuantity,
      or: $value.minimumOrderQuantity,
    ),
    thumbnail: data.get(#thumbnail, or: $value.thumbnail),
    images: data.get(#images, or: $value.images),
  );

  @override
  ProductModelCopyWith<$R2, ProductModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProductModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

