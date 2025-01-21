import 'dart:io';

import 'package:clean_architecture/core/constants/api_path.dart';
import 'package:clean_architecture/core/services/api_service.dart';
import 'package:clean_architecture/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  sl.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.init();
}
