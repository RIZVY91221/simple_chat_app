import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/card/card.dart';
import 'package:app_base_flutter/model/chat_list.dart';

import 'package:flutter/material.dart';

class ChatIListItem extends StatelessWidget {
  const ChatIListItem({Key? key, required this.item, this.onPressCard,})
      : super(key: key);

  final ChatList item;
  final VoidCallback? onPressCard;

  @override
  Widget build(BuildContext context) {
    return CardWrapperWidget(
      onPressCard: onPressCard,
      cardBody: CardBody(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.errorFE6C44
              ),
              child: Center(child: AppText.bodyDefault(item.sender?.username?[0].toUpperCase()??"F",color: Colors.white)),
            ),
            AppGap.horizontal10,
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyVerySmall(item.sender?.username?.toUpperCase()?? ' - ', color: AppColor.dark202125),
                  AppGap.vertical6,
                  AppText.bodyExtraSmall(item.lastMessage?? ' - ', color: AppColor.dark202125),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}