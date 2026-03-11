import 'package:async_handler/async_handler.dart';
import '../entities/auth_user.dart';
import '../entities/login_entity.dart';

abstract interface class AuthRepository {
  AsyncRequest<LoginResponseEntity> login(LoginRequestEntity request);

  AsyncRequest<AuthUser> getCurrentUser();

  AsyncRequest<AuthUser?> getCachedCurrentUser();

  AsyncRequest<void> logout();

  Stream<bool> get isLoggedIn;
}
