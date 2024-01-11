import 'package:app_base_flutter/core/enum.dart';
import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatefulWidget {
  const AppElevatedButton({
    Key? key,
    this.onPressed,
    this.text,
    this.buttonType,
    this.buttonSize = ButtonSize.full,
    this.buttonRound = ButtonRound.auto,
    this.disabled = false,
    this.child,
    this.width,
    this.height = 50,
    this.chipsHeight = 30,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderColor,
  }) : super(key: key);

  final double? width;
  final double height;
  final double chipsHeight;
  final double? borderRadius;
  final dynamic text;
  final ButtonType? buttonType;
  final ButtonSize buttonSize;
  final ButtonRound buttonRound;
  final bool disabled;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? borderColor;
  final Widget? child;
  final VoidCallback? onPressed;

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool chips = (widget.buttonSize == ButtonSize.chips);

        // Null or user Defined Width
        double borderRadius = widget.borderRadius ?? constraints.maxWidth / 2;
        double height = widget.height;
        double? width = widget.width;

        // Setting Up Width
        if (widget.buttonSize == ButtonSize.chips) {
          height = widget.chipsHeight;
          borderRadius = widget.borderRadius ?? AppBorderRadius.br10;
        } else if (widget.buttonSize == ButtonSize.full) {
          width = constraints.maxWidth.isInfinite ? width : (width ?? constraints.maxWidth);
          borderRadius = widget.borderRadius ?? height / 2;
        } else if (widget.buttonSize == ButtonSize.half) {
          width = width ?? (constraints.maxWidth / 2);
          borderRadius = widget.borderRadius ?? AppBorderRadius.br12;
        } else if (widget.buttonSize == ButtonSize.trio) {
          width = width ?? (constraints.maxWidth / 3);
        } else if (widget.buttonSize == ButtonSize.quarter) {
          width = width ?? (constraints.maxWidth / 4);
        } else if (widget.buttonSize == ButtonSize.fifth) {
          width = width ?? (constraints.maxWidth / 5);
        } else if (widget.buttonSize == ButtonSize.sixth) {
          width = width ?? (constraints.maxWidth / 6);
        }

        // Re-Setting border Radius if(buttonRound != null)
        switch (widget.buttonRound) {
          case ButtonRound.rounded:
            borderRadius = height / 2;
            break;
          case ButtonRound.halfRounded:
            borderRadius = height / 4;
            break;
          case ButtonRound.quarterRounded:
            borderRadius = height / 8;
            break;
          case ButtonRound.minRounded:
            borderRadius = AppBorderRadius.br10;
            break;
          case ButtonRound.microRound:
            borderRadius = AppBorderRadius.br4;
            break;
          case ButtonRound.cornered:
            borderRadius = AppBorderRadius.br2;
            break;
          case ButtonRound.circle:
            width = width ?? height;
            height = width;
            borderRadius = height / 2;
            break;
          case ButtonRound.square:
            width = width ?? height;
            height = width;
            borderRadius = AppBorderRadius.br2;
            break;
          default:
            borderRadius = borderRadius;
        }

        ButtonType buttonType = widget.buttonType ?? ButtonType.primary;

        if (chips) {
          buttonType = widget.buttonType ?? ButtonType.secondary;
        }

        Widget button = FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            width: chips ? null : width,
            height: height,
            margin: const EdgeInsets.all(AppMargin.m2),
            child: (buttonType == ButtonType.primary)
                ? ElevatedButton(
                    onPressed: chips ? widget.onPressed : (widget.disabled ? null : widget.onPressed),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
                        foregroundColor: widget.foregroundColor ?? AppColor.whiteFFFFFF,
                        disabledBackgroundColor: widget.disabledBackgroundColor ?? AppColor.disabledE4E5E7,
                        disabledForegroundColor: widget.disabledForegroundColor ?? AppColor.whiteFFFFFF,
                        elevation: AppElevation.e0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
                    child: widget.child ??
                        (chips
                            ? Text('${widget.text ?? 'Chips'}',
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: widget.disabled
                                        ? (widget.disabledForegroundColor ?? AppColor.whiteFFFFFF)
                                        : (widget.foregroundColor ?? AppColor.whiteFFFFFF)))
                            : Text(
                                '${widget.text ?? 'Button'}',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: widget.disabled
                                        ? (widget.disabledForegroundColor ?? AppColor.whiteFFFFFF)
                                        : (widget.foregroundColor ?? AppColor.whiteFFFFFF)),
                              )),
                  )
                : OutlinedButton(
                    onPressed: chips ? widget.onPressed : (widget.disabled ? null : widget.onPressed),
                    style: OutlinedButton.styleFrom(
                        padding: chips ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10) : null,
                        backgroundColor: widget.backgroundColor ?? AppColor.whiteFFFFFF,
                        foregroundColor: widget.foregroundColor ?? AppColor.primaryOne4B9EFF,
                        disabledBackgroundColor: widget.disabledBackgroundColor ?? AppColor.whiteFFFFFF,
                        disabledForegroundColor: widget.disabledForegroundColor ?? AppColor.disabledE4E5E7,
                        elevation: AppElevation.e0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                        side: BorderSide(
                          width: chips ? AppSize.s1 : AppSize.s2,
                          color: widget.disabled ? AppColor.disabledE4E5E7 : widget.borderColor ?? AppColor.primaryOne4B9EFF,
                        )),
                    child: widget.child ??
                        (chips
                            ? Text('${widget.text ?? 'Chips'}',
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: widget.disabled
                                        ? (widget.disabledForegroundColor ?? AppColor.darkLight4D4D50)
                                        : (widget.foregroundColor ?? AppColor.primaryOne4B9EFF)))
                            : Text(
                                '${widget.text ?? 'Button'}',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: widget.disabled
                                        ? (widget.disabledForegroundColor ?? AppColor.disabledE4E5E7)
                                        : (widget.foregroundColor ?? AppColor.primaryOne4B9EFF)),
                              )),
                  ),
          ),
        );

        return button;
      },
    );
  }
}
