import 'package:flutter/material.dart';
import 'package:tag_app/src/di/auth_di.dart';
import 'package:tag_app/src/core/shared/reactive_notifier/snackbar_notifier.dart';
import 'package:tag_app/src/feature/auth/presentation/controllers/account_controller.dart';
import 'package:tag_app/src/feature/auth/presentation/views/login_view.dart';
import 'package:tag_app/src/app/app_manager.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  late final AccountController _accountController;
  final AppManager _appManager = AppManager();

  @override
  void initState() {
    super.initState();
    _accountController = authServiceLocatior<AccountController>();
    _accountController.loadCurrentUser();
  }

  Future<void> _logout() async {
    await _accountController.logout(
      errorSnackbarNotifier: SnackbarNotifier(context: context),
      successSnackbarNotifier: SnackbarNotifier(context: context),
    );
  }

  Future<void> _openLogin() async {
    final result = await Navigator.of(
      context,
    ).push<bool>(MaterialPageRoute(builder: (_) => const LoginView()));
    if ((result ?? false) && mounted) {
      await _accountController.loadCurrentUser(
        errorSnackbarNotifier: SnackbarNotifier(context: context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: AnimatedBuilder(
        animation: _accountController,
        builder: (context, _) {
          if (_accountController.isLoading &&
              _accountController.currentUser == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = _accountController.currentUser;
          if (user == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'You are not logged in',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: _openLogin,
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ValueListenableBuilder<ThemeMode>(
                valueListenable: _appManager.themeMode,
                builder: (context, mode, _) {
                  return SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Dark mode'),
                    subtitle: Text(
                      mode == ThemeMode.dark
                          ? 'Enabled'
                          : 'Disabled',
                    ),
                    value: mode == ThemeMode.dark,
                    onChanged: (value) {
                      _appManager.setThemeMode(
                        value ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  );
                },
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  user.fullName.isEmpty ? user.username : user.fullName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: const Text('Current user'),
              ),
              const Divider(),
              // network image
              if(user.imageUrl != null)Image.network(
                user.imageUrl!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: const Text('Username'),
                subtitle: Text(user.username),
              ),
              ListTile(title: const Text('Email'), subtitle: Text(user.email)),
              ListTile(title: const Text('Phone'), subtitle: Text(user.phone)),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: _accountController.isLoading ? null : _logout,
                child: const Text('Logout'),
              ),
            ],
          );
        },
      ),
    );
  }
}
