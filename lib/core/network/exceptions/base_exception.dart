abstract class BaseException implements Exception {
  final String message;
  final int statusCode;

  BaseException({this.message = "", this.statusCode = -1});
}
