import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:flutter/material.dart';

class WidgetIconWithLetter extends StatelessWidget {
  const WidgetIconWithLetter({
    Key? key,
    this.text,
    this.textStyle,
    this.height = 22,
    this.width = 22,
    this.borderRadius = 3,
    this.bgColor,
    this.textColor,
    this.padding,
  }) : super(key: key);

  final String? text;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double borderRadius;
  final Color? bgColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: bgColor ?? AppColor.secondaryToneFourEEF1FA,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Text(
          text != null ? (text!.isNotEmpty ? text!.substring(0, 1) : '') : '',
          style: AppTextStyle.headline6(
            color: textColor ?? AppColor.secondaryFour877DF8,
          ),
        ),
      ),
    );
  }
}
