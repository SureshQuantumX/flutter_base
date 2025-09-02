import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      contentType: Headers.jsonContentType,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 30),
    ),
  );
}
