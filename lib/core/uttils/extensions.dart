import 'package:intl/intl.dart';

extension Strings on String? {
  // If Null then Blank
  String empty() => '';

  // If Null then Blank
  String toBlank() => this ?? '';

  // Check if Not Null or Null
  bool isNotNull() => this != null ? true : false;

  // If Empty or Null then it returns provided Data
  String toDataWhenNullOrEmpty(dynamic data) => toBlank().isEmpty ? '$data' : toBlank();

  // Date Time Format
  String dateTimeFormat({String format = 'dd MMM yy, kk:mm', String fallback = ''}) {
    if (this != null && this != '') {
      try {
        DateTime parsedDate = DateTime.parse(this!);
        return DateFormat(format).format(parsedDate);
      } catch (_) {}
    }
    return fallback;
  }
}
