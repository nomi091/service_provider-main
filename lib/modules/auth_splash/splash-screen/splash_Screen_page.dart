// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

import 'splash_Screen_controller.dart';

// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

class SplashPage extends GetWidget<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.whiteColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: CustomTheme.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.15,
              width: Get.height * 0.15,
              child: Image.asset(
                Constant.splashLogoIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
