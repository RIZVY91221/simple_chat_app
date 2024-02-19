import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppToasts {
  static defaultBanner(
      {String msg = '', bool isActionRequired = false, String? actionText, VoidCallback? onPressAction, List<Widget> action = const []}) {
    ScaffoldMessenger.of(Get.context!).showMaterialBanner(
      MaterialBanner(
          content: Text(msg,style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.black),),
          actions: action.isEmpty
              ? isActionRequired
                  ? [
                      TextButton(
                        onPressed: onPressAction,
                        child: Text(msg,style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.blue),),
                      ),
                    ]
                  : []
              : action),
    );
  }

  static closeBanner() {
    ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
  }
}
