// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/auth_splash/forgot_password/forgot_password_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';

class EmailConfirmForgotPasswordPage extends GetWidget<ForgotPasswordController> {
  const EmailConfirmForgotPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.blackColor.withOpacity(0.9),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: CustomTheme.whiteColor,
        // main Column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.4,
              width: double.infinity,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: Get.height * 0.24,
                  child: Image.asset(
                    Constant.emailConfirmation,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.1),
            Padding(
              padding: EdgeInsets.only(
                left: Constant.pagePadding,
                right: Constant.pagePadding,
              ),
              child:  TitleText(
                title: 'emailHasBeenSent'.tr,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Constant.pagePadding,
                right: Constant.pagePadding,
              ),
              child:  StringWidget(
                title:'weSentRestPasswordLink'.tr,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Get.height * 0.0009,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Constant.pagePadding,
                right: Constant.pagePadding,
              ),
              child: SizedBox(
                width: Get.width * 0.9,
                child: Text(
                  controller.emailController.text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontFamily: Constant.montserratBold,
                        color: CustomTheme.darkFonts,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.009,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Constant.pagePadding,
                right: Constant.pagePadding,
              ),
              child:  StringWidget(
                title: 'pleaseCheckYourInboxAndClickResetPassword'.tr,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Get.height * 0.09,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Constant.pagePadding,
                right: Constant.pagePadding,
              ),
              child: KAppButton(
                buttonText: 'resendEmail'.tr,
                buttonColor: CustomTheme.blackColor,
                onTap: () {
                  Get.offAllNamed(AppRoutes.loginScreen);
                },
                textColor: CustomTheme.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
