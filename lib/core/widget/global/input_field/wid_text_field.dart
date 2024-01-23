import 'package:app_base_flutter/core/theme/app_themes.dart';
import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/uttils/icons.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputBorderStyle { bordered, underlined }

class AppInputText extends StatefulWidget {
  const AppInputText({
    Key? key,
    this.height = AppSize.s46,
    this.multiline = 1,
    this.multilineAutoExpandable = false,
    this.inputFormatters,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.error = false,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.labelText,
    this.labelPadding,
    this.helperText,
    this.counterText,
    this.readOnly = false,
    this.suffixIcon,
    this.helperLeft,
    this.errorText,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFocusChange,
    this.sufFIX,
    this.suffix,
    this.borderStyle = InputBorderStyle.bordered,
    this.textInputAction,
    this.prefix,
    this.preFIX,
    this.preFIXWidth,
    this.preFIXHeight,
    this.preFIXSideGap = AppSize.s18,
    this.sufFIXWidth,
    this.sufFIXHeight,
    this.autofocus = false,
    this.focusNode,
    this.contentPadding,
    this.enable = true,
    this.fillColor,
    this.textAlign,
  }) : super(key: key);

  final FocusNode? focusNode;
  final double height;
  final int multiline;
  final bool multilineAutoExpandable;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final Widget? preFIX;
  final double? preFIXWidth;
  final double? preFIXHeight;
  final double preFIXSideGap;
  final InputBorderStyle borderStyle;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final Widget? sufFIX;
  final double? sufFIXWidth;
  final double? sufFIXHeight;
  final IconData? suffixIcon;
  final double? helperLeft;
  final String? labelText;
  final EdgeInsetsGeometry? labelPadding;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool autofocus;
  final bool error;
  final String? initialValue;
  final String? helperText;
  final String? counterText;
  final bool readOnly;
  final Color? fillColor;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final EdgeInsets? contentPadding;
  final bool enable;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function()? onTap;
  final String? Function()? onEditingComplete;
  final String? Function(bool?)? onFocusChange;

  @override
  State<AppInputText> createState() => _AppInputTextState();
}

class _AppInputTextState extends State<AppInputText> {
  bool obscureText = false;
  late FocusNode focus;

  double get inputPaddingFraction {
    return widget.multiline > (1) ? (5) : ((AppSize.s50 - height) / 2);
  }

  double get height {
    if (widget.multiline > 1) {
      return widget.height + (widget.multiline * AppSize.s50);
    } else {
      return widget.height;
    }
  }

  void onFocusChange() {
    widget.onFocusChange?.call(focus.hasFocus);
  }

  TextInputType? _keyboardType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType;
    } else {
      if ((widget.multiline > 1 || widget.multilineAutoExpandable)) {
        return TextInputType.multiline;
      } else {
        TextInputType.none;
      }
    }
    return null;
  }

  Color get readOnlyBorderColor => AppColor.disabledE4E5E7;
  double get focusedBorderWidth => widget.readOnly ? 1 : 1.3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: widget.labelPadding ?? const EdgeInsets.symmetric(vertical: 5),
            child: AppText.inputLabel(widget.labelText),
          ),

        Container(
          height: height,
          constraints: BoxConstraints(
            maxHeight: widget.obscureText ? AppSize.s50 : AppSize.s800,
            minHeight: AppSize.s40,
          ), // height,
          decoration: BoxDecoration(
            color: AppColor.info10CCE4.withOpacity(0.2),
            borderRadius: BorderRadius.circular(AppTheme.inputFieldBorderRadius),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// Input TextField
              Theme(
                data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                    constraints: const BoxConstraints(
                      maxHeight: 100,
                      maxWidth: 400,
                    ),
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    filled: true,
                    fillColor: widget.fillColor ?? AppColor.whiteFFFFFF,
                    errorMaxLines: 2,
                    helperMaxLines: 2,
                    prefixIconColor: AppColor.primaryOne4B9EFF,
                    suffixIconColor: AppColor.primaryTwo10CCE4,
                    hoverColor: AppColor.whiteFFFFFF,
                    prefixStyle: AppTextStyle.inputText(
                      color: AppColor.darkLightest6C7576,
                    ),
                    suffixStyle: AppTextStyle.inputText(
                      color: AppColor.darkLightest6C7576,
                    ),
                    hintStyle: AppTextStyle.bodySmall(color: AppColor.inputHintColor),
                    labelStyle: AppTextStyle.inputLabel(),
                    floatingLabelStyle: AppTextStyle.inputLabel(),
                    counterStyle: AppTextStyle.inputHelper(),
                    helperStyle: AppTextStyle.inputHelper(),
                    errorStyle: AppTextStyle.inputError(),
                  ),
                ),
                child: TextFormField(
                  enabled: widget.enable,
                  textAlign: widget.textAlign ?? TextAlign.start,
                  autofocus: widget.autofocus,
                  focusNode: focus,
                  initialValue: widget.controller == null ? widget.initialValue : null,
                  onChanged: widget.onChanged,
                  controller: widget.controller,
                  keyboardType: _keyboardType(),
                  obscureText: obscureText,
                  validator: widget.validator,
                  onTap: widget.onTap,
                  onEditingComplete: widget.onEditingComplete,
                  cursorColor: AppColor.dark202125,
                  style: AppTextStyle.inputText(color: widget.readOnly ? AppColor.dark202125.withOpacity(0.5) : null),
                  maxLines: widget.obscureText ? 1 : (widget.multilineAutoExpandable ? null : widget.multiline),
                  readOnly: widget.readOnly,
                  textInputAction: widget.multilineAutoExpandable ? TextInputAction.none : widget.textInputAction,
                  inputFormatters: widget.inputFormatters,
                  decoration: InputDecoration(
                    contentPadding: widget.contentPadding ??
                        EdgeInsets.only(
                          left: widget.borderStyle == InputBorderStyle.underlined
                              ? 0
                              : widget.preFIX != null
                                  ? AppPadding.p15 + (widget.preFIXWidth ?? height) + widget.preFIXSideGap
                                  : AppPadding.p15,
                          right: widget.borderStyle == InputBorderStyle.underlined ? 0 : AppPadding.p15,
                          top: AppPadding.p10 - inputPaddingFraction, // TODO : FIX IT
                          bottom: AppPadding.p10 - inputPaddingFraction, // TODO : FIX IT
                        ),
                    suffix: widget.suffix,
                    prefix: widget.prefix,
                    hintText: widget.hintText,
                    suffixIcon: widget.obscureText
                        ? InkWell(
                            onTap: () => setState(() => obscureText = !obscureText),
                            child: obscureText
                                ? AppIcon.inputTextField(Icons.visibility_off_outlined)
                                : AppIcon.inputTextField(Icons.visibility_outlined),
                          )
                        : widget.suffixIcon != null
                            ? AppIcon.inputTextField(widget.suffixIcon!)
                            : null,
                    /* Border Part */
                    // Border
                    border: widget.borderStyle == InputBorderStyle.underlined
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly ? readOnlyBorderColor : AppColor.inputBorderRegularE4E5E7,
                              width: AppSize.s1,
                            ),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly ? readOnlyBorderColor : AppColor.inputBorderRegularE4E5E7,
                              width: AppSize.s1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppTheme.inputFieldBorderRadius,
                              ),
                            ),
                          ),

                    // Enabled Border
                    enabledBorder: widget.borderStyle == InputBorderStyle.underlined
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: !widget.error ? AppColor.inputBorderRegularE4E5E7 : AppColor.errorFE6C44,
                              width: AppSize.s1,
                            ),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly
                                  ? readOnlyBorderColor
                                  : (!widget.error ? AppColor.inputBorderRegularE4E5E7 : AppColor.errorFE6C44),
                              width: AppSize.s1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppTheme.inputFieldBorderRadius,
                              ),
                            ),
                          ),

                    // Focus Border
                    focusedBorder: widget.borderStyle == InputBorderStyle.underlined
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly
                                  ? readOnlyBorderColor
                                  : (!widget.error ? AppColor.inputBorderFocus469FFF : AppColor.errorFE6C44),
                              width: focusedBorderWidth,
                            ),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly
                                  ? readOnlyBorderColor
                                  : (!widget.error ? AppColor.inputBorderFocus469FFF : AppColor.errorFE6C44),
                              width: focusedBorderWidth,
                            ),
                            borderRadius: widget.borderStyle == InputBorderStyle.underlined
                                ? BorderRadius.circular(0)
                                : const BorderRadius.all(
                                    Radius.circular(
                                      AppTheme.inputFieldBorderRadius,
                                    ),
                                  ),
                          ),

                    // Error Border
                    errorBorder: widget.borderStyle == InputBorderStyle.underlined
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly ? readOnlyBorderColor : AppColor.errorFE6C44,
                              width: AppSize.s1,
                            ),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly ? readOnlyBorderColor : AppColor.errorFE6C44,
                              width: AppSize.s1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppTheme.inputFieldBorderRadius,
                              ),
                            ),
                          ),

                    // Focus Error Border
                    focusedErrorBorder: widget.borderStyle == InputBorderStyle.underlined
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly ? readOnlyBorderColor : AppColor.errorFE6C44,
                              width: AppSize.s1,
                            ),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly ? readOnlyBorderColor : AppColor.errorFE6C44,
                              width: AppSize.s1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppTheme.inputFieldBorderRadius,
                              ),
                            ),
                          ),

                    // Disabled Border
                    disabledBorder: widget.borderStyle == InputBorderStyle.underlined
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: widget.readOnly ? readOnlyBorderColor : AppColor.whiteLightestGrayF8F8F8,
                              width: AppSize.s1,
                            ),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  widget.readOnly && !widget.enable ? AppColor.inputBorderRegularE4E5E7 : AppColor.whiteLightestGrayF8F8F8,
                              width: AppSize.s1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                AppTheme.inputFieldBorderRadius,
                              ),
                            ),
                          ),
                  ),
                ),
              ),

              /// Prefix Fixed
              widget.preFIX != null
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: widget.preFIXSideGap),
                        width: widget.preFIXWidth,
                        height: widget.preFIXHeight,
                        child: widget.preFIX,
                      ),
                    )
                  : Container(),

              /// Suffix Fixed
              widget.sufFIX != null
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: widget.sufFIXWidth,
                        height: widget.sufFIXHeight,
                        child: widget.sufFIX,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),

        /// Error Or HelperText
        widget.error || widget.helperText != null || widget.counterText != null
            ? Padding(
                padding: EdgeInsets.only(
                  top: AppPadding.p3,
                  left: widget.helperLeft ?? AppPadding.p12,
                  right: AppPadding.p12,
                ),
                child: Row(
                  children: [
                    widget.errorText != null || widget.helperText != null
                        ? Expanded(
                            child: AppText.bodyExtraSmall(
                              widget.error ? (widget.errorText ?? widget.helperText) : widget.helperText,
                              color: widget.error ? AppColor.errorFE6C44 : AppColor.darkLightest6C7576,
                            ),
                          )
                        : Container(),
                    // const Spacer(),
                    widget.counterText != null
                        ? AppText.bodyExtraSmall(
                            widget.counterText,
                            color: widget.error ? AppColor.errorFE6C44 : AppColor.darkLightest6C7576,
                          )
                        : Container()
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  void initState() {
    if (widget.controller != null && widget.initialValue != null) {
      widget.controller!.text = widget.initialValue!;
    }
    focus = widget.focusNode ?? FocusNode();
    obscureText = widget.obscureText;
    focus.addListener(onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    focus.removeListener(onFocusChange);
    super.dispose();
  }
}
