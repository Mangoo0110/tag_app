// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_response_model.dart';

class LoginResponseModelMapper extends ClassMapperBase<LoginResponseModel> {
  LoginResponseModelMapper._();

  static LoginResponseModelMapper? _instance;
  static LoginResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginResponseModelMapper._());
      AuthUserModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoginResponseModel';

  static String? _$accessToken(LoginResponseModel v) => v.accessToken;
  static const Field<LoginResponseModel, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
  );
  static String? _$refreshToken(LoginResponseModel v) => v.refreshToken;
  static const Field<LoginResponseModel, String> _f$refreshToken = Field(
    'refreshToken',
    _$refreshToken,
  );
  static const Field<LoginResponseModel, AuthUserModel> _f$user = Field(
    'user',
    null,
    mode: FieldMode.param,
    opt: true,
  );

  @override
  final MappableFields<LoginResponseModel> fields = const {
    #accessToken: _f$accessToken,
    #refreshToken: _f$refreshToken,
    #user: _f$user,
  };

  static LoginResponseModel _instantiate(DecodingData data) {
    return LoginResponseModel(
      accessToken: data.dec(_f$accessToken),
      refreshToken: data.dec(_f$refreshToken),
      user: data.dec(_f$user),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LoginResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginResponseModel>(map);
  }

  static LoginResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<LoginResponseModel>(json);
  }
}

mixin LoginResponseModelMappable {
  String toJson() {
    return LoginResponseModelMapper.ensureInitialized()
        .encodeJson<LoginResponseModel>(this as LoginResponseModel);
  }

  Map<String, dynamic> toMap() {
    return LoginResponseModelMapper.ensureInitialized()
        .encodeMap<LoginResponseModel>(this as LoginResponseModel);
  }

  LoginResponseModelCopyWith<
    LoginResponseModel,
    LoginResponseModel,
    LoginResponseModel
  >
  get copyWith =>
      _LoginResponseModelCopyWithImpl<LoginResponseModel, LoginResponseModel>(
        this as LoginResponseModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LoginResponseModelMapper.ensureInitialized().stringifyValue(
      this as LoginResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoginResponseModelMapper.ensureInitialized().equalsValue(
      this as LoginResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return LoginResponseModelMapper.ensureInitialized().hashValue(
      this as LoginResponseModel,
    );
  }
}

extension LoginResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginResponseModel, $Out> {
  LoginResponseModelCopyWith<$R, LoginResponseModel, $Out>
  get $asLoginResponseModel => $base.as(
    (v, t, t2) => _LoginResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class LoginResponseModelCopyWith<
  $R,
  $In extends LoginResponseModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken, String? refreshToken, AuthUserModel? user});
  LoginResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _LoginResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginResponseModel, $Out>
    implements LoginResponseModelCopyWith<$R, LoginResponseModel, $Out> {
  _LoginResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginResponseModel> $mapper =
      LoginResponseModelMapper.ensureInitialized();
  @override
  $R call({
    Object? accessToken = $none,
    Object? refreshToken = $none,
    AuthUserModel? user,
  }) => $apply(
    FieldCopyWithData({
      if (accessToken != $none) #accessToken: accessToken,
      if (refreshToken != $none) #refreshToken: refreshToken,
      #user: user,
    }),
  );
  @override
  LoginResponseModel $make(CopyWithData data) => LoginResponseModel(
    accessToken: data.get(#accessToken, or: $value.accessToken),
    refreshToken: data.get(#refreshToken, or: $value.refreshToken),
    user: data.get(#user),
  );

  @override
  LoginResponseModelCopyWith<$R2, LoginResponseModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LoginResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

