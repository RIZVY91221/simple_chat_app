import 'package:flutter/material.dart';

class AppStaticButton extends StatelessWidget {
  const AppStaticButton({
    Key? key,
    this.onPressed,
    this.onDoublePressed,
    this.onHighlightChanged,
    this.text = 'Button',
    this.color,
    this.backgroundColor,
    this.splashColor,
    this.splashEnabled = false,
    this.highlightEnabled = true,
    this.highlightColor,
    this.borderRadius,
    this.disabled = false,
    this.child,
    this.padding,
    this.elevation = 0,
    this.width,
    this.height,
    this.decoration,
    this.autofocus = false,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.focusColor,
    this.disabledColor = Colors.grey,
    this.splashFactory,
  }) : super(key: key);

  final dynamic text;
  final Color? color;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? focusColor;
  final Color? splashColor;
  final Color? highlightColor;
  final double elevation;
  final double? width;
  final double? height;
  final Widget? child;
  final bool disabled;
  final Color? disabledColor;
  final bool autofocus;
  final bool splashEnabled;
  final bool highlightEnabled;
  final TextDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final VoidCallback? onDoublePressed;
  final VoidCallback? onLongPress;
  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;
  final InteractiveInkFeatureFactory? splashFactory;

  final Function(bool)? onHighlightChanged;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Material(
        color: elevation == 0 ? (backgroundColor ?? Colors.transparent) : (backgroundColor ?? Colors.white),
        elevation: elevation,
        borderRadius: borderRadius,
        animationDuration: const Duration(milliseconds: 100),
        child: InkWell(
          onTap: disabled ? null : onPressed,
          onDoubleTap: disabled ? null : onDoublePressed,
          onLongPress: disabled ? null : onLongPress,
          onTapDown: disabled ? null : onTapDown,
          onTapUp: disabled ? null : onTapUp,
          onHighlightChanged: disabled ? null : onHighlightChanged,
          autofocus: autofocus,
          focusColor: focusColor,
          splashFactory: splashFactory,
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          splashColor: splashEnabled ? splashColor ?? Colors.grey.withOpacity(0.2) : Colors.transparent,
          highlightColor: highlightEnabled ? highlightColor ?? Colors.grey.withOpacity(0.2) : Colors.transparent,
          child: Container(
            width: width,
            height: height,
            padding: padding ?? const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Center(
                child: child ??
                    Text(
                      '$text',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: disabled ? disabledColor : color,
                            decoration: decoration,
                            decorationColor: disabled ? disabledColor : color,
                          ),
                    )),
          ),
        ),
      ),
    );
  }
}
