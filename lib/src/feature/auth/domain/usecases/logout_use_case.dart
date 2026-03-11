import 'package:async_handler/async_handler.dart';
import '../repositories/auth_repository.dart';

final class LogoutUseCase {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  AsyncRequest<void> call() => _repository.logout();
}

