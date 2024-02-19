import 'dart:io';

import 'package:app_base_flutter/core/uttils/endpoints/endpoints.dart';
import 'package:app_base_flutter/datasource/local_data_source/base_local_source.dart';
import 'package:app_base_flutter/datasource/shared_preference_data_source/base_shared_prefrence.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  // ignore: non_constant_identifier_names
  final String TAG = "NetworkModule";
  //Proxy
  //String proxy = Platform.isAndroid ? '192.168.0.111:8888' : 'localhost:8888';

  // DI Providers:--------------------------------------------------------------
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  @lazySingleton
  Dio provideDio(BaseSharedPreference sharedPrefHelper, BaseLocalDataSource baseLocalDataSource) {
    final dio = Dio();
    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = const Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout = const Duration(milliseconds: Endpoints.receiveTimeout)
      ..options.sendTimeout = const Duration(milliseconds: Endpoints.sendTimeout)
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
        'source': Endpoints.source,
      }
      ..interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          handler.next(options);
        }, onError: (DioException e, ErrorInterceptorHandler handler) async {
          switch (e.type) {
            case DioExceptionType.badResponse:
              if ((e.response?.statusCode == 409 || e.response?.statusCode == 401)) {
                return handler.next(DioException(requestOptions: e.requestOptions, error: 417));
              } else if (e.response?.statusCode == 417) {
                handler.next(DioException(requestOptions: e.requestOptions, error: 417));
                return;
              } else {
                break;
              }
            case DioExceptionType.connectionError:
              break;
            default:
              break;
          }
          handler.next(e);
        }),
      );

    if (!kReleaseMode) {
      // ignore: avoid_single_cascade_in_expression_statements
      dio
        ..interceptors.add(PrettyDioLogger(
            request: !kReleaseMode,
            requestHeader: false,
            requestBody: !kReleaseMode,
            responseBody: !kReleaseMode,
            responseHeader: false,
            error: !kReleaseMode,
            compact: !kReleaseMode,
            maxWidth: 180));
    }

    if (Platform.isAndroid) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        HttpClient client = HttpClient();
        client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
        return client;
      };
    }

    /*(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // Hook into the findProxy callback to set the client's proxy.
      client.findProxy = (url) {
        return 'PROXY $proxy';
      };
      // This is a workaround to allow Charles to receive
      // SSL payloads when your app is running on Android.
      client.badCertificate
      Callback = (X509Certificate cert, String host, int port) => Platform.isAndroid;
    };*/

    return dio;
  }
}
