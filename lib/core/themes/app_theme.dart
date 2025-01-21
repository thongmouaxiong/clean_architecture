import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "NotoSansLao",
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300),
        displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w400),
        displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
        headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: Colors.blue,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.blue),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: Colors.blue.shade600,
          foregroundColor: Colors.white,
          minimumSize: Size(context.width, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          side: const BorderSide(color: Colors.blue, width: 1.8),
          foregroundColor: Colors.blue,
          minimumSize: Size(context.width, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
