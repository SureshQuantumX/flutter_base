import 'package:dio/dio.dart';
import 'package:flutter_base/core/api/auth_interceptor.dart';
import 'package:flutter_base/main.dart';
import 'package:injectable/injectable.dart';
import 'package:logarte/logarte.dart';

@LazySingleton()
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.interceptors.addAll([
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        responseHeader: false,
      ),
      LogarteDioInterceptor(logarte),
      AuthInterceptor(),
    ]);
  }

  // A helper to create headers for each request
  Map<String, dynamic> _createHeaders(
    Map<String, dynamic>? methodHeaders,
    bool requiresToken,
  ) {
    // Create a new map from the base options headers
    final requestHeaders = Map<String, dynamic>.from(_dio.options.headers);
    // Add method-specific headers
    if (methodHeaders != null) {
      requestHeaders.addAll(methodHeaders);
    }
    // Add the requiresToken flag for the interceptor
    requestHeaders['requiresToken'] = requiresToken;
    return requestHeaders;
  }

  // Corrected get method
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParams,
    bool requiresToken = false,
    Map<String, dynamic>? headers,
    bool shouldReturnDirectResult = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final requestHeaders = _createHeaders(headers, requiresToken);
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: requestHeaders),
        cancelToken: cancelToken,
      );

      if (shouldReturnDirectResult) {
        return response.data;
      }
      if (response.data is String || response.data is List) {
        return response.data;
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Errpor occurred',
      );
    } on DioException {
      rethrow;
    }
  }

  // Corrected post method
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParams,
    bool isFileUpload = false,
    FormData? formData,
    bool requiresToken = true,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    assert(
      isFileUpload ? formData != null : true,
      'formData is required for file upload',
    );
    try {
      final requestHeaders = _createHeaders(headers, requiresToken);
      final response = await _dio.post(
        path,
        queryParameters: queryParams,
        data: isFileUpload ? formData! : params,
        options: Options(headers: requestHeaders),
        cancelToken: cancelToken,
      );
      if (response.data is String || response.data is List) {
        return response.data;
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Errpor occurred',
      );
    } on DioException {
      rethrow;
    }
  }

  // Corrected put method
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParams,
    bool isFileUpload = false,
    FormData? formData,
    bool requiresToken = true,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    assert(
      isFileUpload ? formData != null : true,
      'formData is required for file upload',
    );
    try {
      final requestHeaders = _createHeaders(headers, requiresToken);
      final response = await _dio.put(
        path,
        queryParameters: queryParams,
        data: isFileUpload ? formData! : params,
        options: Options(headers: requestHeaders),
        cancelToken: cancelToken,
      );
      if (response.data is String || response.data is List) {
        return response.data;
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Errpor occurred',
      );
    } on DioException {
      rethrow;
    }
  }
}
