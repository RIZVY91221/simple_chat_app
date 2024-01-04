import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/features/splash/controller/splash_controller.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(repository: getIt<BaseRepository>()));
  }
}
