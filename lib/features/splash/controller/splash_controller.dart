import 'dart:async';
import 'package:app_base_flutter/datasource/local_data_source/constants/hive_constants.dart';
import 'package:app_base_flutter/main.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:app_base_flutter/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final BaseRepository repository;

  SplashController({required this.repository});

  @override
  void onInit() async {
    await repository.initBoxes(HiveConstants.INIT_BOXS);
    Timer(const Duration(milliseconds: 400), () async {
      if (repository.accessToken.isNotEmpty) {
        Get.offAllNamed(AppRoutes.CHAT_LIST);
      } else {
        Get.offAllNamed(AppRoutes.LOGIN_SCREEN);
      }
    });
    super.onInit();
  }

}
