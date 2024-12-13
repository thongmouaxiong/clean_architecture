import 'dart:async';

import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      AppNavigator.pushNamed(routeName: RouteName.postPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/images/splash_screen.json"),
      ),
    );
  }
}
