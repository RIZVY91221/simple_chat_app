import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/theme/text.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard(
      {super.key,
      required this.detailsKey,
      this.detailsValue = '',
      this.titleColor,
      this.isExpand = true,
      this.valueColor,
      this.valueChild});

  final String detailsKey;
  final String detailsValue;
  final Color? titleColor;
  final Color? valueColor;
  final bool? isExpand;
  final Widget? valueChild;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.detailsKey != '') AppText.bodyVerySmall(widget.detailsKey, color: widget.titleColor ?? AppColor.darkLight4D4D50),
        if (widget.detailsValue != '')
          !widget.isExpand!
              ? widget.detailsValue.contains("Canceled")
                  ? CanceledValueChecker(
                      value: widget.detailsValue,
                    )
                  : AppText.bodyVerySmall(widget.detailsValue, color: widget.valueColor ?? AppColor.dark202125)
              : Expanded(
                  child: widget.detailsValue.contains("Canceled")
                      ? CanceledValueChecker(
                          value: widget.detailsValue,
                        )
                      : AppText.bodyVerySmall(widget.detailsValue, color: widget.valueColor ?? AppColor.dark202125),
                ),
        if (widget.valueChild != null)
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: widget.valueChild!,
          )
      ],
    );
  }
}

class CanceledValueChecker extends StatelessWidget {
  const CanceledValueChecker({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: value
            .split(',')
            .toList()
            .asMap()
            .map((index, e) => MapEntry(
                index,
                Row(
                  children: [
                    AppText.bodyVerySmall(e.contains("Canceled") ? "Cancelled" : e,
                        color: e.contains("Canceled") ? AppColor.errorFE6C44 : AppColor.dark202125),
                    index == value.split(',').toList().length - 1
                        ? const SizedBox.shrink()
                        : AppText.bodyVerySmall(',', color: AppColor.dark202125)
                  ],
                )))
            .values
            .toList());
  }
}
