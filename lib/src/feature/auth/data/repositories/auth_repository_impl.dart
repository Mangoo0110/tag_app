import 'package:async_handler/async_handler.dart';
import 'package:tag_app/src/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:tag_app/src/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tag_app/src/feature/auth/data/models/auth_user_model.dart';
import 'package:tag_app/src/feature/auth/data/models/login_response_model.dart';
import 'package:tag_app/src/feature/auth/domain/entities/auth_user.dart';
import 'package:tag_app/src/feature/auth/domain/entities/login_entity.dart';
import 'package:tag_app/src/feature/auth/domain/repositories/auth_repository.dart';

final class AuthRepositoryImpl with ErrorHandler implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remote,
    required AuthLocalDataSource local,
  }) : _remote = remote,
       _local = local;

  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  @override
  AsyncRequest<LoginResponseEntity> login(
    LoginRequestEntity request,
  ) => asyncTryCatch<LoginResponseEntity>(
    tryFunc: () async {
      final LoginResponseModel loginResponse = await _remote.login(request);
      final token = loginResponse.accessToken;
      if (token == null || token.isEmpty) {
        throw ServerException();
      }

      await _local.saveNewAuth(loginResponse);

      return SuccessResponse<LoginResponseEntity>(
        message: 'Login successful',
        data: loginResponse,
      );
    },
  );

  @override
  AsyncRequest<AuthUser> getCurrentUser() => asyncTryCatch<AuthUser>(
    tryFunc: () async {
      final current = await _local.getCurrentAuthRecord();
      if (current == null) {
        throw NoDataException();
      }

      final userMap = (current.data as Map?)?.cast<String, dynamic>();
      if (userMap == null) {
        throw NoDataException();
      }
      return SuccessResponse<AuthUser>(
        message: 'Fetched current user',
        data: AuthUserModel.fromMap(userMap),
      );
    },
  );

  @override
  AsyncRequest<AuthUser?> getCachedCurrentUser() => asyncTryCatch<AuthUser?>(
    tryFunc: () async {
      final current = await _local.getCurrentAuthRecord();
      if (current == null) {
        return SuccessResponse<AuthUser?>(
          message: 'No cached user',
          data: null,
        );
      }

      final userMap = (current.data as Map?)?.cast<String, dynamic>();
      if (userMap == null) {
        return SuccessResponse<AuthUser?>(
          message: 'No cached user',
          data: null,
        );
      }
      return SuccessResponse<AuthUser?>(
        message: 'Fetched cached user',
        data: AuthUserModel.fromMap(userMap),
      );
    },
  );

  @override
  AsyncRequest<void> logout() => asyncTryCatch<void>(
    tryFunc: () async {
      await _local.logOut();
      return SuccessResponse<void>(message: 'Logged out', data: null);
    },
  );
  
  @override
  Stream<bool> get isLoggedIn => _local.isLoggedIn;

  
}
