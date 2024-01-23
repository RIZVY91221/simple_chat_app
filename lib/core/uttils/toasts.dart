import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppToasts {
  static defaultBanner(
      {String msg = '',
      bool isActionRequired = false,
      String? actionText,
      VoidCallback? onPressAction,
      List<Widget> action = const [],
      bool isAutoClose = true,
      int duration = 3000,
      Color? backgroundColor,
      Color? textColor,
      Widget? leading}) {
    ScaffoldMessenger.of(Get.context!).showMaterialBanner(
      MaterialBanner(
          backgroundColor: backgroundColor ?? AppColor.whiteLightestGrayF8F8F8,
          content: Text(msg, style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(color: textColor ?? AppColor.dark202125)),
          contentTextStyle: Theme.of(Get.context!).textTheme.titleMedium,
          leading: leading ?? const SizedBox.shrink(),
          elevation: 0.0,
          dividerColor: Colors.transparent,
          actions: action.isEmpty
              ? isActionRequired
                  ? [
                      TextButton(
                        onPressed: onPressAction,
                        child: AppText.bodyVerySmall(actionText, color: AppColor.primaryOne4B9EFF),
                      ),
                    ]
                  : [const SizedBox.shrink()]
              : action),
    );

    if (isAutoClose) {
      Future.delayed(Duration(milliseconds: duration), () {
        closeBanner();
      });
    }
  }

  static error({required String msg}) {
    return defaultBanner(
        msg: msg,
        backgroundColor: AppColor.secondaryToneThreeFFECE7,
        leading: Icon(Icons.info_outline, color: AppColor.secondaryThreeFE6C44, size: 18));
  }

  static closeBanner() {
    ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
  }
}
