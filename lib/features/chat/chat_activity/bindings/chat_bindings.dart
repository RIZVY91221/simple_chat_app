import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/features/chat/chat_activity/controller/chat_controller.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:get/get.dart';

class ChatBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController(repository: getIt<BaseRepository>()));
  }

}