import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/core/error/app_error.dart';

class ApiCallWithError {
  const ApiCallWithError._();

  static Future<Either<AppError, T>> call<T>(Future<T> Function() f) async {
    try {
      return Right(await f());
    } on SocketException {
      return const Left(AppError(type: AppErrorType.network));
    } on TimeoutException {
      return const Left(AppError(type: AppErrorType.timeout));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        // Silently handle cancellation - don't propagate as error
        // Return a special cancelled error that cubits can check for if needed
        return const Left(AppError(type: AppErrorType.cancelled, message: ''));
      }

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const Left(AppError(type: AppErrorType.timeout));
        case DioExceptionType.badResponse:
          {
            final String? error =
                e.response?.data is Map && e.response?.data['message'] != null
                ? e.response?.data['message']
                : null;

            if (e.response?.statusCode == 500) {
              return Left(
                AppError(
                  type: AppErrorType.api,
                  code: e.response?.statusCode,
                  message:
                      error ??
                      'Service unavailable, please try after sometime.',
                ),
              );
            }
            return Left(
              AppError(
                type: AppErrorType.api,
                code: e.response?.statusCode,
                message:
                    error ??
                    'Something went wrong. Please try again later.(${e.response?.statusCode})',
              ),
            );
          }

        case DioExceptionType.connectionError:
          return const Left(
            AppError(
              type: AppErrorType.network,
              message: 'Please check your internet connection.',
            ),
          );
        default:
          return const Left(AppError(type: AppErrorType.api));
      }
    } on Exception catch (e) {
      return Left(AppError(type: AppErrorType.api, message: e.toString()));
    }
  }
}
