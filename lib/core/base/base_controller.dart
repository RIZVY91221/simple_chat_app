import 'dart:async';

import 'package:app_base_flutter/core/enum.dart';
import 'package:app_base_flutter/core/network/exceptions/api_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/app_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/json_format_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/network_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/not_found_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/service_unavailable_exception.dart';
import 'package:app_base_flutter/core/network/exceptions/unauthorize_exception.dart';
import 'package:app_base_flutter/environment/build_config.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class BaseController extends GetxController {
  final Logger logger = BuildConfig.instance.envVariables.logger;

  //AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final logoutController = false.obs;

  //Reload the page
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  showSuccessMessage(String msg) => _successMessageController(msg);

  // ignore: long-parameter-list
  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.status);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.status);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message ?? 'Timeout exception');
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.toString());
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.toString());
    } on ApiException catch (exception) {
      _exception = exception;
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.toString());
    } catch (error,trac) {
      _exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
      logger.e("Controller>>>>>> trac $trac");
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }
}
