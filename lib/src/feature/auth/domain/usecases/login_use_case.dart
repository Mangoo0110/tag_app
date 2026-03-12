import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repository.dart';

final class LoginUseCase implements AsyncUsecase<LoginResponseEntity, LoginRequestEntity>{
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  @override
  AsyncRequest<LoginResponseEntity> call(LoginRequestEntity request) =>
      _repository.login(request);
}
