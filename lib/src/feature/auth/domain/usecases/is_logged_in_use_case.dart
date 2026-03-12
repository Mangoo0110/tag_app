import 'package:tag_app/src/core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

final class IsLoggedInUseCase implements Usecase<Stream<bool>, NoParams> {
  const IsLoggedInUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Stream<bool> call(NoParams params) => _repository.isLoggedIn;
}
