import 'package:app_base_flutter/core/base/base_view.dart';
import 'package:app_base_flutter/core/enum.dart';
import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/button/app_button.dart';
import 'package:app_base_flutter/core/widget/global/input_field/app_input.dart';
import 'package:app_base_flutter/features/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends BaseView<LoginController> {
  LoginScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppPadding.p30),
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          /// Headlines
          Text(
            "app_welcome".tr,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColor.dark202125),
            textAlign: TextAlign.center,
          ),

          AppGap.vertical10,

          /// Subtitle
          subTitle(),

          /// Error text message
          Obx(() => Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p10,
                  left: AppPadding.p20,
                  right: AppPadding.p20,
                ),
                child: Text(
                  controller.errorMsg.value,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: controller.errorMessageColor ?? AppColor.errorFE6C44),
                  textAlign: TextAlign.center,
                ),
              )),

          AppGap.vertical50,

          /// Email text
          Obx(
            () => BaseTextInput(
              hintText: 'email'.tr,
              keyboardType: TextInputType.emailAddress,
              onChanged: (String? val) => controller.inputTextTypingMonitor(),
              onFocusChange: (val) => controller.inputTextTypingMonitor(),
              error: controller.isEmailInvalid.value,
              controller: controller.emailTextEditingController,
            ),
          ),


          AppGap.vertical50,

          /// Login button
          DefaultPrimaryButton(
            onPressed: () async => await controller.login(context),
            disable: false,//controller.isButtonDisabled.value,
            buttonRound: ButtonRound.rounded,
            child: Text('login'.tr, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.whiteFFFFFF)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          )
        ],
      ),
    );
  }

  Widget subTitle() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Text(
          "login_with_details".tr,
          style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(color: AppColor.inputTitleColor),
          textAlign: TextAlign.center,
        ),
      );
}
