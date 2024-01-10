import 'package:flutter/material.dart';

class AppColor {
  static Color get primaryOne4B9EFF => const Color(0xFF4B9EFF);
  static Color get primaryTwo10CCE4 => const Color(0xFF10CCE4);

  static Color get primaryToneOneEAF4FF => const Color(0xFFEAF4FF); //#202125
  static Color get primaryToneTwoE6F7F9 => const Color(0xFFE6F7F9);

  static Color get secondaryOne354170 => const Color(0xFF354170);
  static Color get secondaryTwoFFD584 => const Color(0xFFFFD584);
  static Color get secondaryThreeFE6C44 => const Color(0xFFFE6C44);
  static Color get secondaryFour877DF8 => const Color(0xFF877DF8);
  static Color get secondaryFive00A092 => const Color(0xFF00a092);

  static Color get secondaryToneTwoFFF6E5 => const Color(0xFFFFF6E5);
  static Color get secondaryToneThreeFFECE7 => const Color(0xFFFFECE7);
  static Color get secondaryToneFourEEF1FA => const Color(0xFFEEF1FA);
  static Color get secondaryToneFiveE4F7F6 => const Color(0xFFE4F7F6);

  static Color get dark202125 => const Color(0xFF202125);
  static Color get darkLight4D4D50 => const Color(0xFF4d4d50);
  static Color get darkLightest6C7576 => const Color(0xFF6c7576);

  static Color get whiteLightGrayE4E5E6 => const Color(0xFFe4e5e6);
  static Color get whiteLightestGrayF8F8F8 => const Color(0xFFf8f8f8);
  static Color get whiteFFFFFF => const Color(0xFFFFFFFF);

  static Color get errorFE6C44 => const Color(0xFFFE6C44);
  static Color get dangerFE6C44 => const Color(0xFFFE6C44);
  static Color get info10CCE4 => const Color(0xFF10CCE4);

  static Color get blackOpacity70000000 => const Color(0xB3000000);
  static Color get blackOpacity50000000 => const Color(0x80000000);
  static Color get blackOpacity40000000 => const Color(0x66000000);
  static Color get blackOpacity30000000 => const Color(0x4D000000);
  static Color get blackOpacity20000000 => const Color(0x33000000);
  static Color get blackOpacity10000000 => const Color(0x1A000000);

  static Color get transparent => Colors.transparent;

  // Other
  static Color get inputHeaderColor => AppColor.dark202125;
  static Color get inputTitleColor => AppColor.darkLightest6C7576;
  static Color get inputOtherColor => AppColor.darkLightest6C7576;
  static Color get inputHintColor => AppColor.darkLightest6C7576;
  static Color get inputButtonColor => AppColor.whiteFFFFFF;
  static Color get inputBorderRegularE4E5E7 => const Color(0xFFE4E5E7);
  static Color get inputBorderFocus469FFF => const Color(0xFF469fff);
  static Color get inputBorderActive489EFF => const Color(0xFF489eff);
  static Color get inputSearchIconE4E5E7 => const Color(0xFFE4E5E7);

  static Color get buttonFailedStatus20PFE6C44 => errorFE6C44.withOpacity(0.2);
  static Color get buttonSuccessStatus20PFE6C44 => secondaryFive00A092.withOpacity(0.2);

  static Color get disabledE4E5E7 => const Color(0xFFCFD1D4);
  static Color get toast75PE4E5E7 => secondaryOne354170.withOpacity(0.75);
  static Color get splash15P4B9EFF => primaryOne4B9EFF.withOpacity(0.15);

  static Color get scannerContainerBackground => const Color(0xFF000000);
}
