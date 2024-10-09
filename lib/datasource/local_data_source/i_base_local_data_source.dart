import 'dart:async';

import 'package:app_base_flutter/datasource/local_data_source/base_local_source.dart';
import 'package:app_base_flutter/datasource/local_data_source/constants/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class ImplementBaseLocalDataSource implements BaseLocalDataSource {
  @override
  Future initBoxes(List<String> boxs) async {
    //Hive.ignoreTypeId(0);
    for (String tag in boxs) {
      await Hive.openBox(tag);
    }
  }

  @override
  String get accessToken {
    var box = Hive.box(HiveConstants.SESSIONS.SESSION_AUTH_BOX);
    return box.get(HiveConstants.SESSIONS.ACCESS_TOKEN, defaultValue: "");
  }

  @override
  Future<void> setAccessToken(String accessToken) {
    var box = Hive.box(HiveConstants.SESSIONS.SESSION_AUTH_BOX);
    return box.put(HiveConstants.SESSIONS.ACCESS_TOKEN, accessToken);
  }

  @override
  Future<void> logout() async {
    var box = Hive.box(HiveConstants.SESSIONS.SESSION_AUTH_BOX);
    var boxConfig = Hive.box(HiveConstants.CONFIGS.CONFIG_BOX);
    return box.delete(HiveConstants.SESSIONS.ACCESS_TOKEN);
  }

  @override
  // TODO: implement currentLocale
  String get currentLocale {
    var box = Hive.box(HiveConstants.CONFIGS.CONFIG_BOX);
    return box.get(HiveConstants.CONFIGS.CONFIG_LOCALE, defaultValue: "en_US");
  }

  @override
  Future<void> setCurrentLocale(String localeCode) async {
    var box = Hive.box(HiveConstants.CONFIGS.CONFIG_BOX);
    return await box.put(HiveConstants.CONFIGS.CONFIG_LOCALE, localeCode);
  }
}
