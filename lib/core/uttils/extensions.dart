extension Strings on String? {
  // If Null then Blank
  String empty() => '';

  // If Null then Blank
  String toBlank() => this ?? '';

  // Check if Not Null or Null
  bool isNotNull() => this != null ? true : false;

  // If Empty or Null then it returns provided Data
  String toDataWhenNullOrEmpty(dynamic data) => toBlank().isEmpty ? '$data' : toBlank();
}
