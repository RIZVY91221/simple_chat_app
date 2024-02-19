import 'package:app_base_flutter/core/enum.dart';
import 'package:app_base_flutter/environment/build_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  //AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final Logger logger = BuildConfig.instance.envVariables.logger;

  BaseView({super.key});

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(() => controller.pageState == PageState.LOADING ? _showLoading() : Container()),
          Obx(() => controller.errorMessage.isNotEmpty ? showErrorSnackBar(controller.errorMessage) : Container()),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) async => willPopHandler,
      child: Scaffold(
          appBar: appBar(context),
          drawer: drawer(context),
          backgroundColor: pageBackgroundColor(),
          bottomNavigationBar: bottomNavigationBar(),
          body: SafeArea(
            child: Center(
              widthFactor: widthFactorCenter(),
              heightFactor: heightFactorCenter(),
              child: SizedBox(
                width: width(),
                height: height(),
                child: Padding(
                  padding: rootPadding(),
                  child: pageContent(context),
                ),
              ),
            ),
          )),
    );
    /*Scaffold(
      //sets ios status bar color
      //resizeToAvoidBottomInset: false,
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );*/
  }

  Widget pageContent(BuildContext context) {
    return body(context);
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }

  void showToast(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }

  Color pageBackgroundColor() {
    //Todo
    return Colors.white;
  }

  Color statusBarColor() {
    //Todo
    return Colors.white;
  }

  Widget? floatingActionButton() {
    //todo
    return null;
  }

  Widget? bottomNavigationBar() {
    //todo
    return null;
  }

  Widget? drawer(BuildContext context) {
    return null; //appDrawer(context);
  }

  Widget _showLoading() {
    //todo
    return Container();
  }

  double? widthFactorCenter() {
    return null;
  }

  double? heightFactorCenter() {
    return null;
  }

  double? height() {
    return null;
  }

  double? width() {
    return null;
  }

  EdgeInsets rootPadding() {
    return EdgeInsets.zero;
  }

  Future<bool> willPopHandler() async {
    if (onWillPop() != null) {
      // When onWillPop method is invoking
      logger.i('◁◁ |wpm:1| ↩︎ onWillPop(){...}');
      onWillPop()!.call();
    } else if (onWillPopData() != null) {
      // When Has Payload
      logger.i('◁◁ |wpm:2| ↩︎ onWillPopData()');
      Get.back(result: onWillPopData());
    } else if (onWillPopScope() != null) {
      // If not null will return the true (pop)/false (not pop)
      logger.i('◁◁ |wpm:3| ↩︎ onWillPopScope()');
      return onWillPopScope()!;
    } else if (Get.currentRoute.isNotEmpty) {
      logger.i('◁◁ |wpm:4| ↩︎ SystemNavigator.pop()');
      return false;
    } else {
      // Default Pop State
      logger.i('◁◁ |wpm:5| ↩︎ AppNavigate.pop()');
      Get.back();
    }
    // Default Return
    return false;
  }

  Function()? onWillPop() => null;
  Object? onWillPopData() => null;
  bool? onWillPopScope() => null;
}
