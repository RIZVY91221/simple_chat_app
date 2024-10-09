import 'package:app_base_flutter/core/base/base_view.dart';
import 'package:app_base_flutter/core/widget/global/scafold/wid_appbar.dart';
import 'package:app_base_flutter/features/chat/chat_activity/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

class ChatScreen extends BaseView<ChatController>{
  ChatScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
   return baseAppBar(title: "",
     hideLeading: false,
     showBorderBottom: false,);
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => Chat(
      messages: controller.messageList.value,
      /*    onAttachmentPressed: _handleAttachmentPressed,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,*/
      onSendPressed: (text){},
      showUserAvatars: true,
      showUserNames: true,
      user: controller.currentUser.value,
    ));
  }

}