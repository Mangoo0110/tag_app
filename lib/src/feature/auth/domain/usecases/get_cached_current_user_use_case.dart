import 'package:async_handler/async_handler.dart';
import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

final class GetCachedCurrentUserUseCase {
  const GetCachedCurrentUserUseCase(this._repository);

  final AuthRepository _repository;

  AsyncRequest<AuthUser?> call() => _repository.getCachedCurrentUser();
}

