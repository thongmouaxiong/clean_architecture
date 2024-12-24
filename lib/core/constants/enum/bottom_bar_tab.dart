import 'package:flutter/material.dart';

enum BottomBarEnum {
  post,
  album;

  IconData get icon {
    switch (this) {
      case post:
        return Icons.home;
      case album:
        return Icons.photo;
    }
  }

  String get title {
    switch (this) {
      case post:
        return "Post";
      case album:
        return "Album";
    }
  }
}
