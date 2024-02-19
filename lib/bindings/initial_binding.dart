import 'package:app_base_flutter/core/controller/global_controller.dart';
import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController(repository: getIt<BaseRepository>()));
  }
}
