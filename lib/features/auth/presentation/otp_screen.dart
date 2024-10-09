import 'dart:ffi';

import 'package:app_base_flutter/core/base/base_view.dart';
import 'package:app_base_flutter/core/enum.dart';
import 'package:app_base_flutter/core/theme/colors.dart';
import 'package:app_base_flutter/core/values/values.dart';
import 'package:app_base_flutter/core/widget/global/button/app_button.dart';
import 'package:app_base_flutter/features/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OtpScreen extends BaseView<LoginController>{
  OtpScreen({super.key});
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
            "OTP Verification",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColor.dark202125),
            textAlign: TextAlign.center,
          ),

          AppGap.vertical10,

          /// Subtitle
          subTitle(),


          AppGap.vertical50,

          PinInputTextField(
            controller: controller.otp,
            pinLength: 6,
            decoration: BoxLooseDecoration(
              strokeColorBuilder: PinListenColorBuilder(
                AppColor.primaryOne4B9EFF,
                AppColor.disabledE4E5E7,
              ),
            ),
            onChanged: (value) {
              controller.isInputLengthSix.value=value.length==6;
            },
          ),

          AppGap.vertical50,

          /// Login button
          DefaultPrimaryButton(
            onPressed: () async => await controller.verifyOtp(context),
            disable: false,//controller.isButtonDisabled.value,
            buttonRound: ButtonRound.rounded,
            child: Text('Verify', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.whiteFFFFFF)),
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
      "Please enter otp from ${controller.emailTextEditingController.text}",
      style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(color: AppColor.inputTitleColor),
      textAlign: TextAlign.center,
    ),
  );
}