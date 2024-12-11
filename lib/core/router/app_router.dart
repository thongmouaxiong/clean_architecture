import 'package:flutter/material.dart';

class AppRouter {
  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("Not found page for ${settings.name}"),
            ),
          );
        });
    }
  }
}
