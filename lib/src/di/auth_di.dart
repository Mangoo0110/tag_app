import 'package:app_pigeon/app_pigeon.dart';
import 'package:get_it/get_it.dart';
import 'package:tag_app/src/core/constants/api_endpoints.dart';
import 'package:tag_app/src/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:tag_app/src/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tag_app/src/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:tag_app/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:tag_app/src/feature/auth/domain/usecases/get_cached_current_user_use_case.dart';
import 'package:tag_app/src/feature/auth/domain/usecases/get_current_user_use_case.dart';
import 'package:tag_app/src/feature/auth/domain/usecases/is_logged_in_use_case.dart';
import 'package:tag_app/src/feature/auth/domain/usecases/login_use_case.dart';
import 'package:tag_app/src/feature/auth/domain/usecases/logout_use_case.dart';
import 'package:tag_app/src/feature/auth/presentation/controllers/account_controller.dart';
import 'package:tag_app/src/feature/auth/presentation/controllers/login_controller.dart';

final authServiceLocatior = GetIt.instance;

void setupAuthLocator() {
  if (!authServiceLocatior.isRegistered<AuthorizedPigeon>()) {
    authServiceLocatior.registerLazySingleton<AuthorizedPigeon>(
      () => AuthorizedPigeon(
        BasicRefreshTokenManager(ApiEndpoints.refresh),
        baseUrl: ApiEndpoints.baseUrl,
      ),
    );
  }

  if (!authServiceLocatior.isRegistered<AuthRemoteDataSource>()) {
    authServiceLocatior.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(authServiceLocatior<AuthorizedPigeon>()),
    );
  }

  if (!authServiceLocatior.isRegistered<AuthLocalDataSource>()) {
    authServiceLocatior.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(authServiceLocatior<AuthorizedPigeon>()),
    );
  }

  if (!authServiceLocatior.isRegistered<AuthRepository>()) {
    authServiceLocatior.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remote: authServiceLocatior<AuthRemoteDataSource>(),
        local: authServiceLocatior<AuthLocalDataSource>(),
      ),
    );
  }

  if (!authServiceLocatior.isRegistered<LoginUseCase>()) {
    authServiceLocatior.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authServiceLocatior<AuthRepository>()),
    );
  }

  if (!authServiceLocatior.isRegistered<GetCurrentUserUseCase>()) {
    authServiceLocatior.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(authServiceLocatior<AuthRepository>()),
    );
  }

  if (!authServiceLocatior.isRegistered<GetCachedCurrentUserUseCase>()) {
    authServiceLocatior.registerLazySingleton<GetCachedCurrentUserUseCase>(
      () => GetCachedCurrentUserUseCase(authServiceLocatior<AuthRepository>()),
    );
  }

  if (!authServiceLocatior.isRegistered<LogoutUseCase>()) {
    authServiceLocatior.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(authServiceLocatior<AuthRepository>()),
    );
  }

  if (!authServiceLocatior.isRegistered<IsLoggedInUseCase>()) {
    authServiceLocatior.registerLazySingleton<IsLoggedInUseCase>(
      () => IsLoggedInUseCase(authServiceLocatior<AuthRepository>()),
    );
  }

  if (!authServiceLocatior.isRegistered<LoginController>()) {
    authServiceLocatior.registerLazySingleton<LoginController>(
      () => LoginController(authServiceLocatior<LoginUseCase>()),
    );
  }

  if (!authServiceLocatior.isRegistered<AccountController>()) {
    authServiceLocatior.registerLazySingleton<AccountController>(
      () => AccountController(
        getCurrentUser: authServiceLocatior<GetCurrentUserUseCase>(),
        logout: authServiceLocatior<LogoutUseCase>(),
      ),
    );
  }
}
