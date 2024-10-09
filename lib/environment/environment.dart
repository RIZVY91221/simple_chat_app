// ignore: constant_identifier_names
import 'dart:convert';

import 'package:app_base_flutter/environment/build_config.dart';
import 'package:app_base_flutter/environment/env_variables.dart';
import 'package:app_base_flutter/environment/features.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { DEV, PROD, STAGING }

class Env {
  static String get fileName {
    if (kDebugMode) {
      return '.env';
    } else if (kProfileMode) {
      return '.env';
    } else if (kReleaseMode) {
      return '.env';
    } else {
      return '.env';
    }
  }

  static String get appName {
    return dotenv.env["APP_NAME"] ?? "";
  }

  static String get apiUrlDartCommand {
    return const String.fromEnvironment('API_URL', defaultValue: '');
  }

  static String get apiUrl {
    return apiUrlDartCommand.isNotEmpty ? apiUrlDartCommand : dotenv.env["BASE_URL"] ?? "NOT FOUND";
  }

  static Flavor get currentFlavor {
    Flavor flavor;
    switch (fileName) {
      case '.env':
        flavor = Flavor.DEV;
        break;
      default:
        flavor = Flavor.DEV;
        break;
    }
    return flavor;
  }
  static String get loginEmail {
    return dotenv.env["LOGIN_EMAIL"] ?? "NOT FOUND";
  }

  static String get loginPassword {
    return dotenv.env["LOGIN_PASSWORD"] ?? "NOT FOUND";
  }
  static loadBuildConfig() {
    EnvVariables envVariables = EnvVariables(
      appName: appName,
      baseUrl: apiUrl,
      shouldCollectCrashLog: currentFlavor == Flavor.DEV ? true : false,
    );

    BuildConfig.instantiate(envType: currentFlavor, envVariables: envVariables);
  }

  static bool isValidEnvironment(String name) {
    if (name == Flavor.DEV.name || name == Flavor.PROD.name || name == Flavor.STAGING.name) {
      return true;
    } else {
      return false;
    }
  }
}
