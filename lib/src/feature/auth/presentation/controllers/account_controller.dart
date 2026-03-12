import 'package:flutter/foundation.dart';
import 'package:tag_app/src/core/shared/reactive_notifier/snackbar_notifier.dart';
import 'package:tag_app/src/core/utils/helpers/handle_future_request.dart';
import 'package:tag_app/src/core/usecase/usecase.dart';
import 'package:tag_app/src/feature/auth/domain/entities/auth_user.dart';
import 'package:tag_app/src/feature/auth/domain/usecases/get_current_user_use_case.dart';
import 'package:tag_app/src/feature/auth/domain/usecases/logout_use_case.dart';

final class AccountController extends ChangeNotifier {
  AccountController({
    required GetCurrentUserUseCase getCurrentUser,
    required LogoutUseCase logout,
  }) : _getCurrentUser = getCurrentUser,
       _logout = logout;

  final GetCurrentUserUseCase _getCurrentUser;
  final LogoutUseCase _logout;

  AuthUser? _currentUser;
  bool _isLoading = false;

  AuthUser? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  Future<void> loadCurrentUser({
    SnackbarNotifier? errorSnackbarNotifier,
  }) async {
    _isLoading = true;
    notifyListeners();

    _currentUser = await handleFutureRequest<AuthUser>(
      futureRequest: () => _getCurrentUser(NoParams()),
      errorSnackbarNotifier: errorSnackbarNotifier,
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout({
    required SnackbarNotifier errorSnackbarNotifier,
    SnackbarNotifier? successSnackbarNotifier,
  }) async {
    _isLoading = true;
    notifyListeners();

    await handleFutureRequest<void>(
      futureRequest: () => _logout(NoParams()),
      errorSnackbarNotifier: errorSnackbarNotifier,
      successSnackbarNotifier: successSnackbarNotifier,
      onSuccess: (_) {
        _currentUser = null;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
