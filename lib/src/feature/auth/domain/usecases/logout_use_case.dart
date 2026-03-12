import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

final class LogoutUseCase implements AsyncUsecase<void, NoParams> {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  AsyncRequest<void> call(NoParams params) => _repository.logout();
}
