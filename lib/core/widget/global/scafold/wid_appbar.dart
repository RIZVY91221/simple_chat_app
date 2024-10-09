import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar baseAppBar({
  String title = '',
  Widget? titleWidget,
  Color? titleColor,
  bool modalView = false,
  bool titleCenter = true,
  bool defaultActionButton = false,
  List<Widget>? actionButtons,
  Widget? leading,
  bool leadingArrow = false,
  bool showBorderBottom = true,
  Color? leadingArrowColor,
  bool hideLeading = true,
  Color? backgroundColor,
  Widget? defaultActionButtonIcon,
  VoidCallback? onPressedDefaultActionButton,
  VoidCallback? onPressedLeading,
}) {
  return AppBar(
    title: titleWidget ?? AppText.headline5(title, color: titleColor ?? AppColor.whiteFFFFFF),
    titleSpacing: 0,
    leading: leadingArrow
        ? TextPrimaryButton(
            onPressed: onPressedLeading ?? () => Get.back(),
            splashEnabled: true,
            backgroundColor: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: leadingArrowColor ?? (modalView ? AppColor.dark202125 : AppColor.whiteFFFFFF),
              size: AppSize.s24,
            ),
          )
        : hideLeading
            ? Container()
            : leading,
    centerTitle: modalView ? (titleCenter ? titleCenter : !modalView) : titleCenter,
    backgroundColor: modalView ? AppColor.whiteFFFFFF : backgroundColor,
    titleTextStyle: modalView
        ? AppTextStyle.headline5(
            color: AppColor.dark202125,
          )
        : null,
    iconTheme: modalView
        ? IconThemeData(
            color: AppColor.dark202125,
          )
        : null,
    // systemOverlayStyle: SystemUiOverlayStyle(),
    // leadingWidth: AppSize.s40,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: Container(
        height: showBorderBottom ? 1 : 0,
        color: showBorderBottom ? AppColor.blackOpacity10000000 : AppColor.transparent,
      ),
    ),
    actions: defaultActionButton
        ? [
            IconButton(
              onPressed: onPressedDefaultActionButton,
              icon: defaultActionButtonIcon ?? Icon(Icons.add, color: modalView ? AppColor.dark202125 : null),
            ),
            const SizedBox(width: AppSize.s5),
          ]
        : actionButtons,
  );
}
