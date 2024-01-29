import 'dart:ui';

import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future appDialogue({
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
    context: Get.context!,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        shadowColor: shadowColor ?? Colors.white,
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor ?? AppColor.whiteFFFFFF,
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
