import 'dart:ui';

import 'package:app_base_flutter/core/enum.dart';
import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/widget/global/button/wid_button_elevated.dart';
import 'package:app_base_flutter/core/widget/global/divider/wid_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseModal {
  static Future<void> show({
    required BuildContext context,
    double height = 285,
    double borderRadius = 24,
    double elevation = 10,
    Widget? child,
    EdgeInsets? insetPadding,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? shadowColor,
    bool barrierDismissible = false,
    bool backgroundBlur = false,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 10),
          shadowColor: shadowColor ?? Colors.white,
          surfaceTintColor: backgroundColor,
          backgroundColor: backgroundColor ?? Colors.white,
          elevation: elevation,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: backgroundBlur ? 15 : 0,
              sigmaY: backgroundBlur ? 15 : 0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                color: backgroundColor ?? Colors.white,
                height: height,
                width: double.infinity,
                padding: padding ?? const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 36.0),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class BaseFullModal extends StatelessWidget {
  const BaseFullModal(
      {Key? key,
      this.headerTitle,
      this.backIcon,
      this.titlePositionCenter,
      this.onPressBack,
      this.isBackIconLeft = true,
      this.action,
      this.header,
      this.body,
      this.onPressConfirm,
      this.footer,
      this.buttonSize,
      this.buttonText,
      this.isFooterEnable = true})
      : super(key: key);
  final AppBar? header;
  final List<Widget>? body;
  final String? headerTitle;
  final Icon? backIcon;
  final bool? titlePositionCenter;
  final bool isBackIconLeft;
  final VoidCallback? onPressBack;
  final VoidCallback? onPressConfirm;
  final List<Widget>? action;
  final Widget? footer;
  final double? buttonSize;
  final String? buttonText;
  final bool isFooterEnable;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteFFFFFF,
      appBar: header ?? headerWidget(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [const AppDivider(), ...body ?? []],
        ),
      ),
      bottomNavigationBar: footerWidget(),
    );
  }

  AppBar headerWidget() {
    return AppBar(
      backgroundColor: AppColor.whiteFFFFFF,
      centerTitle: titlePositionCenter ?? false,
      elevation: 0,
      title: Text(
        headerTitle ?? "Modal Title",
        style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(color: AppColor.dark202125),
      ),
      leading: isBackIconLeft
          ? IconButton(
              icon: backIcon ??
                  Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColor.dark202125,
                  ),
              onPressed: () => onPressBack ?? Get.back(),
            )
          : const SizedBox.shrink(),
      actions: action ??
          [
            !isBackIconLeft
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: AppColor.dark202125,
                    ),
                    onPressed: () => onPressBack ?? Get.back(),
                  )
                : const SizedBox.shrink()
          ],
    );
  }

  Container footerWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: 0.5, color: AppColor.disabledE4E5E7)),
      ),
      height: 100,
      child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: footer ??
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppElevatedButton(
                    disabled: onPressConfirm != null ? false : true,
                    onPressed: onPressConfirm,
                    width: buttonSize ?? 120,
                    text: buttonText ?? "Confirm",
                    buttonType: ButtonType.secondary,
                    buttonRound: ButtonRound.quarterRounded,
                  ),
                ],
              )),
    );
  }
}
