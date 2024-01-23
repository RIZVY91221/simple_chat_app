import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class WidgetReadMoreText extends StatelessWidget {
  const WidgetReadMoreText(
      {Key? key,
      required this.text,
      this.trimLines = 1,
      this.preDataTextStyle,
      this.textStyle,
      this.moreStyle,
      this.lessStyle,
      this.clickableTextColor,
      this.trimCollapsedText = 'More',
      this.trimExpandedText = ' Less'})
      : super(key: key);

  final String text;
  final int trimLines;
  final TextStyle? preDataTextStyle;
  final TextStyle? textStyle;
  final TextStyle? moreStyle;
  final TextStyle? lessStyle;
  final Color? clickableTextColor;
  final String trimCollapsedText;
  final String trimExpandedText;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: trimLines,
      preDataTextStyle: preDataTextStyle ?? Theme.of(context).textTheme.titleMedium,
      style: textStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColor.dark202125),
      moreStyle: moreStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor),
      lessStyle: lessStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor),
      colorClickableText: clickableTextColor ?? Theme.of(context).primaryColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: trimCollapsedText,
      trimExpandedText: trimExpandedText,
      textAlign: TextAlign.justify,
    );
  }
}
