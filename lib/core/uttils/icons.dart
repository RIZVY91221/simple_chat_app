import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Get SVG Image Method -->
Widget appSVG(String? svg, {double? size, double? width, double? height, Color? color}) {
  return svg != null
      ? SvgPicture.asset(
          svg,
          width: size ?? width ?? AppSize.s20,
          height: size ?? height ?? AppSize.s20,
          color: color,
        )
      : Container();
}

/// App icon Callback -->

/// App icon Callback
class AppIcon {
  /// Global: Input Text Icons -->

  //Global : no data widget
  static noData({double top = 40}) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: top),
        child: Center(
          child: appSVG(
            Assets.svgNoData,
            height: 80,
            width: 80,
          ),
        ),
      );
}
