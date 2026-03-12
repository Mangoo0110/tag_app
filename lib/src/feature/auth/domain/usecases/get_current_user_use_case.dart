import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

final class GetCurrentUserUseCase implements AsyncUsecase<AuthUser, NoParams> {
  const GetCurrentUserUseCase(this._repository);

  final AuthRepository _repository;

  @override
  AsyncRequest<AuthUser> call(NoParams params) => _repository.getCurrentUser();
}
