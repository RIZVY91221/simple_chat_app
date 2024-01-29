import 'package:app_base_flutter/core/widget/global/dailog/wid_dialog.dart';
import 'package:app_base_flutter/core/widget/global/date_time/wid_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> datePickerDialogue({Function(DateTime?)? onChange, DateTime? initialDate, bool? isBefore}) async {
  await appDialogue(
    height: 405,
    padding: const EdgeInsets.only(top: 5),
    child: AppDateTime(
      initialDate: initialDate,
      onChange: (value) {
        onChange?.call(value);
        Get.back();
      },
      onPressToday: (value) {
        onChange?.call(value);
        Get.back();
      },
      isBefore: isBefore,
    ),
    barrierDismissible: true,
  );
}
