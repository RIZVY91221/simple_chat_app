import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/features/auth/controller/login_controller.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(repository: getIt<BaseRepository>()));
  }
}
