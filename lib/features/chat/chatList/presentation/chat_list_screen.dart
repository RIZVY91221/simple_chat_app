import 'package:app_base_flutter/core/base/base_view.dart';
import 'package:app_base_flutter/core/widget/global/card/card2.dart';
import 'package:app_base_flutter/core/widget/global/modal/app_modal.dart';
import 'package:app_base_flutter/core/widget/global/pagination/pagging_view.dart';
import 'package:app_base_flutter/core/widget/global/scafold/wid_appbar.dart';
import 'package:app_base_flutter/features/chat/chatList/controller/chat_list_controller.dart';
import 'package:app_base_flutter/model/chat_list.dart';
import 'package:app_base_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListScreen extends BaseView<ChatListController> {
  ChatListScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return baseAppBar(
      title: "ChatList",
      hideLeading: false,
      showBorderBottom: false,
      actionButtons: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () => ConfirmationModal.show(
              header: "Do you want to logout?",
                content: "After confer you can logout form app!",
                onPressed: () async => await controller.repository.logout().whenComplete(() => Get.offAllNamed(AppRoutes.LOGIN_SCREEN))),
            child: const Icon(Icons.logout_outlined),
          ),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PagingView<ChatList>(
            pagingController: controller.paginationController.pagingController,
            itemBuilder: (context, item, i) => ChatIListItem(item: item,onPressCard:()=>Get.toNamed(AppRoutes.CHAT_SCREEN,arguments: {
              "messageList":item.message,"userId":item.id
            }) ,)),
      ],
    );
  }
}
