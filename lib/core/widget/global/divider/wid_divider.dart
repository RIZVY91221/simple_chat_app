import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
    this.indent = 0,
    this.height = 1,
    this.thickness = 0.5,
    this.horizontalGap = 7,
    this.vertical = false,
    this.color,
  }) : super(key: key);

  final double height;
  final double thickness;
  final double horizontalGap;
  final double indent;
  final bool vertical;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return vertical
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: indent, horizontal: horizontalGap),
            child: Container(
              height: height == 1 ? 12 : height,
              width: thickness,
              color: color ?? Colors.black54,
            ),
          )
        : Divider(
            height: height,
            thickness: thickness,
            indent: indent,
            endIndent: indent,
            color: color ?? Colors.black12,
          );
  }
}
