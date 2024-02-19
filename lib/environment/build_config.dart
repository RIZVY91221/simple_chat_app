

import 'package:app_base_flutter/environment/env_variables.dart';
import 'package:app_base_flutter/environment/environment.dart';

class BuildConfig {
  late final Flavor flavor;
  late final EnvVariables envVariables;
  bool _lock = false;

  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required Flavor envType,
    required EnvVariables envVariables,
  }) {
    if (instance._lock) return instance;

    instance.flavor = envType;
    instance.envVariables = envVariables;
    instance._lock = true;

    return instance;
  }
}
