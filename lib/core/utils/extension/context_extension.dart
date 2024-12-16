import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  BuildContext get _context => this;

  TextTheme get textTheme => Theme.of(_context).textTheme;

  double get width => MediaQuery.of(_context).size.width;

  double get height => MediaQuery.of(_context).size.height;
}
