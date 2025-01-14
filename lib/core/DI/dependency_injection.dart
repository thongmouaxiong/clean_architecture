import 'dart:io';

import 'package:clean_architecture/core/constants/api_path.dart';
import 'package:clean_architecture/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
)
void dependencyInjection() async {
  WidgetsFlutterBinding.ensureInitialized();

  Dio dio = Dio(BaseOptions(baseUrl: ApiPath.baseUrl));

  sl.registerLazySingleton<Dio>(() => dio);

  sl.registerLazySingleton<ApiService>(() {
    return ApiService(dio, baseUrl: ApiPath.baseUrl);
  });

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ["email"],
  );

  if (Platform.isIOS) {
    googleSignIn = GoogleSignIn(
      clientId:
          "412395246624-cs4m24sssa9agkama6c9m62qj39mit69.apps.googleusercontent.com",
      scopes: [
        'email',
      ],
    );
  }

  sl.registerLazySingleton<GoogleSignIn>(() => googleSignIn);

  sl.init();
}
