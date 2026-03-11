// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_comment_model.dart';

class PostCommentModelMapper extends ClassMapperBase<PostCommentModel> {
  PostCommentModelMapper._();

  static PostCommentModelMapper? _instance;
  static PostCommentModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostCommentModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PostCommentModel';

  static int _$id(PostCommentModel v) => v.id;
  static const Field<PostCommentModel, int> _f$id = Field('id', _$id);
  static String _$body(PostCommentModel v) => v.body;
  static const Field<PostCommentModel, String> _f$body = Field('body', _$body);
  static int _$postId(PostCommentModel v) => v.postId;
  static const Field<PostCommentModel, int> _f$postId = Field(
    'postId',
    _$postId,
  );
  static int _$userId(PostCommentModel v) => v.userId;
  static const Field<PostCommentModel, int> _f$userId = Field(
    'userId',
    _$userId,
  );
  static String? _$username(PostCommentModel v) => v.username;
  static const Field<PostCommentModel, String> _f$username = Field(
    'username',
    _$username,
    opt: true,
  );

  @override
  final MappableFields<PostCommentModel> fields = const {
    #id: _f$id,
    #body: _f$body,
    #postId: _f$postId,
    #userId: _f$userId,
    #username: _f$username,
  };

  static PostCommentModel _instantiate(DecodingData data) {
    return PostCommentModel(
      id: data.dec(_f$id),
      body: data.dec(_f$body),
      postId: data.dec(_f$postId),
      userId: data.dec(_f$userId),
      username: data.dec(_f$username),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PostCommentModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostCommentModel>(map);
  }

  static PostCommentModel fromJson(String json) {
    return ensureInitialized().decodeJson<PostCommentModel>(json);
  }
}

mixin PostCommentModelMappable {
  String toJson() {
    return PostCommentModelMapper.ensureInitialized()
        .encodeJson<PostCommentModel>(this as PostCommentModel);
  }

  Map<String, dynamic> toMap() {
    return PostCommentModelMapper.ensureInitialized()
        .encodeMap<PostCommentModel>(this as PostCommentModel);
  }

  PostCommentModelCopyWith<PostCommentModel, PostCommentModel, PostCommentModel>
  get copyWith =>
      _PostCommentModelCopyWithImpl<PostCommentModel, PostCommentModel>(
        this as PostCommentModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PostCommentModelMapper.ensureInitialized().stringifyValue(
      this as PostCommentModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return PostCommentModelMapper.ensureInitialized().equalsValue(
      this as PostCommentModel,
      other,
    );
  }

  @override
  int get hashCode {
    return PostCommentModelMapper.ensureInitialized().hashValue(
      this as PostCommentModel,
    );
  }
}

extension PostCommentModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PostCommentModel, $Out> {
  PostCommentModelCopyWith<$R, PostCommentModel, $Out>
  get $asPostCommentModel =>
      $base.as((v, t, t2) => _PostCommentModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PostCommentModelCopyWith<$R, $In extends PostCommentModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? body, int? postId, int? userId, String? username});
  PostCommentModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PostCommentModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostCommentModel, $Out>
    implements PostCommentModelCopyWith<$R, PostCommentModel, $Out> {
  _PostCommentModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostCommentModel> $mapper =
      PostCommentModelMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? body,
    int? postId,
    int? userId,
    Object? username = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (body != null) #body: body,
      if (postId != null) #postId: postId,
      if (userId != null) #userId: userId,
      if (username != $none) #username: username,
    }),
  );
  @override
  PostCommentModel $make(CopyWithData data) => PostCommentModel(
    id: data.get(#id, or: $value.id),
    body: data.get(#body, or: $value.body),
    postId: data.get(#postId, or: $value.postId),
    userId: data.get(#userId, or: $value.userId),
    username: data.get(#username, or: $value.username),
  );

  @override
  PostCommentModelCopyWith<$R2, PostCommentModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PostCommentModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

