import 'package:app_base_flutter/core/uttils/toasts.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:app_base_flutter/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final BaseRepository repository;

  GlobalController({required this.repository});
  final _shorebirdCodePush = ShorebirdCodePush();
  var isCheckingForUpdate = false.obs;
  var currentPatchNumber = 0.obs;
  var currentLocale = "".obs;

  @override
  void onInit() {
    getCurrentPatchNumber();
    super.onInit();
  }

  Future<void> getCurrentPatchNumber() async {
    _shorebirdCodePush.currentPatchNumber().then((currentPatchVersion) {
      currentPatchNumber.value = currentPatchVersion ?? 0;
    });
  }

  Future<void> checkForUpdate() async {
    isCheckingForUpdate.value = true;
    // Ask the Shorebird servers if there is a new patch available.
    final isUpdateAvailable = await _shorebirdCodePush.isNewPatchAvailableForDownload();

    if (isUpdateAvailable) {
      isCheckingForUpdate.value = false;
      _showUpdateAvailableBanner();
    } else {
      isCheckingForUpdate.value = false;
    }
  }

  Future<void> _downloadUpdate() async {
    _showDownloadingBanner();
    await Future.wait([
      _shorebirdCodePush.downloadUpdateIfAvailable(),
      // Add an artificial delay so the banner has enough time to animate in.
      Future<void>.delayed(const Duration(milliseconds: 500)),
    ]);

    AppToasts.closeBanner();

    _showRestartBanner();
  }

  void _showUpdateAvailableBanner() => AppToasts.defaultBanner(
      msg: "Update available",
      isActionRequired: true,
      actionText: "Download",
      onPressAction: () async {
        AppToasts.closeBanner();
        await _downloadUpdate();
        AppToasts.closeBanner();
      });

  void _showDownloadingBanner() => AppToasts.defaultBanner(msg: "Downloading...", action: [
        const SizedBox(
          height: 14,
          width: 14,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        )
      ]);
  void _showRestartBanner() => AppToasts.defaultBanner(
      msg: "A new patch is ready!",
      isActionRequired: true,
      actionText: "Restart",
      onPressAction: () {
        isCheckingForUpdate.value = false;
        Restart.restartApp();
      });

  void setLocale(String localeCode) {
    repository.setCurrentLocale(localeCode);
    currentLocale.value = localeCode;
    AppTranslation.useTranslatorDecider(true);
  }

  void setInitialLocale(String localeCode) {
    repository.setCurrentLocale(localeCode);
    currentLocale.value = localeCode;
  }

  String getCurrentLocale() {
    return currentLocale.value = repository.currentLocale;
  }
}
