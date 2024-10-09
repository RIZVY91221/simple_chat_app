import 'package:app_base_flutter/core/base/base_controller.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatController extends BaseController{

  final BaseRepository repository;


  ChatController({required this.repository});

  var arg = Get.arguments;
  var messageList=List<types.Message>.empty(growable: true).obs;
  var currentUser=const types.User(id: '').obs;
  @override
  void onInit() {
    setMessageList();
    super.onInit();
  }
  void setMessageList(){
    Future.delayed(Duration.zero,(){
      messageList.value=arg["messageList"] as List<types.Message>;
      currentUser.value=types.User(id: arg["userId"] as String);
    });
  }
}