import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/button/wid_button_static.dart';
import 'package:app_base_flutter/core/widget/global/modal/base_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertModal extends BaseModal {
  static void show({
    Function()? onPressed,
    String header = "Confirm cancel?",
    String content =
        "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups ",
    Widget? body,
    Widget? footer,
    String button1 = "Ok",
  }) =>
      BaseModal.show(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.headline5(header),
            AppGap.vertical20,
            body ??
                AppText.bodySmall(
                  content,
                  color: AppColor.darkLightest6C7576,
                ),
            AppGap.vertical20,
            const Spacer(),
            footer ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox.shrink(),
                    button1.isNotEmpty
                        ? AppStaticButton(
                            onPressed: onPressed ?? () => Get.back(),
                            backgroundColor: AppColor.primaryOne4B9EFF,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            borderRadius: BorderRadius.circular(
                              AppBorderRadius.br10,
                            ),
                            child: AppText.headline5(
                              button1,
                              color: AppColor.whiteFFFFFF,
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                )
          ],
        ),
        context: Get.context!,
      );
}

class ConfirmationModal extends BaseModal {
  static void show({
    VoidCallback? onPressed,
    String header = "Confirm cancel?",
    Widget? widContent,
    String content =
        "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups ",
    String button1 = "Confirm",
    String button2 = "Cancel",
  }) {
    BaseModal.show(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.headline5(header),
          AppGap.vertical20,
          widContent ??
              AppText.bodySmall(
                content,
                color: AppColor.darkLightest6C7576,
              ),
          AppGap.vertical20,
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              button2.isNotEmpty
                  ? AppStaticButton(
                      onPressed: () => Get.back(),
                      child: AppText.headline5(
                        button2,
                        color: AppColor.primaryOne4B9EFF,
                      ),
                    )
                  : Container(),
              AppGap.horizontal36,
              button1.isNotEmpty
                  ? AppStaticButton(
                      onPressed: onPressed,
                      backgroundColor: AppColor.primaryOne4B9EFF,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      borderRadius: BorderRadius.circular(
                        AppBorderRadius.br10,
                      ),
                      child: AppText.headline5(
                        button1,
                        color: AppColor.whiteFFFFFF,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          )
        ],
      ),
      context: Get.context!,
    );
  }
}

class DialogModal extends BaseModal {
  static void show({
    Function()? onPressed,
    String header = "Dialog Header",
    Widget? body,
    String content =
        "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups ",
    Widget? footer,
    String button1 = "Ok",
    String button2 = "Cancel",
  }) =>
      BaseModal.show(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.headline5(header),
            AppGap.vertical20,
            body ??
                AppText.bodySmall(
                  content,
                  color: AppColor.darkLightest6C7576,
                ),
            AppGap.vertical20,
            const Spacer(),
            footer ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    button2.isNotEmpty
                        ? AppStaticButton(
                            onPressed: () => Get.back(),
                            child: AppText.headline5(
                              button2,
                              color: AppColor.primaryOne4B9EFF,
                            ),
                          )
                        : const SizedBox.shrink(),
                    AppGap.horizontal36,
                    button1.isNotEmpty
                        ? AppStaticButton(
                            onPressed: onPressed,
                            backgroundColor: AppColor.primaryOne4B9EFF,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            borderRadius: BorderRadius.circular(
                              AppBorderRadius.br10,
                            ),
                            child: AppText.headline5(
                              button1,
                              color: AppColor.whiteFFFFFF,
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                )
          ],
        ),
        context: Get.context!,
      );
}

class FullModal extends BaseModal {
  static void show({
    AppBar? header,
    List<Widget>? body,
    String? headerTitle,
    Icon? backIcon,
    bool? titlePositionCenter,
    bool isBackIconLeft = true,
    VoidCallback? onPressBack,
    VoidCallback? onPressConfirm,
    List<Widget>? action,
    Widget? footer,
    double? buttonSize,
    String? buttonText,
    bool isFooterEnable = true,
  }) {
    Get.to(const BaseFullModal(), fullscreenDialog: true);
  }
}
