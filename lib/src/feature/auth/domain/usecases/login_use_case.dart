import 'package:async_handler/async_handler.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repository.dart';

final class LoginUseCase {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  AsyncRequest<LoginResponseEntity> call(LoginRequestEntity request) =>
      _repository.login(request);
}
