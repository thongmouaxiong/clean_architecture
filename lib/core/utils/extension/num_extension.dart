import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:flutter/widgets.dart';

extension DoubleExtension on num {
  num get _num => this;
  double get _deviceWidth => AppNavigator.context?.width ?? 0;
  double get _deviceHeight => AppNavigator.context?.height ?? 0;

  double get width => _num * 0.01 * _deviceWidth;
  double get height => _num * 0.01 * _deviceHeight;

  BorderRadiusGeometry cornerBorderRadius(double radius) {
    switch (_num) {
      case 0:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
        );
      case 1:
        return BorderRadius.only(
          topRight: Radius.circular(radius),
        );
      case 2:
        return BorderRadius.only(
          bottomLeft: Radius.circular(radius),
        );
      case 3:
        return BorderRadius.only(
          bottomRight: Radius.circular(radius),
        );
      default:
        return BorderRadius.zero;
    }
  }
}
