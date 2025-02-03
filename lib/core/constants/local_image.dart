import 'package:flutter/material.dart';

class LocalImage {
  static const String _imagePath = "assets/images";

  static final Image google = Image.asset(
    "$_imagePath/google.png",
    width: 48,
    height: 48,
  );
  
  static final Image facebook = Image.asset(
    "$_imagePath/facebook.png",
    width: 48,
    height: 48,
  );
}
