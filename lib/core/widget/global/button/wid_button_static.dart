import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppStaticButton extends StatefulWidget {
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
    this.highlightEnabled = false,
    this.highlightColor,
    this.borderRadius,
    this.disabled = false,
    this.child,
    this.padding,
    this.enableSpinner = false,
    this.spinnerSize,
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
  final bool enableSpinner;
  final double? spinnerSize;
  final VoidCallback? onPressed;
  final VoidCallback? onDoublePressed;
  final VoidCallback? onLongPress;
  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;
  final InteractiveInkFeatureFactory? splashFactory;

  final Function(bool)? onHighlightChanged;

  @override
  State<AppStaticButton> createState() => _AppStaticButtonState();
}

class _AppStaticButtonState extends State<AppStaticButton> {
  bool isOnPressCall = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Material(
        color: widget.elevation == 0 ? (widget.backgroundColor ?? Colors.transparent) : (widget.backgroundColor ?? Colors.white),
        elevation: widget.elevation,
        borderRadius: widget.borderRadius,
        animationDuration: const Duration(milliseconds: 100),
        child: InkWell(
          onTap: widget.disabled
              ? null
              : !widget.enableSpinner
                  ? widget.onPressed
                  : () async {
                      setState(() {
                        isOnPressCall = true;
                      });
                      widget.onPressed?.call();
                      await Future.delayed(const Duration(milliseconds: 1500), () {
                        setState(() {
                          isOnPressCall = false;
                        });
                      });
                    },
          onDoubleTap: widget.disabled ? null : widget.onDoublePressed,
          onLongPress: widget.disabled ? null : widget.onLongPress,
          onTapDown: widget.disabled ? null : widget.onTapDown,
          onTapUp: widget.disabled ? null : widget.onTapUp,
          onHighlightChanged: widget.disabled ? null : widget.onHighlightChanged,
          autofocus: widget.autofocus,
          focusColor: widget.focusColor,
          splashFactory: widget.splashFactory,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
          splashColor: widget.splashEnabled ? widget.splashColor ?? Colors.grey.withOpacity(0.2) : Colors.transparent,
          highlightColor: widget.highlightEnabled ? widget.highlightColor ?? Colors.grey.withOpacity(0.2) : Colors.transparent,
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                    child: Opacity(
                  opacity: isOnPressCall ? 0.30 : 1,
                  child: widget.child ??
                      Text(
                        '${widget.text}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: widget.disabled ? widget.disabledColor : widget.color,
                              decoration: widget.decoration,
                              decorationColor: widget.disabled ? widget.disabledColor : widget.color,
                            ),
                      ),
                )),
                (widget.enableSpinner == true && isOnPressCall)
                    ? Align(
                        alignment: Alignment.center,
                        child: SpinKitFadingFour(
                          color: Theme.of(context).primaryColor,
                          size: widget.spinnerSize ?? 15,
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
