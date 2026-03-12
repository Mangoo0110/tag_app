
import 'package:app_pigeon/app_pigeon.dart';
import 'package:flutter/material.dart';
import 'package:tag_app/src/di/auth_di.dart';
import 'package:tag_app/src/core/local_db/hive_db.dart';

import '../../main.dart';
import 'routing/route_names.dart';

class AppManager {
  static final AppManager _instance = AppManager._internal();
  /// Singleton
  factory AppManager() => _instance;
  AppManager._internal();

  bool _guestMode = false;
  bool get isGuestMode => _guestMode;

  ValueNotifier<AuthStatus?> currentAuth = ValueNotifier(null);
  final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);
  static const String _themeKey = 'theme_mode';

  Future<void> loadThemePreference() async {
    await HiveService().openBox(HiveBox.settings);
    final saved = HiveService().get<String>(HiveBox.settings, _themeKey);
    if (saved == ThemeMode.dark.name) {
      themeMode.value = ThemeMode.dark;
    } else if (saved == ThemeMode.system.name) {
      themeMode.value = ThemeMode.system;
    } else {
      themeMode.value = ThemeMode.light;
    }
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    HiveService().put<String>(HiveBox.settings, _themeKey, mode.name);
  }

  void initialize() async{
    // Initialization code here
    authServiceLocatior<AuthorizedPigeon>().authStream.listen(
      _onAuthChange,
      onError: (e)=> {
        debugPrint(e.toString()),
      }
    );
  }

  void _onAuthChange(AuthStatus? newAuth) async {
    debugPrint('Auth state changed: $newAuth');
    if (newAuth != null) {
      // Authenticated user
      currentAuth.value = newAuth;
      _guestMode = false;
      
      navigatorKey.currentState?.pushNamedAndRemoveUntil(RouteNames.app.path, (route) => false);
      _initializeGlobalDataProviders();
    } else {
        enterGuestMode();
      }
  }

  void enterGuestMode() {
    _guestMode = true;
    currentAuth.value = null;
    navigatorKey.currentState?.pushNamedAndRemoveUntil(RouteNames.guest.path, (route) => false);
  }

  void _initializeGlobalDataProviders() {

  }
}
