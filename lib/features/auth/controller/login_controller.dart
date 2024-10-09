import 'package:app_base_flutter/core/base/base_controller.dart';
import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/uttils/toasts.dart';
import 'package:app_base_flutter/core/values/app_string.dart';
import 'package:app_base_flutter/environment/environment.dart';
import 'package:app_base_flutter/features/auth/presentation/otp_screen.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:app_base_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final BaseRepository repository;

  LoginController({required this.repository});

  /* Text Controllers */
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController otp = TextEditingController();

  /* Validation Variables */
  RxString errorMsg = ''.obs;
  Color? errorMessageColor;
  RxBool isShowToast = false.obs;
  RxBool isButtonDisabled = false.obs;
  RxBool isEmailInvalid = false.obs;
  RxBool isButtonPressedOnce = false.obs;
  RxBool isInputLengthSix = false.obs;
  RxString fingerPrint = "".obs;

  /// Reset Method
  void reset() {
    emailTextEditingController.clear();
    otp.clear();
    errorMsg.value = '';
    isButtonDisabled.value = true;
    isEmailInvalid.value = false;
    isButtonPressedOnce.value = false;
  }

  /// Button Active Status depending on typing or empty
  inputTextTypingMonitor() {
    // Checking if fields are not empty
    if (emailTextEditingController.text.isNotEmpty) {
      isButtonDisabled.value = false;
    } else {
      isButtonDisabled.value = true;
    }

    // If button is pressed once
    // email validation function will run and repeat this process when pressed
    if (isButtonPressedOnce.value) emailValidation();
  }

  /// Email validation
  bool emailValidation() {
    if (!emailTextEditingController.text.isEmail) {
      isEmailInvalid.value = true;
    } else {
      isEmailInvalid.value = false;
    }
    return isEmailInvalid.value ? false : true;
  }

  /// After verification is complete callback
  afterVerification() {
    errorMsg.value = AppString.verificationSuccess;
    errorMessageColor = AppColor.secondaryFive00A092;
  }

  /// Login Method
  Future<void> login(BuildContext context) async {
    // set Button Pressed status true as button is pressed to login
    isButtonPressedOnce.value = true;

    // setting errorMessage empty
    errorMsg.value = '';

    emailValidation();

    // making 'errorMessageColor' null as it is changed at 'afterVerification()'
    if (errorMessageColor != null) errorMessageColor = null;
    await callDataService(repository.login(context,emailTextEditingController.text),
        onSuccess: (result){
          debugPrint(result.data.toString());
          fingerPrint.value=result.data?['login']["fingerPrint"]??"";
      if(fingerPrint.isNotEmpty ){
        Get.to(OtpScreen());
      }
      },onError: (msg){
      AppToasts.error(msg: "Email isn't valid");
      },);

  }

  Future<void> verifyOtp(BuildContext context)async{
    Map<String,dynamic> payload={
      'input': {
        'fingerPrint':fingerPrint.value ,
        'code': otp.text,
      }
    };
    await callDataService(repository.verifyOtp(context,payload),
    onSuccess: (result)async{
      String token=result.data?["verifyEmailOtp"]["accessToken"]??'';
      if(token.isNotEmpty){
        await repository.setAccessToken(token);
        Get.offAllNamed(AppRoutes.CHAT_LIST);
      }
    },onError: (msg){
      AppToasts.error(msg: "Otp isn't valid");
    },);
  }

  /// <span style="color:orange">Logout</span>
  Future<void> logOut() async {
    // Don't need to check if post request is success, proceed to other process
    //Remove all related data from database, token, email, verifications
    await repository.logout();
    // cleaning up error messages if any
    errorMsg.value = '';
    // navigating to login page
  }

  postFrameMethod() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      emailTextEditingController.text = Env.loginEmail;
    });
  }

  @override
  void onInit() {
    postFrameMethod();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
