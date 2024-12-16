import 'package:flutter/material.dart';

enum AlertType {
  success,
  error,
  warning;

  Color get getColor {
    switch (this) {
      case success:
        return Colors.green.shade400;
      case error:
        return Colors.red.shade400;
      case warning:
        return Colors.amber.shade400;
    }
  }

  Icon get getIcon {
    switch (this) {
      case success:
        return Icon(
          Icons.check_circle_rounded,
          color: getColor,
          size: 64,
        );
      case error:
        return Icon(
          Icons.error_rounded,
          color: getColor,
          size: 64,
        );
      case warning:
        return Icon(
          Icons.warning_rounded,
          color: getColor,
          size: 64,
        );
    }
  }
}
