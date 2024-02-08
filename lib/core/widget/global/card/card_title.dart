import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/uttils/functions.dart';
import 'package:app_base_flutter/core/uttils/icons.dart';
import 'package:app_base_flutter/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum IconDirection { left, right }

// ignore: must_be_immutable
class CardTitleWithIcon extends StatelessWidget {
  CardTitleWithIcon({
    Key? key,
    this.storeIcon,
    required this.title,
    this.textAsTitle = true,
    this.showCopyButton = true,
    this.iconDirection = IconDirection.left,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  final String? storeIcon;
  final String title;
  final bool textAsTitle;
  final bool showCopyButton;
  final IconDirection iconDirection;
  final MainAxisSize mainAxisSize;

  var copiedDone = false.obs;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: mainAxisSize,
      children: [
        iconWidget(iconDirection == IconDirection.left),
        orderIdText(),
        iconWidget(iconDirection == IconDirection.right),
        if (showCopyButton) copyButtonWidget(),
      ],
    );
  }

  /// Icon Widget
  Widget iconWidget(bool show) => (show && storeIcon != null)
      ? Padding(
          padding: const EdgeInsets.only(right: 5),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: FN.imageWidgetFromBase64(
              storeIcon!.isNotEmpty ? storeIcon! : title.characters.elementAt(1),
              fit: BoxFit.cover,
              isText: storeIcon!.isEmpty ? true : false,
              width: storeIcon!.isNotEmpty ? 18 : 22,
              height: storeIcon!.isNotEmpty ? 18 : 22,
            ),
          ))
      : const SizedBox.shrink();

  /// Order IdD Text Widget
  Padding orderIdText() {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: textAsTitle ? AppText.bodySmall(title, color: AppColor.dark202125) : AppText.bodyVerySmall(title, color: AppColor.dark202125),
    );
  }

  /// Order No Widget
  Obx copyButtonWidget() {
    return Obx(
      () => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await FN.copyText(title);
          copiedDone.value = true;
          Future.delayed(const Duration(seconds: 2), () {
            copiedDone.value = false;
          });
        },
        child: SizedBox(
          height: 15,
          width: 40,
          child: copiedDone.value
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.check,
                    color: AppColor.darkLightest6C7576,
                    size: 14,
                  ),
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: appSVG(
                    Assets.svgCopyIcon,
                    color: AppColor.darkLightest6C7576,
                    width: 14,
                    height: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
