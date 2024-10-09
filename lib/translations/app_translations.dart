import 'dart:developer';
import 'dart:ui';
import 'package:app_base_flutter/core/controller/global_controller.dart';
import 'package:app_base_flutter/datasource/shared_preference_data_source/constants/preferences.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:app_base_flutter/translations/bn_BD/bn_bd_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'en_US/en_us_translations.dart';

abstract class AppTranslation {
  static Map<String, Locale> localeMapper = {
    'en_US': const Locale('en', 'US'), //English
    'bn_BD': const Locale('bn', 'BD'), //France
  };

  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'bn_BD': bnBd,
  };

  static resetTranslatorDecider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(Preferences.openFirstTime);
  }

  static Locale searchDeviceLocale(String value, BaseRepository repository) {
    var globalController = Get.find<GlobalController>();
    Locale? result;
    log("******** AM Using $value");
    switch (value.toUpperCase()) {
      case "EN":
        result = localeMapper["en_US"];
        globalController.setInitialLocale("en_US");
        break;

      case "BN":
        result = localeMapper["bn_BD"];
        globalController.setInitialLocale("bn_BD");
        break;
      default:
        result = localeMapper["en_US"];
        globalController.setInitialLocale("en_US");
        break;
    }
    log("******** AM RETURNING ${result!.countryCode}");
    return result;
  }

  static translatorDecider(BaseRepository repository) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? decider = prefs.getBool(Preferences.openFirstTime);

    if (decider == null) {
      Get.updateLocale(AppTranslation.searchDeviceLocale(Get.deviceLocale!.countryCode!, repository));
      log("My DECIDER is => NULL");
    } else if (decider) {
      Get.updateLocale(AppTranslation.localeMapper[repository.currentLocale] ?? const Locale('en', 'US'));
      Get.find<GlobalController>().getCurrentLocale();
      log("My DECIDER is => ${decider.toString()}");
    }
  }

  static useTranslatorDecider(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Preferences.openFirstTime, value);
  }
}
