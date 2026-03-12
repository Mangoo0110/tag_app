import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tag_app/src/app/app_manager.dart';
import 'package:tag_app/src/app/routing/app_router.dart';
import 'package:tag_app/src/core/local_db/hive_db.dart';
import 'src/di/repo_di.dart';
import 'src/core/themes/themes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runZonedGuarded(() async {
    
    WidgetsFlutterBinding.ensureInitialized();
    final path = await getApplicationCacheDirectory();
    Hive.init(path.path);

    initDependency();

    await HiveService().openBox(HiveBox.settings);
    await AppManager().loadThemePreference();

    runApp(const MyApp());
  }, (error, stack) {
    FlutterError.reportError(
      FlutterErrorDetails(exception: error, stack: stack),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState();
    
    AppManager().initialize();
  }
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppManager().themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Tag App',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: mode,
          onGenerateRoute: AppRouter.onGenerateRoute,
          builder: (context, child) {
            return child ?? const SizedBox.shrink();
          },
          home: Scaffold(
            body: Center(
              child: Text("Tag App", style: Theme.of(context).textTheme.headlineLarge,),
            )
          ),
          
        );
      },
    );
  }
}
