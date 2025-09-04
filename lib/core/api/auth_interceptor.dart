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
  ) async {
    // // Example: check if token required
    // if (options.headers['requiresToken'] == true) {
    //   // attach token if you have
    //   options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
    // }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
