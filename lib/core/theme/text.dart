import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/fonts.dart';
import 'package:flutter/material.dart';

/// APP TEXT
class AppText {
  /// <b style="color:orange">HEADLINE 1, s52, w700, h68</b>
  static Text headline1(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.headline1(color: color),
    );
  }

  /// <b style="color:orange">HEADLINE 2, s38, w700, h50</b>
  static Text headline2(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.headline2(color: color),
    );
  }

  /// <b style="color:orange">HEADLINE 3, s24, w700, h32</b>
  static Text headline3(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.headline3(color: color),
    );
  }

  /// <b style="color:orange">HEADLINE 4, s22, w700, h28</b>
  static Text headline4(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.headline4(color: color),
    );
  }

  /// <b style="color:orange">HEADLINE 5, s18, w600, h24</b>
  static Text headline5(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.headline5(color: color),
    );
  }

  /// <b style="color:orange">HEADLINE 6, s16, w600, h20</b>
  static Text headline6(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.headline6(color: color),
    );
  }

  /// <b style="color:orange">HEADLINE 6, s16, w600, h20</b>
  static Text headline7(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.headline7(color: color),
    );
  }

  /// <b style="color:orange">BODY LARGE, s24, w400, h36</b>
  static Text bodyLarge(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.bodyLarge(color: color),
    );
  }

  /// <b style="color:orange">BODY DEFAULT, s18, w400, h28</b>
  static Text bodyDefault(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.bodyDefault(color: color),
    );
  }

  /// <b style="color:orange">BODY SMALL, s16, w400, h24</b>
  static Text bodySmall(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.bodySmall(color: color),
    );
  }

  /// <b style="color:orange">BODY VERY SMALL, s14, w400, h18</b>
  static Text bodyVerySmall(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.bodyVerySmall(color: color),
    );
  }

  /// <b style="color:orange">BODY EXTRA SMALL, s12, w400, h16</b>
  static Text bodyExtraSmall(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.bodyExtraSmall(color: color),
    );
  }

  /// <b style="color:orange">BODY TINY, s10, w400, h16</b>
  static Text bodyTiny(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.bodyTiny(color: color),
    );
  }

  /// <b style="color:orange">CAPTION, s18, w200, h24</b>
  static SelectableText selectableText(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
    TextStyle? textStyle,
  }) {
    return SelectableText(
      '$text',
      textAlign: textAlign,
      style: textStyle ?? AppTextStyle.bodyDefault(color: color),
    );
  }

  /// <b style="color:orange">OVER-LINE, s16, w400, h24</b>
  static Text caption(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.caption(color: color),
    );
  }

  /// <b style="color:orange">BUTTON, s18, w400, h24</b>
  static Text overLine(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.overLine(color: color),
    );
  }

  /// <b style="color:orange">LINK, s16, w600, h24</b>
  static Text button(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.button(color: color),
    );
  }

  /// <b style="color:orange">Input text, s14, w400, h20</b>
  static Text link(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
    TextDecoration? decoration,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.link(color: color, decoration: decoration),
    );
  }

  /// <b style="color:orange">Input text, s16, w400, h20</b>
  static Text linkThin(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
    TextDecoration? decoration,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.linkThin(color: color, decoration: decoration, fontSize: 14),
    );
  }

  /// <b style="color:orange">Input text, s14, w400, h20</b>
  static Text drawerButton(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.drawerButton(color: color),
    );
  }

  /// <b style="color:orange">Input Label, s14, w400, h18</b>
  static Text inputLabel(
    dynamic text, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      '$text',
      textAlign: textAlign,
      style: AppTextStyle.inputLabel(color: color),
    );
  }
}

/// These styles are use as Theme defaults
class AppTextStyle {
  /// <b style="color:orange">Height Converter</b>
  static getHeight(double fontSize, double heightInPX) {
    var baseGiven = fontSize / 100;
    var heightGiven = heightInPX / 100;
    var height = (1 / baseGiven) * heightGiven;
    return height;
  }

  /// <b style="color:orange">HEADLINE 1 Style, s52, w700, h68</b>
  static TextStyle headline1({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.headline1,
      fontWeight: AppFontWeight.w700,
      color: color ?? AppColor.inputHeaderColor,
      height: height ??
          getHeight(
            AppFontSize.headline1,
            AppHeight.headline1,
          ),
    );
  }

  /// <b style="color:orange">HEADLINE 2 Style, s38, w700, h50</b>
  static TextStyle headline2({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.headline2,
      fontWeight: AppFontWeight.w700,
      color: color ?? AppColor.inputHeaderColor,
      height: height ??
          getHeight(
            AppFontSize.headline2,
            AppHeight.headline2,
          ),
    );
  }

  /// <b style="color:orange">HEADLINE 3 Style, s24, w700, h32</b>
  static TextStyle headline3({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.headline3,
      fontWeight: AppFontWeight.w700,
      color: color ?? AppColor.inputHeaderColor,
      height: height ??
          getHeight(
            AppFontSize.headline3,
            AppHeight.headline3,
          ),
    );
  }

  /// <b style="color:orange">HEADLINE 4 Style, s22, w700, h28</b>
  static TextStyle headline4({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.headline4,
      fontWeight: AppFontWeight.w700,
      color: color ?? AppColor.inputHeaderColor,
      height: height ??
          getHeight(
            AppFontSize.headline4,
            AppHeight.headline4,
          ),
    );
  }

  /// <b style="color:orange">HEADLINE 5 Style, s18, w600, h24</b>
  static TextStyle headline5({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.headline5,
      fontWeight: AppFontWeight.w600,
      color: color ?? AppColor.inputHeaderColor,
      height: height ??
          getHeight(
            AppFontSize.headline5,
            AppHeight.headline5,
          ),
    );
  }

  /// <b style="color:orange">HEADLINE 6 Style, s16, w600, h20</b>
  static TextStyle headline6({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.headline6,
      fontWeight: AppFontWeight.w500,
      color: color ?? AppColor.inputHeaderColor,
      height: height ??
          getHeight(
            AppFontSize.headline6,
            AppHeight.headline6,
          ),
    );
  }

  /// <b style="color:orange">HEADLINE 6 Style, s16, w600, h20</b>
  static TextStyle headline7({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.headline7,
      fontWeight: AppFontWeight.w500,
      color: color ?? AppColor.inputHeaderColor,
      height: height ??
          getHeight(
            AppFontSize.headline7,
            AppHeight.headline7,
          ),
    );
  }

  /// <b style="color:orange">BODY LARGE Style, s24, w400, h36</b>
  static TextStyle bodyLarge({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.bodyLarge,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.inputTitleColor,
      height: height ??
          getHeight(
            AppFontSize.bodyLarge,
            AppHeight.bodyLarge,
          ),
      letterSpacing: AppLetterSpacing.bodyLarge,
    );
  }

  /// <b style="color:orange">BODY DEFAULT Style, s18, w400, h28</b>
  static TextStyle bodyDefault({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.bodyDefault,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.inputTitleColor,
      height: height ??
          getHeight(
            AppFontSize.bodyDefault,
            AppHeight.bodyDefault,
          ),
      letterSpacing: AppLetterSpacing.bodyDefault,
    );
  }

  /// <b style="color:orange">BODY SMALL Style, s16, w400, h24</b>
  static TextStyle bodySmall({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.bodySmall,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.inputTitleColor,
      height: height ??
          getHeight(
            AppFontSize.bodySmall,
            AppHeight.bodySmall,
          ),
    );
  }

  /// <b style="color:orange">BODY VERY SMALL Style, s14, w400, h18</b>
  static TextStyle bodyVerySmall({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.bodyVerySmall,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.inputTitleColor,
      height: height ??
          getHeight(
            AppFontSize.bodyVerySmall,
            AppHeight.bodyVerySmall,
          ),
    );
  }

  /// <b style="color:orange">BODY VERY SMALL Style, s12, w400, h16</b>
  static TextStyle toastLink({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.bodyVerySmall,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.dark202125,
      decoration: TextDecoration.underline,
      height: height ??
          getHeight(
            AppFontSize.bodyExtraSmall,
            AppHeight.bodyExtraSmall,
          ),
    );
  }

  /// <b style="color:orange">BODY EXTRA SMALL Style, s12, w400, h16</b>
  static TextStyle bodyExtraSmallPlus({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: 15.75,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.inputTitleColor,
      letterSpacing: -0.55,
      height: 1.19,
    );
  }

  /// <b style="color:orange">BODY EXTRA SMALL Style, s12, w400, h16</b>
  static TextStyle bodyExtraSmall({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.bodyExtraSmall,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.inputTitleColor,
      height: height ??
          AppTextStyle.getHeight(
            AppFontSize.bodyExtraSmall,
            AppHeight.bodyExtraSmall,
          ),
    );
  }

  /// <b style="color:orange">BODY TINY Style, s10, w400, h16</b>
  static TextStyle bodyTiny({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.bodyTiny,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.inputTitleColor,
      height: height ??
          AppTextStyle.getHeight(
            AppFontSize.bodyTiny,
            AppHeight.bodyTiny,
          ),
    );
  }

  /// <b style="color:orange">CAPTION Style, s18, w200, h24</b>
  static TextStyle caption({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.caption,
      fontWeight: AppFontWeight.w200,
      color: color ?? AppColor.inputOtherColor,
      height: height ??
          getHeight(
            AppFontSize.caption,
            AppHeight.caption,
          ),
    );
  }

  /// <b style="color:orange">OVER-LINE Style, s16, w400, h24</b>
  static TextStyle overLine({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.overLine,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.inputOtherColor,
      height: height ??
          getHeight(
            AppFontSize.overLine,
            AppHeight.overLine,
          ),
      decoration: TextDecoration.overline,
    );
  }

  /// <b style="color:orange">BUTTON Style, s18, w400, h24</b>
  static TextStyle button({
    Color? color,
    double? height,
    double? letterSpacing,
    double? fontSize = AppFontSize.button,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: AppFontWeight.w600,
      color: color ?? AppColor.inputButtonColor,
      height: height ??
          getHeight(
            AppFontSize.button,
            AppHeight.button,
          ),
    );
  }

  /// <b style="color:orange">LINK Style, s16, w600, h24</b>
  static TextStyle drawerButton({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontSize: AppFontSize.drawerButton,
      fontWeight: AppFontWeight.w500,
      color: color ?? AppColor.whiteFFFFFF,
      height: height ??
          getHeight(
            AppFontSize.drawerButton,
            AppHeight.drawerButton,
          ),
    );
  }

  /// <b style="color:orange">LINK Style, s16, w600, h24</b>
  static TextStyle link({
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: AppFontSize.link,
      fontWeight: AppFontWeight.w600,
      color: color ?? AppColor.primaryOne4B9EFF,
      decoration: decoration,
      height: height ??
          getHeight(
            AppFontSize.link,
            AppHeight.link,
          ),
    );
  }

  /// <b style="color:orange">LINK Style, s16, w400, h24</b>
  static TextStyle linkThin({Color? color, double? height, TextDecoration? decoration, double? fontSize}) {
    return TextStyle(
      fontSize: fontSize ?? AppFontSize.link,
      fontWeight: AppFontWeight.w400,
      color: color ?? AppColor.primaryOne4B9EFF,
      decoration: decoration,
      height: height ??
          getHeight(
            AppFontSize.link,
            AppHeight.link,
          ),
    );
  }

  /// <b style="color:orange">Input text Style, s14, w400, h20</b>
  static TextStyle inputText({
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color ?? AppColor.dark202125,
      fontWeight: AppFontWeight.w400,
      fontSize: AppFontSize.inputText,
      decoration: decoration,
      height: AppTextStyle.getHeight(
        AppFontSize.inputText,
        AppHeight.inputText,
      ),
    );
  }

  /// <b style="color:orange">Input Label Style, s14, w400, h18</b>
  static TextStyle inputLabel({
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color ?? AppColor.darkLightest6C7576,
      fontWeight: AppFontWeight.w400,
      fontSize: AppFontSize.inputLabel,
      decoration: decoration,
      height: AppTextStyle.getHeight(
        AppFontSize.inputLabel,
        AppHeight.bodyVerySmall,
      ),
    );
  }

  /// <b style="color:orange">Input Helper Text Style, s12, w400, h16</b>
  static TextStyle inputHelper({
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color ?? AppColor.darkLightest6C7576,
      fontWeight: AppFontWeight.w400,
      fontSize: AppFontSize.inputHelper,
      decoration: decoration,
      height: AppTextStyle.getHeight(
        AppFontSize.inputHelper,
        AppHeight.inputHelper,
      ),
    );
  }

  /// <b style="color:orange">Input Error Text Style, s12, w400, h16</b>
  static TextStyle inputError({
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color ?? AppColor.errorFE6C44,
      fontWeight: AppFontWeight.w400,
      fontSize: AppFontSize.inputError,
      decoration: decoration,
      height: AppTextStyle.getHeight(
        AppFontSize.inputError,
        AppHeight.inputError,
      ),
    );
  }
}
