import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/features/chat/chatList/controller/chat_list_controller.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:get/get.dart';

class ChatListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatListController>(() => ChatListController(repository: getIt<BaseRepository>()));
  }

}