import 'package:app_base_flutter/core/network/exceptions/base_exception.dart';

class BadRequestException extends BaseException {
  BadRequestException({message, statusCode}) : super(message: message, statusCode: statusCode);

  @override
  String toString() {
    return message;
  }
}
