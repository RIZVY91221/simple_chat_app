import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class WidgetCustomGroupInput extends StatelessWidget {
  WidgetCustomGroupInput({
    Key? key,
    required this.typeList,
    required this.initialValue,
    this.onChangeValue,
    this.boxSize,
    this.isIconRequired = false,
    this.disableColor,
    this.isHorizontal = false,
    this.isCheckbox = false,
    this.titleChild,
    this.disable,
  }) : super(key: key);
  final List<String> typeList;
  final Function(String)? onChangeValue;
  final String initialValue;
  final bool isIconRequired;
  final double? boxSize;
  final Color? disableColor;
  final bool isHorizontal;
  final bool isCheckbox;
  final Widget Function(bool)? titleChild;
  final List<String>? disable;

  Rx<String> value = ''.obs;
  Rx<bool> horizontalAlignment = false.obs;
  @override
  Widget build(BuildContext context) {
    value.value = initialValue;
    horizontalAlignment.value = isHorizontal;
    List<Widget> items = typeList
        .map((e) => Obx(() => CustomItems(
              title: e,
              name: e,
              boxSize: boxSize,
              isIconRequired: isIconRequired,
              isCheckbox: isCheckbox,
              value: value.value,
              disableColor: disableColor,
              onChangeItem: (s) {
                if (disable != null && disable!.any((e) => e.contains(s))) {
                } else {
                  value.value = s;
                  onChangeValue?.call(s);
                }
              },
              titleChild: titleChild,
            )))
        .toList();
    return Obx(
      () => !horizontalAlignment.value
          ? Column(
              children: items,
            )
          : Row(
              children: items,
            ),
    );
  }
}

// ignore: must_be_immutable
class CustomItems extends StatelessWidget {
  CustomItems({
    Key? key,
    this.title = 'Radio Button',
    required this.name,
    required this.value,
    this.onChangeItem,
    this.isCheckbox = false,
    this.boxSize,
    this.isIconRequired = true,
    this.disableColor,
    this.titleChild,
  }) : super(key: key);

  final String? title;
  final String name;
  final String value;
  final bool isIconRequired;
  final bool isCheckbox;
  final double? boxSize;
  final Color? disableColor;
  final Function(String)? onChangeItem;
  final Widget Function(bool)? titleChild;

  Rx<bool> circleClicked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p20, bottom: AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(isCheckbox ? 0 : 27),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                circleClicked.value = !circleClicked.value;
                onChangeItem?.call(name);
                // checkItem.value = orderType;
              },
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                width: boxSize ?? 20,
                height: boxSize ?? 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isCheckbox ? 0 : 27),
                  border: Border.all(
                    width: boxSize != null ? boxSize! / 15 : 1,
                    color: value == name ? AppColor.primaryOne4B9EFF : disableColor ?? AppColor.inputBorderRegularE4E5E7,
                  ),
                  //color: circleClicked.value ? AppColor.secondaryFour877DF8 : AppColor.transparent,
                ),
                child: value == name
                    ? Padding(
                        padding: EdgeInsets.all(isIconRequired
                            ? 0.0
                            : boxSize != null
                                ? boxSize! * 0.22
                                : 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(isCheckbox ? 0 : 27),
                            color: AppColor.primaryOne4B9EFF,
                          ),
                          child: isIconRequired
                              ? Center(
                                  child: Icon(
                                    Icons.done,
                                    size: boxSize != null ? boxSize! * 0.80 : 17,
                                    color: AppColor.whiteFFFFFF,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      )
                    : Container(),
              ),
            ),
          ),
          AppGap.horizontal10,
          titleChild?.call(value == name) ??
              AppText.headline6(
                title,
                color: value == name ? AppColor.darkLight4D4D50 : disableColor ?? AppColor.inputBorderRegularE4E5E7,
              )
        ],
      ),
    );
  }
}
