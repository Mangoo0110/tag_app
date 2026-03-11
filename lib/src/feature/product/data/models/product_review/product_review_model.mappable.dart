// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_review_model.dart';

class ProductReviewModelMapper extends ClassMapperBase<ProductReviewModel> {
  ProductReviewModelMapper._();

  static ProductReviewModelMapper? _instance;
  static ProductReviewModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductReviewModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductReviewModel';

  static int _$rating(ProductReviewModel v) => v.rating;
  static const Field<ProductReviewModel, int> _f$rating = Field(
    'rating',
    _$rating,
  );
  static String _$comment(ProductReviewModel v) => v.comment;
  static const Field<ProductReviewModel, String> _f$comment = Field(
    'comment',
    _$comment,
  );
  static DateTime _$date(ProductReviewModel v) => v.date;
  static const Field<ProductReviewModel, DateTime> _f$date = Field(
    'date',
    _$date,
  );
  static String _$reviewerName(ProductReviewModel v) => v.reviewerName;
  static const Field<ProductReviewModel, String> _f$reviewerName = Field(
    'reviewerName',
    _$reviewerName,
  );
  static String _$reviewerEmail(ProductReviewModel v) => v.reviewerEmail;
  static const Field<ProductReviewModel, String> _f$reviewerEmail = Field(
    'reviewerEmail',
    _$reviewerEmail,
  );

  @override
  final MappableFields<ProductReviewModel> fields = const {
    #rating: _f$rating,
    #comment: _f$comment,
    #date: _f$date,
    #reviewerName: _f$reviewerName,
    #reviewerEmail: _f$reviewerEmail,
  };

  static ProductReviewModel _instantiate(DecodingData data) {
    return ProductReviewModel(
      rating: data.dec(_f$rating),
      comment: data.dec(_f$comment),
      date: data.dec(_f$date),
      reviewerName: data.dec(_f$reviewerName),
      reviewerEmail: data.dec(_f$reviewerEmail),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProductReviewModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductReviewModel>(map);
  }

  static ProductReviewModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProductReviewModel>(json);
  }
}

mixin ProductReviewModelMappable {
  String toJson() {
    return ProductReviewModelMapper.ensureInitialized()
        .encodeJson<ProductReviewModel>(this as ProductReviewModel);
  }

  Map<String, dynamic> toMap() {
    return ProductReviewModelMapper.ensureInitialized()
        .encodeMap<ProductReviewModel>(this as ProductReviewModel);
  }

  ProductReviewModelCopyWith<
    ProductReviewModel,
    ProductReviewModel,
    ProductReviewModel
  >
  get copyWith =>
      _ProductReviewModelCopyWithImpl<ProductReviewModel, ProductReviewModel>(
        this as ProductReviewModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProductReviewModelMapper.ensureInitialized().stringifyValue(
      this as ProductReviewModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProductReviewModelMapper.ensureInitialized().equalsValue(
      this as ProductReviewModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ProductReviewModelMapper.ensureInitialized().hashValue(
      this as ProductReviewModel,
    );
  }
}

extension ProductReviewModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductReviewModel, $Out> {
  ProductReviewModelCopyWith<$R, ProductReviewModel, $Out>
  get $asProductReviewModel => $base.as(
    (v, t, t2) => _ProductReviewModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ProductReviewModelCopyWith<
  $R,
  $In extends ProductReviewModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  });
  ProductReviewModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProductReviewModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductReviewModel, $Out>
    implements ProductReviewModelCopyWith<$R, ProductReviewModel, $Out> {
  _ProductReviewModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductReviewModel> $mapper =
      ProductReviewModelMapper.ensureInitialized();
  @override
  $R call({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) => $apply(
    FieldCopyWithData({
      if (rating != null) #rating: rating,
      if (comment != null) #comment: comment,
      if (date != null) #date: date,
      if (reviewerName != null) #reviewerName: reviewerName,
      if (reviewerEmail != null) #reviewerEmail: reviewerEmail,
    }),
  );
  @override
  ProductReviewModel $make(CopyWithData data) => ProductReviewModel(
    rating: data.get(#rating, or: $value.rating),
    comment: data.get(#comment, or: $value.comment),
    date: data.get(#date, or: $value.date),
    reviewerName: data.get(#reviewerName, or: $value.reviewerName),
    reviewerEmail: data.get(#reviewerEmail, or: $value.reviewerEmail),
  );

  @override
  ProductReviewModelCopyWith<$R2, ProductReviewModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProductReviewModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

