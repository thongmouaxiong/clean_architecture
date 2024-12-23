import 'package:clean_architecture/core/DI/dependency_injection.dart' as di;
import 'package:clean_architecture/features/home/presentation/pages/splash_screen.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/app_router.dart';
import 'package:clean_architecture/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  di.dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData(),
      home: const SplashScreen(),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
