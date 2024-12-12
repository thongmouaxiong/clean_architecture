import 'package:clean_architecture/core/global/entities/app_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension DioErrrorExtension on DioException {
  AppError getError({String? title, String? defaultMsg}) {
    String? errMessage;

    final err = response?.data["data"].message ?? error;

    debugPrint("DEV: Dio Error $error");

    switch (err) {
      default:
        errMessage = defaultMsg;
    }

    return AppError(title: title, msg: errMessage);
  }
}
