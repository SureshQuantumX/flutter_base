import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

class AuthInterceptor extends QueuedInterceptor {
  late final Dio _dio;
  // final AuthLocalDataSource _authLocalDataSource;

  AuthInterceptor() {
    _dio = Dio();
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: kDebugMode,
        requestBody: kDebugMode,
        error: kDebugMode,
        request: kDebugMode,
      ),
    );
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {}

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}
}
