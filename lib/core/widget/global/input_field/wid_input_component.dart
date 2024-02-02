import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/fonts.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/uttils/extensions.dart';
import 'package:app_base_flutter/core/uttils/icons.dart';
import 'package:app_base_flutter/core/uttils/toasts.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/dailog/wid_date_time_dialogue.dart';
import 'package:app_base_flutter/core/widget/global/divider/wid_divider.dart';
import 'package:app_base_flutter/core/widget/global/text/wid_readmore_text.dart';
import 'package:app_base_flutter/generated/assets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

enum DataType { text, tap, dropDown, date }

/// DropDown Small Model
class DropdownModel {
  DropdownModel({
    this.title = '',
    this.valueOne,
    this.valueTwo,
  });

  final String title;
  final dynamic valueOne;
  final dynamic valueTwo;
}

/// Main Widget -->

class WidgetInputComponent extends StatefulWidget {
  const WidgetInputComponent({
    Key? key,
    required this.labelText,
    this.hints,
    this.helpText,
    this.errorText,
    this.isError = false,
    this.prefix,
    this.prefixText,
    this.sideButtonText = 'Edit',
    this.sideButtonTextPressed = 'Save',
    this.sideButton,
    this.sideButtonColor,
    this.sideButtonPressed,
    this.value,
    this.initialValue,
    this.secondaryValue,
    this.dateTimeFormat = 'dd MMM yy, hh:mm',
    this.disableDate,
    this.readOnly = true,
    this.dividerIndent = 0,
    this.maxLength,
    this.pageReadOnly = true,
    this.padding = EdgeInsets.zero,
    this.innerPadding = EdgeInsets.zero,
    this.dataType = DataType.text,
    this.isUploadField = false,
    this.includeExistingToDropDown = false,
    this.dropDownItems = const [],
    this.suggestionList = const [],
    this.onTap,
    this.focusNode,
    this.onEdit,
    this.onChange,
    this.onFocusChange,
    this.inputType,
  }) : super(key: key);

  final String? value;
  final String labelText;
  final String? hints;
  final String? helpText;
  final String? errorText;
  final bool isError;
  final Widget? prefix;
  final String? prefixText;
  final String sideButtonText;
  final String sideButtonTextPressed;
  final Widget? sideButton;
  final Color? sideButtonColor;
  final Widget? sideButtonPressed;
  final String? initialValue;
  final String? secondaryValue;
  final String dateTimeFormat;
  final bool? disableDate;
  final bool readOnly;
  final double dividerIndent;
  final bool pageReadOnly;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry innerPadding;
  final DataType dataType;
  final bool isUploadField;
  final TextInputType? inputType;
  final int? maxLength;
  final bool includeExistingToDropDown;
  final List<DropdownModel> dropDownItems;
  final Function()? onTap;
  final List<String> suggestionList;
  final FocusNode? focusNode;
  final Function(String title, String value)? onEdit;
  final Function(String, TextEditingController)? onChange;
  final String? Function(bool?)? onFocusChange;

  @override
  State<WidgetInputComponent> createState() => _WidgetInputComponentState();
}

class _WidgetInputComponentState extends State<WidgetInputComponent> {
  TextEditingController controller = TextEditingController();
  ExpandableController controllerExpandable = ExpandableController(initialExpanded: false);
  String textValue = '';
  String textTitle = '';
  bool enable = false;
  bool dropdownExpansion = false;
  late FocusNode focus;

  static FocusNode sharedFocusNode = FocusNode();

  OverlayEntry? _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: ExpandablePanel(
        controller: controllerExpandable,
        theme: const ExpandableThemeData(
          hasIcon: false,
          tapBodyToCollapse: false,
          useInkWell: false,
        ),
        collapsed: const SizedBox.shrink(),
        header: Column(
          children: [
            GestureDetector(
              onTap: () => widget.onTap?.call(),
              child: Container(
                padding: widget.innerPadding,
                constraints: const BoxConstraints(
                  minHeight: 65,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: widget.pageReadOnly
                      ? null
                      : () {
                          if (widget.dataType == DataType.tap) {
                            widget.onTap?.call();
                          } else {
                            Future.delayed(AppDuration.milliseconds100, () => FocusManager.instance.primaryFocus?.unfocus());
                            setState(() {
                              enable = !enable;
                              Future.delayed(AppDuration.milliseconds100, () => FocusScope.of(context).requestFocus(widget.focusNode));
                            });
                            if (widget.dataType == DataType.dropDown) {
                              controllerExpandable.expanded = dropdownExpansion = !dropdownExpansion;
                            }
                          }
                          if (widget.dataType == DataType.date) {
                            dateTimeDialog();
                          }
                        },
                  child: Row(
                    children: [
                      // Text and Input Text
                      _textAndInputText(),

                      // For Right Side Items
                      (widget.onTap != null)
                          ? widgetOnEdit()
                          : (widget.pageReadOnly)
                              ? const SizedBox.shrink()
                              : _rightSideClickableDynamicElements(context),
                    ],
                  ),
                ),
              ),
            ),
            _divider(),
            _helpText()
          ],
        ),

        /// For DropDown
        expanded: (widget.dataType == DataType.dropDown) ? _dropdown(context) : const SizedBox.shrink(),
      ),
    );
  }

  /// ******************** WIDGETS *********************

  /// Text and Input Text
  Widget _textAndInputText() {
    if (widget.value != null) textTitle = widget.value!;
    return Expanded(
      child: widget.dataType != DataType.text
          ? _readMoreTextWidget(widget.value.toDataWhenNullOrEmpty(textTitle.toDataWhenNullOrEmpty(widget.labelText)))
          : enable
              ? _textField()
              : _readMoreTextWidget(textTitle),
    );
  }

  /// Dropdown Element
  Center _dropdown(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 0, right: 0),
        width: MediaQuery.of(context).size.width - 0,
        constraints: const BoxConstraints(maxHeight: 195),
        color: Colors.white,
        child: Card(
          elevation: 0,
          color: AppColor.whiteFFFFFF,
          shadowColor: AppColor.blackOpacity40000000,
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: _getDropDownItems(),
          ),
        ),
      ),
    );
  }

  /// Get Dropdown Menu Items
  List<Widget> _getDropDownItems() {
    if (widget.includeExistingToDropDown) {
      return widget.dropDownItems.map((e) => _dropDownMenuItem(e)).toList();
    } else {
      return widget.dropDownItems.where((e) => (e.title != (widget.value ?? textTitle))).toList().map((e) => _dropDownMenuItem(e)).toList();
    }
  }

  /// Dropdown Menu Style
  Widget _dropDownMenuItem(DropdownModel dropdownModel) {
    return InkWell(
      onTap: () {
        setState(() => enable = !enable);
        bool isEqual = (textTitle == dropdownModel.title);
        if (isEqual) {
          if (!enable) AppToasts.error(msg: 'Already selected');
        } else {
          textValue = dropdownModel.valueOne; // Global Variable
          setState(() => textTitle = dropdownModel.title); // Global Variable);
          widget.onEdit?.call(textTitle, textValue);
        }
        controllerExpandable.expanded = dropdownExpansion = !dropdownExpansion;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(dropdownModel.title, style: AppTextStyle.bodyVerySmall(color: AppColor.dark202125)),
          ),
          const AppDivider(),
        ],
      ),
    );
  }

  /// Text Field
  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: TextField(
          maxLength: widget.maxLength,
          controller: controller,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColor.dark202125),
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          keyboardType: widget.inputType ?? TextInputType.multiline,
          maxLines: null,
          onChanged: (v) => widget.onChange?.call(v, controller),
          decoration: InputDecoration(
              enabled: enable,
              labelText: widget.labelText,
              labelStyle: controller.text.isNotEmpty ? AppTextStyle.bodyExtraSmallPlus() : Theme.of(context).textTheme.bodySmall,
              border: InputBorder.none,
              hintText: widget.hints ?? '-',
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefix: widget.prefix ??
                  (widget.prefixText != null ? AppText.bodyVerySmall(widget.prefixText, color: AppColor.dark202125) : null)),
        ),
      ),
    );
  }

  /// Read More text
  Widget _readMoreTextWidget(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: (widget.initialValue.isNotNull()) ? 10 : 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.initialValue.isNotNull() && text.isNotEmpty && (text != widget.labelText)) AppText.bodyExtraSmall(widget.labelText),
          if (widget.initialValue.isNotNull() && text.isNotEmpty && (text != widget.labelText)) AppGap.vertical(2),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: WidgetReadMoreText(
              text: text.toDataWhenNullOrEmpty(widget.labelText),
              textStyle: AppTextStyle.bodySmall(
                  color: (widget.includeExistingToDropDown && enable && widget.dataType == DataType.dropDown)
                      ? AppColor.disabledE4E5E7
                      : AppColor.dark202125),
              moreStyle: AppTextStyle.bodySmall(color: AppColor.primaryOne4B9EFF),
              lessStyle: AppTextStyle.bodySmall(color: AppColor.primaryOne4B9EFF),
            ),
          ),
        ],
      ),
    );
  }

  /// Edit |  Change  | Nav Arrow Section Widget
  Widget _rightSideClickableDynamicElements(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        setState(() => enable = !enable);

        /// Input text
        if (widget.dataType == DataType.text) {
          Future.delayed(AppDuration.milliseconds100, () => FocusScope.of(context).requestFocus(widget.focusNode));
          bool isEqual = (textTitle == controller.text);
          if (isEqual) {
            if (!enable) AppToasts.error(msg: 'Nothing to change');
          } else {
            textTitle = textValue = controller.text;
            widget.onEdit?.call(textTitle, textValue);
          }
        }

        /// Dropdown
        if (widget.dataType == DataType.dropDown) {
          controllerExpandable.expanded = dropdownExpansion = !dropdownExpansion;
        }
        if (widget.dataType == DataType.date) {
          dateTimeDialog();
        }
      },
      child: enable ? widgetOnSave() : buttonWidget(widgetOnEdit()),
    );
  }

  /// Edit / Save Button
  Widget buttonWidget(Widget child) => SizedBox(
        height: 50,
        child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 6),
              child: child,
            )),
      );

  // Widget Depending On DataType
  Widget widgetOnEdit() {
    switch (widget.dataType) {
      case DataType.text:
        return widget.sideButton ?? _editSaveText(widget.sideButtonText);
      case DataType.dropDown:
        return widget.sideButton ?? _editSaveText(widget.sideButtonText);
      case DataType.date:
        return widget.sideButton ?? _editSaveText(widget.sideButtonText);
      case DataType.tap:
        return widget.isUploadField ? _editSaveText(widget.sideButtonText) : widget.sideButton ?? appSVG(Assets.svgLeftChevron);
    }
  }

  // Widget Depending On DataType
  Widget widgetOnSave() {
    switch (widget.dataType) {
      case DataType.text:
        return widget.sideButtonPressed ?? const SizedBox.shrink(); //_editSaveText(widget.sideButtonTextPressed);
      case DataType.dropDown:
        return widget.sideButtonPressed ?? Icon(Icons.keyboard_arrow_down_rounded, size: 24, color: AppColor.inputBorderRegularE4E5E7);
      case DataType.date:
        return widget.sideButtonPressed ?? Icon(Icons.calendar_month, size: 18, color: widget.sideButtonColor ?? Colors.black);
      case DataType.tap:
        return widget.sideButtonPressed ?? appSVG(Assets.svgLeftChevron, color: widget.sideButtonColor);
    }
  }

  void dateTimeDialog() async {
    DateTime initialDate = DateTime.now();

    if (widget.secondaryValue != null) {
      if (widget.secondaryValue != 'null') initialDate = DateTime.parse(widget.secondaryValue!);
    }

    await datePickerDialogue(
        initialDate: initialDate,
        onChange: (value) {
          if (value != null) {
            bool isEqual = (textTitle == '$value'.dateTimeFormat(format: widget.dateTimeFormat));
            if (isEqual) {
              AppToasts.error(msg: 'Select different date');
            } else {
              setState(() => textTitle = '$value'.dateTimeFormat(format: widget.dateTimeFormat));
              textValue = '$value';
              widget.onEdit?.call(textTitle, textValue);
            }
          }
        },
        isBefore: widget.disableDate);
    setState(() => enable = !enable);
  }

  /// Divider
  AppDivider _divider() {
    return AppDivider(
      indent: widget.dividerIndent,
      color: enable ? AppColor.primaryOne4B9EFF : null,
      thickness: enable ? 1 : 0.5,
    );
  }

  /// Edit | Save Text
  Widget _editSaveText(String text) {
    return Opacity(
      opacity: widget.readOnly ? 0.45 : 1,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: AppFontWeight.w400,
            color: widget.sideButtonColor ?? AppColor.primaryOne4B9EFF,
            decoration: TextDecoration.underline,
            decorationColor: widget.sideButtonColor ?? AppColor.primaryOne4B9EFF),
      ),
    );
  }

  void onFocusChange() {
    widget.onFocusChange?.call(focus.hasFocus);
    setState(() {
      enable = focus.hasFocus;
      controllerExpandable.expanded = dropdownExpansion = focus.hasFocus;
    });
    if (widget.dataType == DataType.text) {
      if (widget.suggestionList.isNotEmpty) {
        setState(() {
          _overlayEntry = _createOverlayEntry(context);
          Overlay.of(context).insert(_overlayEntry!);
        });
      }
      controller.addListener(() {
        bool isEqual = (textTitle == controller.text);
        if (isEqual) {
          if (!enable) AppToasts.error(msg: 'Nothing to change');
        } else {
          textTitle = textValue = controller.text;
          widget.onEdit?.call(textTitle, textValue);
        }
      });
    }
  }

  @override
  void initState() {
    textTitle = controller.text = widget.initialValue ?? '';
    focus = widget.focusNode ?? sharedFocusNode;
    focus.addListener(onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    focus.removeListener(onFocusChange);
    super.dispose();
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                targetAnchor: Alignment.topCenter,
                followerAnchor: Alignment.topCenter,
                offset: Offset(0.0, size.height + 5.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 18),
                  child: Material(
                    elevation: 2.0,
                    clipBehavior: Clip.hardEdge,
                    color: AppColor.whiteFFFFFF,
                    child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: widget.suggestionList
                            .map((e) => InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    textTitle = textValue = controller.text = e;
                                    setState(() {
                                      _overlayEntry?.remove();
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                                    child: Text(
                                      e,
                                      style: AppTextStyle.bodyVerySmall(color: AppColor.dark202125),
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                ),
              ),
            ));
  }

  Widget _helpText() {
    return (widget.helpText != null && widget.helpText!.isNotEmpty) || (widget.errorText != null && widget.errorText!.isNotEmpty)
        ? Padding(
            padding: widget.innerPadding,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 12,
                    color: widget.isError ? AppColor.errorFE6C44 : AppColor.inputTitleColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  AppText.bodyExtraSmall(
                    widget.isError ? widget.errorText : widget.helpText,
                    color: widget.isError ? AppColor.errorFE6C44 : AppColor.inputTitleColor,
                  )
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
