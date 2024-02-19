import 'dart:async';
import 'dart:convert';

import 'package:app_base_flutter/core/network/exceptions/bad_request_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class RestClient {
  // instantiate json decoder for json serialization
  final JsonDecoder _decoder = const JsonDecoder();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String url) {
    return http.get(Uri.parse(url)).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw BadRequestException(message: "Error fetching data from server", statusCode: statusCode);
      }

      print(res);
      return _decoder.convert(res);
    });
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(String url, {Map<String, String>? headers, dynamic body, encoding}) {
    headers ??= {};

    headers["Accept"] = "application/json";
    headers["Content-Type"] = "application/json";

    return http.post(Uri.parse(url), body: body, headers: headers, encoding: encoding).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw BadRequestException(message: "Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(res);
    });
  }
}
