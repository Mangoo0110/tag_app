// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_model.dart';

class PostModelMapper extends ClassMapperBase<PostModel> {
  PostModelMapper._();

  static PostModelMapper? _instance;
  static PostModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PostModel';

  static int _$id(PostModel v) => v.id;
  static const Field<PostModel, int> _f$id = Field('id', _$id);
  static String _$title(PostModel v) => v.title;
  static const Field<PostModel, String> _f$title = Field('title', _$title);
  static String _$body(PostModel v) => v.body;
  static const Field<PostModel, String> _f$body = Field('body', _$body);
  static int _$userId(PostModel v) => v.userId;
  static const Field<PostModel, int> _f$userId = Field('userId', _$userId);
  static List<String>? _$tags(PostModel v) => v.tags;
  static const Field<PostModel, List<String>> _f$tags = Field(
    'tags',
    _$tags,
    opt: true,
  );
  static dynamic _$reactions(PostModel v) => v.reactions;
  static const Field<PostModel, dynamic> _f$reactions = Field(
    'reactions',
    _$reactions,
    opt: true,
  );

  @override
  final MappableFields<PostModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #body: _f$body,
    #userId: _f$userId,
    #tags: _f$tags,
    #reactions: _f$reactions,
  };

  static PostModel _instantiate(DecodingData data) {
    return PostModel(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      body: data.dec(_f$body),
      userId: data.dec(_f$userId),
      tags: data.dec(_f$tags),
      reactions: data.dec(_f$reactions),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PostModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostModel>(map);
  }

  static PostModel fromJson(String json) {
    return ensureInitialized().decodeJson<PostModel>(json);
  }
}

mixin PostModelMappable {
  String toJson() {
    return PostModelMapper.ensureInitialized().encodeJson<PostModel>(
      this as PostModel,
    );
  }

  Map<String, dynamic> toMap() {
    return PostModelMapper.ensureInitialized().encodeMap<PostModel>(
      this as PostModel,
    );
  }

  PostModelCopyWith<PostModel, PostModel, PostModel> get copyWith =>
      _PostModelCopyWithImpl<PostModel, PostModel>(
        this as PostModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PostModelMapper.ensureInitialized().stringifyValue(
      this as PostModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return PostModelMapper.ensureInitialized().equalsValue(
      this as PostModel,
      other,
    );
  }

  @override
  int get hashCode {
    return PostModelMapper.ensureInitialized().hashValue(this as PostModel);
  }
}

extension PostModelValueCopy<$R, $Out> on ObjectCopyWith<$R, PostModel, $Out> {
  PostModelCopyWith<$R, PostModel, $Out> get $asPostModel =>
      $base.as((v, t, t2) => _PostModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PostModelCopyWith<$R, $In extends PostModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tags;
  $R call({
    int? id,
    String? title,
    String? body,
    int? userId,
    List<String>? tags,
    dynamic reactions,
  });
  PostModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostModel, $Out>
    implements PostModelCopyWith<$R, PostModel, $Out> {
  _PostModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostModel> $mapper =
      PostModelMapper.ensureInitialized();
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
  $R call({
    int? id,
    String? title,
    String? body,
    int? userId,
    Object? tags = $none,
    Object? reactions = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (body != null) #body: body,
      if (userId != null) #userId: userId,
      if (tags != $none) #tags: tags,
      if (reactions != $none) #reactions: reactions,
    }),
  );
  @override
  PostModel $make(CopyWithData data) => PostModel(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    body: data.get(#body, or: $value.body),
    userId: data.get(#userId, or: $value.userId),
    tags: data.get(#tags, or: $value.tags),
    reactions: data.get(#reactions, or: $value.reactions),
  );

  @override
  PostModelCopyWith<$R2, PostModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PostModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

