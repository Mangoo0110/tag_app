import 'package:flutter/material.dart';
import 'package:tag_app/src/feature/post/presentation/views/post_view.dart';

import '../../di/repo_di.dart';
import '../../feature/auth/presentation/views/account_view.dart';
import 'home/home_view.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final ValueNotifier<int> _index = ValueNotifier<int>(0);
  // final CartStore _cartStore = serviceLocator<CartStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _index,
      builder: (context, selectedIndex, _) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: selectedIndex,
              children: [HomeView(), PostView(), AccountView()],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) => _index.value = value,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.public_outlined),
                selectedIcon: Icon(Icons.public),
                label: 'Posts',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person_rounded),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
