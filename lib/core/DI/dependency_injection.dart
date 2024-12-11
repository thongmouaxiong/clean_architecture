import 'package:clean_architecture/core/constants/api_path.dart';
import 'package:clean_architecture/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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

  sl.init();
}
