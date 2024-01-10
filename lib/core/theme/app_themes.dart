import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/fonts.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Variables
  static const inputFieldBorderRadius = AppSize.s6;
  static const checkboxSize = AppSize.s20;

  /// Primary app.theme
  static ThemeData primaryTheme() {
    return ThemeData(
      /* GENERAL CONFIGURATION */
      fontFamily: AppFontName.baseFont,

      // Main Color of the Theme
      primaryColor: AppColor.primaryOne4B9EFF,
      primaryColorLight: AppColor.primaryTwo10CCE4,
      primaryColorDark: AppColor.secondaryOne354170,
      disabledColor: AppColor.whiteLightestGrayF8F8F8,
      scaffoldBackgroundColor: AppColor.whiteFFFFFF,

      shadowColor: AppColor.blackOpacity30000000,

      focusColor: AppColor.whiteLightestGrayF8F8F8,
      splashColor: AppColor.whiteLightestGrayF8F8F8,
      highlightColor: AppColor.secondaryOne354170.withOpacity(0.5),
      hoverColor: AppColor.whiteLightGrayE4E5E6.withOpacity(0.3),

      cardColor: AppColor.whiteFFFFFF,

      /// TEXTS
      textTheme: TextTheme(
        // headline 1
        displayLarge: AppTextStyle.headline1(),
        // headline 2
        displayMedium: AppTextStyle.headline2(),
        // headline 3
        displaySmall: AppTextStyle.headline3(),
        // headline 4
        headlineLarge: AppTextStyle.headline4(),
        //headline 5
        headlineMedium: AppTextStyle.headline5(),
        // headline 6
        headlineSmall: AppTextStyle.headline6(),
        // headline 7
        titleLarge: AppTextStyle.headline7(),
        titleMedium: AppTextStyle.bodyVerySmall(),
        titleSmall: AppTextStyle.bodyExtraSmall(),
        bodyLarge: AppTextStyle.bodyLarge(),
        bodyMedium: AppTextStyle.bodyDefault(),
        bodySmall: AppTextStyle.bodySmall(),
        // button
        labelLarge: AppTextStyle.button(),
        labelMedium: AppTextStyle.overLine(),
        labelSmall: AppTextStyle.bodyTiny(),
      ),

      /// APPBAR
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: AppSize.s60,
        elevation: AppElevation.e0,
        backgroundColor: AppColor.primaryOne4B9EFF,
        foregroundColor: AppColor.whiteFFFFFF,
        shadowColor: AppColor.transparent,
        titleTextStyle: AppTextStyle.headline5(
          color: AppColor.whiteFFFFFF,
        ),
        toolbarTextStyle: AppTextStyle.bodyDefault(),
        iconTheme: IconThemeData(
          color: AppColor.whiteFFFFFF,
          size: AppSize.s25,
          opacity: AppDouble.s100,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColor.whiteFFFFFF,
          size: AppSize.s25,
          opacity: AppDouble.s100,
        ),
      ),

      /// TEXT BUTTON
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.primaryOne4B9EFF,
          backgroundColor: AppColor.transparent,
        ),
      ),

      /// OUTLINED BUTTON
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primaryOne4B9EFF,
          backgroundColor: AppColor.whiteFFFFFF,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.br24,
            ),
          ),
          side: BorderSide(
            width: AppSize.s1,
            color: AppColor.primaryOne4B9EFF,
          ),
          elevation: AppElevation.e3,
        ),
      ),

      /// ELEVATED BUTTON
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColor.whiteFFFFFF,
          backgroundColor: AppColor.primaryOne4B9EFF,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.br24,
            ),
          ),
          elevation: AppElevation.e3,
          shadowColor: AppColor.whiteLightGrayE4E5E6,
          side: BorderSide.none,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColor.secondaryOne354170;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColor.secondaryOne354170;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColor.secondaryOne354170;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColor.secondaryOne354170;
          }
          return null;
        }),
      ),
    );
  }

  /// Dark app.theme
  static ThemeData darkModeTheme() => primaryTheme();
}
