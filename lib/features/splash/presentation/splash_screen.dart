import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/features/splash/controller/splash_controller.dart';
import 'package:app_base_flutter/generated/assets.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: SplashController(repository: getIt<BaseRepository>()),
        builder: (controller) => Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(color: Colors.blue.withOpacity(0.15)),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    Assets.iconsIcon,
                    width: Get.width / 2,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 3, top: 60),
                      child: const Text(
                        "Powered By",
                        style: TextStyle(color: Colors.blue, fontSize: 26, fontWeight: FontWeight.w700, fontFamily: "Artegra"),
                      ),
                    ),
                    const Text(
                      "XYZ",
                      style: TextStyle(color: Colors.blue, fontSize: 16, fontFamily: "Artegra"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
