import 'auth_user.dart';

sealed class LoginEntity {
  const LoginEntity();
}

class LoginRequestEntity extends LoginEntity {
  const LoginRequestEntity({
    required this.username,
    required this.password,
    this.shouldRemember = false,
  });

  final String username;
  final String password;
  final bool? shouldRemember;
}

class LoginResponseEntity extends LoginEntity {
  const LoginResponseEntity({this.user});

  final AuthUser? user;
}
