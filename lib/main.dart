import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/app_router.dart';
import 'package:clean_architecture/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      theme: AppTheme.themeData(),
      home: const Scaffold(
        body: Center(
          child: Text("Home page"),
        ),
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
