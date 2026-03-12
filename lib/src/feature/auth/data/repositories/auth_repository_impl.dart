import 'dart:io';
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
      try {
        final current = await _remote.getCurrentUser();
        return SuccessResponse<AuthUser>(
          message: 'Fetched current user',
          data: current,
        );
      } catch (e) {
        if (_isNetworkError(e)) {
          final cached = await _local.getCurrentAuthRecord();
          final userMap = (cached?.data as Map?)?.cast<String, dynamic>();
          if (userMap != null) {
            return SuccessResponse<AuthUser>(
              message: 'Fetched cached user (offline)',
              data: AuthUserModel.fromMap(userMap),
            );
          }
        }
        if (e is Exception) {
          rethrow;
        }
        throw ServerException();
      }
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

bool _isNetworkError(Object error) {
  if (error is SocketException) return true;
  if (error.runtimeType.toString() == 'DioException') {
    try {
      final dynamic e = error;
      final dynamic inner = e.error;
      if (inner is SocketException) return true;
      final typeName = e.type?.toString() ?? '';
      if (typeName.contains('connectionTimeout') ||
          typeName.contains('receiveTimeout') ||
          typeName.contains('sendTimeout') ||
          typeName.contains('connectionError')) {
        return true;
      }
    } catch (_) {}
  }
  return false;
}
