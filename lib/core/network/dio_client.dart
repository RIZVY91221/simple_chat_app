import 'package:app_base_flutter/core/network/exceptions/api_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/app_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/bad_request_exceptions.dart';
import 'package:app_base_flutter/core/network/exceptions/network_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/timeout_exception.dart';
import 'package:app_base_flutter/core/uttils/endpoints/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  // dio instance
  final Dio _dio;
  //final BaseLocalDataSource _baseLocalDataSource;
  bool isExpiredToken = false;

  // injecting dio instance
  DioClient(this._dio);

  // Get:----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      return _handleError(uri, e);
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      return _handleError(uri, e);
    }
  }

  // Put:----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      return _handleError(uri, e);
    }
  }

  // delete:----------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      return _handleError(uri, e);
    }
  }

  // download:----------------------------------------------------------------------
  Future<dynamic> download(String uri, String savePath,
      {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      final Response response = await _dio.download(
        uri,
        savePath,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      return _handleError(uri, e);
    }
  }

  _handleError(String uri, e) async {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.badResponse:
          if ((e.response?.statusCode == 409 || e.response?.statusCode == 401)) {
            if (!isExpiredToken) {
              isExpiredToken = true;
            }
          } else if (e.response?.statusCode == 417) {
            throw ApiException(httpCode: e.response?.statusCode ?? 417, status: '417', message: e.response?.data["message"]);
          } else {
            throw BadRequestException(statusCode: e.response?.statusCode, message: e.response?.data["message"]);
          }
          break;
        case DioExceptionType.cancel:
          throw AppException(message: "Request to API server was cancelled");
        case DioExceptionType.connectionError:
          throw NetworkException("There is no internet connection");
        case DioExceptionType.receiveTimeout:
          throw TimeoutException("Receive timeout in connection with API server");
        case DioExceptionType.sendTimeout:
          throw TimeoutException("Send timeout in connection with API server");
        default:
          throw e;
      }
    } else {
      throw e;
    }
  }
}
