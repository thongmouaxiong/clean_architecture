import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  BuildContext get _context => this;

  ThemeData get themeData => Theme.of(_context);

  TextTheme get textTheme => themeData.textTheme;

  double get width => MediaQuery.of(_context).size.width;

  double get height => MediaQuery.of(_context).size.height;

  ElevatedButtonThemeData get elevatedButtonTheme =>
      themeData.elevatedButtonTheme;

  OutlinedButtonThemeData get outlinedButtonTheme =>
      themeData.outlinedButtonTheme;
}
