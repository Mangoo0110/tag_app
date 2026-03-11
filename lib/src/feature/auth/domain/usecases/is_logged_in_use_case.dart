import '../repositories/auth_repository.dart';

final class IsLoggedInUseCase {
  const IsLoggedInUseCase(this._repository);

  final AuthRepository _repository;

  Stream<bool> call() => _repository.isLoggedIn;
}
