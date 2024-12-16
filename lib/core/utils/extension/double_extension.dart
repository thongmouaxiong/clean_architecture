import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/utils/extension/context_extension.dart';

extension DoubleExtension on num {
  num get _num => this;
  double get _deviceWidth => AppNavigator.context?.width ?? 0;
  double get _deviceHeight => AppNavigator.context?.height ?? 0;

  double get width => _num * 0.01 * _deviceWidth;
  double get height => _num * 0.01 * _deviceHeight;
}
