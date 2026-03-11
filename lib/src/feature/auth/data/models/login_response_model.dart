import 'package:dart_mappable/dart_mappable.dart';
import '../../domain/entities/login_entity.dart';
import 'auth_user_model.dart';

part 'login_response_model.mapper.dart';

@MappableClass()
class LoginResponseModel extends LoginResponseEntity
    with LoginResponseModelMappable {
  const LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    AuthUserModel? user,
  }) : super(user: user);

  final String? accessToken;
  final String? refreshToken;

  AuthUserModel? get authenticatedUser =>
      user is AuthUserModel ? user as AuthUserModel : null;

  factory LoginResponseModel.fromEntity(
    LoginResponseEntity entity, {
    String? accessToken,
    String? refreshToken,
  }) {
    final user = entity.user == null
        ? null
        : AuthUserModel.fromEntity(entity.user!);
    return LoginResponseModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user,
    );
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) {
    final accessToken = json['accessToken'] as String? ?? json['token'] as String?;
    final refreshToken = json['refreshToken'] as String?;
    final rawUser = json['user'];
    AuthUserModel? user;
    if (rawUser is Map) {
      user = AuthUserModel.fromMap(rawUser.cast<String, dynamic>());
    } else {
      final hasUserFields =
          json.containsKey('id') ||
          json.containsKey('username') ||
          json.containsKey('email') ||
          json.containsKey('firstName') ||
          json.containsKey('lastName');
      user = hasUserFields ? AuthUserModel.fromMap(json) : null;
    }
    return LoginResponseModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user,
    );
  }
}
