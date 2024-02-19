import 'package:app_base_flutter/environment/build_config.dart';

class Endpoints {
  Endpoints._();

  // base url
  static var baseUrl = BuildConfig.instance.envVariables.baseUrl;

  // receiveTimeout
  static const int receiveTimeout = 10000;

  // connectTimeout
  static const int connectionTimeout = 10000;

  static const int sendTimeout = 10000;

  static const String source = "";

  //TODO: Add other settings and url endpoint here
  //static const String POST_LOGIN = "/login";
}
