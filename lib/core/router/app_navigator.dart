import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get state => navigatorKey.currentState;

  static BuildContext? get context => state?.overlay?.context;

  static Future<T?>? pushNamed<T extends Object?>({
    required String routeName,
    Object? arguments,
  }) {
    return state?.pushNamed(routeName, arguments: arguments);
  }

  static Future<T?>? pushNamedAndRemoveUntil<T extends Object?>({
    required String newRouteName,
    required bool Function(Route<dynamic>) predicate,
    Object? arguments,
  }) {
    return state?.pushNamedAndRemoveUntil(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  static Future<T?>?
      pushReplacementNamed<T extends Object?, TO extends Object?>({
    required String routeName,
    TO? result,
    Object? arguments,
  }) {
    return state?.pushReplacementNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  static void pop<T extends Object?>([T? result]) {
    if (state?.canPop() == true) {
      state?.pop(result);
    }
  }

  static void popUntil(bool Function(Route<dynamic>) predicate) {
    state?.popUntil(predicate);
  }

  static Future<T?>? popAndPushNamed<T extends Object?, TO extends Object?>({
    required String routeName,
    TO? result,
    Object? arguments,
  }) {
    return state?.popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }
}
