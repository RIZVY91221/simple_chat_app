import 'package:app_base_flutter/core/theme/text.dart';
import 'package:app_base_flutter/core/widget/global/button/wid_button_static.dart';
import 'package:app_base_flutter/core/widget/global/divider/wid_divider.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class AppDateTime extends StatefulWidget {
  const AppDateTime({Key? key, required this.onChange, this.onPressToday, this.initialDate, this.isBefore}) : super(key: key);

  final Function(DateTime?) onChange;
  final Function(DateTime?)? onPressToday;
  final DateTime? initialDate;
  final bool? isBefore;

  @override
  State<AppDateTime> createState() => _AppDateTimeState();
}

class _AppDateTimeState extends State<AppDateTime> {
  DateTime? dateTime;
  DateTime currentDate = DateTime.now();

  bool _isDateSelectable(DateTime day) {
    if (widget.isBefore != null) {
      if (widget.isBefore == true) {
        return day.isBefore(widget.initialDate ?? currentDate);
      } else {
        return day.isAfter(widget.initialDate ?? currentDate);
      }
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            selectableDayPredicate: _isDateSelectable,
            centerAlignModePicker: true,
            selectedDayHighlightColor: Theme.of(context).primaryColor,
            dayBorderRadius: BorderRadius.circular(0),
            // currentDate: currentDate,
          ),
          value: [widget.initialDate],
          onValueChanged: (value) {
            currentDate = value[0] ?? DateTime.now();
            widget.onChange.call(currentDate);
          },
        ),
        const AppDivider(),
        AppStaticButton(
          height: 50,
          child: AppText.link('Today'),
          onPressed: () {
            setState(() => currentDate = DateTime.now());
            widget.onPressToday?.call(currentDate);
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    if (widget.initialDate != null) currentDate = widget.initialDate!;
    super.initState();
  }
}
