import 'package:clean_architecture/core/constants/enum/alert_type.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/core/utils/extension/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppDialog {
  static final BuildContext? _context = AppNavigator.context;

  static void show({
    required Widget child,
    bool barrierDismissible = true,
    double? height,
    EdgeInsetsGeometry? padding = const EdgeInsets.all(10),
    VoidCallback? onDismissed,
  }) async {
    if (_context != null) {
      await showDialog(
        context: _context!,
        barrierDismissible: barrierDismissible,
        builder: (_) {
          return AlertDialog(
            contentPadding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Stack(
              children: [
                Container(
                  width: 100.width,
                  height: height ?? 40.height,
                  alignment: Alignment.center,
                  child: child,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      AppNavigator.pop();
                    },
                    child: const Icon(Icons.close, color: Colors.red),
                  ),
                ),
              ],
            ),
          );
        },
      );
      onDismissed?.call();
    }
  }

  static void alert({
    AlertType type = AlertType.success,
    String title = "",
    String desc = "",
    VoidCallback? onDismissed,
  }) {
    show(
      height: 30.height,
      onDismissed: onDismissed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          type.getIcon,
          const Gap(20),
          Text(
            title,
            style: _context?.textTheme.bodyLarge,
          ),
          Text(desc),
        ],
      ),
    );
  }
}
