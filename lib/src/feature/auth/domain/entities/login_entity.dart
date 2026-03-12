import 'auth_user.dart';

sealed class LoginEntity {
  const LoginEntity();
}

class LoginRequestEntity extends LoginEntity {
  const LoginRequestEntity({
    required this.username,
    required this.password,
    this.expiresIn = 10,
  });

  final String username;
  final String password;
  final int? expiresIn;
}

class LoginResponseEntity extends LoginEntity {
  const LoginResponseEntity({this.user});

  final AuthUser? user;
}
