import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/input_field/wid_input_component.dart';
import 'package:app_base_flutter/core/widget/global/input_field/wid_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextInput extends AppInputText {
  const BaseTextInput({
    Key? key,
    FocusNode? focusNode,
    double height = AppSize.s46,
    int multiline = 1,
    bool multilineAutoExpandable = false,
    List<TextInputFormatter>? inputFormatters,
    Widget? prefix,
    Widget? preFIX,
    double? preFIXWidth,
    double? preFIXHeight,
    double preFIXSideGap = AppSize.s18,
    InputBorderStyle borderStyle = InputBorderStyle.bordered,
    TextInputAction? textInputAction,
    Widget? suffix,
    Widget? sufFIX,
    double? sufFIXWidth,
    double? sufFIXHeight,
    IconData? suffixIcon,
    double? helperLeft,
    String? labelText,
    EdgeInsetsGeometry? labelPadding,
    String? hintText,
    String? errorText,
    TextEditingController? controller,
    bool obscureText = false,
    bool autofocus = false,
    bool error = false,
    String? initialValue,
    String? helperText,
    String? counterText,
    bool readOnly = false,
    Color? fillColor,
    TextAlign? textAlign,
    TextInputType? keyboardType,
    EdgeInsets? contentPadding,
    bool enable = true,
    String? Function(String?)? validator,
    String? Function(String?)? onChanged,
    String? Function()? onTap,
    String? Function()? onEditingComplete,
    String? Function(bool?)? onFocusChange,
  }) : super(
          key: key,
          focusNode: focusNode,
          height: height,
          multiline: multiline,
          multilineAutoExpandable: multilineAutoExpandable,
          inputFormatters: inputFormatters,
          prefix: prefix,
          preFIX: preFIX,
          preFIXWidth: preFIXWidth,
          preFIXHeight: preFIXHeight,
          preFIXSideGap: preFIXSideGap,
          borderStyle: borderStyle,
          textInputAction: textInputAction,
          suffix: suffix,
          sufFIX: sufFIX,
          sufFIXWidth: sufFIXWidth,
          sufFIXHeight: sufFIXHeight,
          suffixIcon: suffixIcon,
          helperLeft: helperLeft,
          labelText: labelText,
          labelPadding: labelPadding,
          hintText: hintText,
          errorText: errorText,
          controller: controller,
          obscureText: obscureText,
          autofocus: autofocus,
          error: error,
          initialValue: initialValue,
          helperText: helperText,
          counterText: counterText,
          readOnly: readOnly,
          fillColor: fillColor,
          textAlign: textAlign,
          keyboardType: keyboardType,
          contentPadding: contentPadding,
          enable: enable,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFocusChange: onFocusChange,
        );
}

class BaseBorderlessInputText extends WidgetInputComponent {
  const BaseBorderlessInputText({
    Key? key,
    String? value,
    required String labelText,
    String? hints,
    String sideButtonText = 'Edit',
    String sideButtonTextPressed = 'Save',
    Widget? sideButton,
    Color? sideButtonColor,
    Widget? sideButtonPressed,
    String? initialValue,
    String? secondaryValue,
    bool readOnly = true,
    double dividerIndent = 0,
    int? maxLength,
    bool pageReadOnly = true,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry innerPadding = EdgeInsets.zero,
    DataType dataType = DataType.text,
    TextInputType? inputType,
    List<String> suggestionList = const [],
    Function()? onTap,
    FocusNode? focusNode,
    Function(String title, String value)? onEdit,
    String? Function(bool?)? onFocusChange,
  }) : super(
          key: key,
          labelText: labelText,
          value: value,
          hints: hints,
          sideButtonText: sideButtonText,
          sideButtonTextPressed: sideButtonTextPressed,
          sideButton: sideButton,
          sideButtonColor: sideButtonColor,
          sideButtonPressed: sideButtonPressed,
          initialValue: initialValue,
          secondaryValue: secondaryValue,
          readOnly: readOnly,
          maxLength: maxLength,
          dividerIndent: dividerIndent,
          pageReadOnly: pageReadOnly,
          padding: padding,
          innerPadding: innerPadding,
          dataType: dataType,
          inputType: inputType,
          suggestionList: suggestionList,
          onTap: onTap,
          focusNode: focusNode,
          onEdit: onEdit,
        );
}

class BaseLongTextInput extends WidgetInputComponent {
  const BaseLongTextInput({
    Key? key,
    String? value,
    required String labelText,
    String? hints,
    String sideButtonText = 'Edit',
    String sideButtonTextPressed = 'Save',
    Widget? sideButton,
    Color? sideButtonColor,
    Widget? sideButtonPressed,
    String? initialValue,
    String? secondaryValue,
    bool readOnly = true,
    double dividerIndent = 0,
    int maxLength = 300,
    bool pageReadOnly = true,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry innerPadding = EdgeInsets.zero,
    DataType dataType = DataType.text,
    TextInputType? inputType,
    List<String> suggestionList = const [],
    Function()? onTap,
    FocusNode? focusNode,
    Function(String title, String value)? onEdit,
    String? Function(bool?)? onFocusChange,
  }) : super(
          key: key,
          labelText: labelText,
          value: value,
          hints: hints,
          sideButtonText: sideButtonText,
          sideButtonTextPressed: sideButtonTextPressed,
          sideButton: sideButton,
          sideButtonColor: sideButtonColor,
          sideButtonPressed: sideButtonPressed,
          initialValue: initialValue,
          secondaryValue: secondaryValue,
          readOnly: readOnly,
          maxLength: maxLength,
          dividerIndent: dividerIndent,
          pageReadOnly: pageReadOnly,
          padding: padding,
          innerPadding: innerPadding,
          suggestionList: suggestionList,
          dataType: dataType,
          inputType: inputType,
          onTap: onTap,
          focusNode: focusNode,
          onEdit: onEdit,
        );
}

class BaseDropdownInputField extends WidgetInputComponent {
  const BaseDropdownInputField({
    Key? key,
    String? value,
    required String labelText,
    String? hints,
    String sideButtonText = 'Edit',
    String sideButtonTextPressed = 'Save',
    Widget? sideButton,
    Color? sideButtonColor,
    Widget? sideButtonPressed,
    String? initialValue,
    String? secondaryValue,
    bool readOnly = true,
    double dividerIndent = 0,
    int maxLength = 300,
    bool pageReadOnly = true,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry innerPadding = EdgeInsets.zero,
    DataType dataType = DataType.text,
    TextInputType? inputType,
    bool includeExistingToDropDown = false,
    List<DropdownModel> dropDownItems = const [],
    Function()? onTap,
    FocusNode? focusNode,
    Function(String title, String value)? onEdit,
    String? Function(bool?)? onFocusChange,
  }) : super(
          key: key,
          labelText: labelText,
          value: value,
          hints: hints,
          sideButtonText: sideButtonText,
          sideButtonTextPressed: sideButtonTextPressed,
          sideButton: sideButton,
          sideButtonColor: sideButtonColor,
          sideButtonPressed: sideButtonPressed,
          initialValue: initialValue,
          secondaryValue: secondaryValue,
          readOnly: readOnly,
          maxLength: maxLength,
          dividerIndent: dividerIndent,
          pageReadOnly: pageReadOnly,
          padding: padding,
          innerPadding: innerPadding,
          dataType: dataType,
          inputType: inputType,
          includeExistingToDropDown: includeExistingToDropDown,
          dropDownItems: dropDownItems,
          onTap: onTap,
          focusNode: focusNode,
          onEdit: onEdit,
        );
}

class BaseDateInputField extends WidgetInputComponent {
  const BaseDateInputField({
    Key? key,
    String? value,
    required String labelText,
    String? hints,
    String sideButtonText = 'Select',
    String sideButtonTextPressed = 'Save',
    Widget? sideButton,
    Color? sideButtonColor,
    Widget? sideButtonPressed,
    String? initialValue,
    String? secondaryValue,
    String dateTimeFormat = 'dd MMM yy, hh:mm',
    bool? disableDate,
    bool readOnly = false,
    double dividerIndent = 0,
    bool pageReadOnly = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry innerPadding = EdgeInsets.zero,
    DataType dataType = DataType.date,
    TextInputType? inputType,
    Function()? onTap,
    FocusNode? focusNode,
    Function(String title, String value)? onEdit,
    String? Function(bool?)? onFocusChange,
  }) : super(
          key: key,
          labelText: labelText,
          value: value,
          hints: hints,
          sideButtonText: sideButtonText,
          sideButtonTextPressed: sideButtonTextPressed,
          sideButton: sideButton,
          sideButtonColor: sideButtonColor,
          sideButtonPressed: sideButtonPressed,
          initialValue: initialValue,
          secondaryValue: secondaryValue,
          readOnly: readOnly,
          dateTimeFormat: dateTimeFormat,
          dataType: dataType,
          disableDate: disableDate,
          dividerIndent: dividerIndent,
          pageReadOnly: pageReadOnly,
          padding: padding,
          innerPadding: innerPadding,
          inputType: inputType,
          onTap: onTap,
          focusNode: focusNode,
          onEdit: onEdit,
        );
}

class BaseUploadInputField extends WidgetInputComponent {
  const BaseUploadInputField({
    Key? key,
    required String labelText,
    String? hints,
    String sideButtonText = 'Upload',
    String? helpText,
    bool isUploadField = true,
    Color? sideButtonColor,
    String? initialValue,
    bool? disableDate,
    bool readOnly = false,
    double dividerIndent = 0,
    bool pageReadOnly = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry innerPadding = EdgeInsets.zero,
    DataType dataType = DataType.tap,
    Function()? onTap,
    FocusNode? focusNode,
  }) : super(
          key: key,
          labelText: labelText,
          hints: hints,
          helpText: helpText,
          sideButtonText: sideButtonText,
          sideButtonColor: sideButtonColor,
          initialValue: initialValue,
          readOnly: readOnly,
          dataType: dataType,
          disableDate: disableDate,
          dividerIndent: dividerIndent,
          pageReadOnly: pageReadOnly,
          padding: padding,
          innerPadding: innerPadding,
          isUploadField: isUploadField,
          onTap: onTap,
          focusNode: focusNode,
        );
}
