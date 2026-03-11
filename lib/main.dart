import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tag_app/src/app/app_manager.dart';
import 'package:tag_app/src/app/routing/app_router.dart';
import 'package:tag_app/src/di/auth_di.dart';
import 'package:tag_app/src/feature/post/post_di.dart';
import 'package:tag_app/src/feature/post/presentation/views/post_view.dart';
import 'src/di/repo_di.dart';
import 'src/core/themes/themes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = await getApplicationCacheDirectory();
  Hive.init(path.path);
  repoDi();
  setupAuthLocator();
  setupPostLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    // debugPrint('Firebase Api Key Android: $firebaseApiKeyAndroid');
    // debugPrint('Firebase Api Key iOS: $firebaseApiKeyIos');
    // debugPrint('Firebase App ID Android: $firebaseAppIdAndroid');
    super.initState();
    
    AppManager().initialize();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tag App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter.onGenerateRoute,
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
      home: const PostView(),
      
    );
  }
}
