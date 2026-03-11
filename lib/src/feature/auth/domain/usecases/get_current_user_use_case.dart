import 'package:async_handler/async_handler.dart';
import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

final class GetCurrentUserUseCase {
  const GetCurrentUserUseCase(this._repository);

  final AuthRepository _repository;

  AsyncRequest<AuthUser> call() => _repository.getCurrentUser();
}

