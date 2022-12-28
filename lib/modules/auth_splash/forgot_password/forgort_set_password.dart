// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/auth_splash/forgot_password/forgot_password_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_error_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:service_provider/utils/widget/round_profile_image.dart';

// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

class ForgotSetPasswordPage extends GetWidget<ForgotPasswordController> {
  const ForgotSetPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.isObSecurePassword.value = true;
    controller.isObSecureConfirmPassword.value = true;
    controller.passwordController.text = '';
    controller.passwordConfirmController.text = '';
    return Scaffold(
      backgroundColor: CustomTheme.blackColor.withOpacity(0.9),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: CustomTheme.whiteColor,
          // main Column
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // top container
                      Container(
                        height: Get.height * 0.28,
                        width: double.infinity,
                        color: CustomTheme.color232F34,
                        child: const Text(''),
                      ),
                      // remaining Container
                      Padding(
                        padding: EdgeInsets.only(
                          top: Get.height * 0.19,
                          left: Constant.pagePadding + 5,
                          right: Constant.pagePadding + 5,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            elevation: 0,
                            child: Container(
                              height: Get.height * 0.65,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: CustomTheme.colorF7F7F7,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomTheme.color232F34
                                        .withOpacity(0.10),
                                    // spreadRadius: 5,
                                    blurRadius: 6,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: Constant.pagePadding,
                                    right: Constant.pagePadding,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.06,
                                      ),
                                       TitleText(
                                        title: 'enterNewPassword'.tr,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.1,
                                      ),

                                      ////////////
                                      // new Password
                                      Text(
                                        'newPassword'.tr,
                                         style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              fontFamily:
                                                  Constant.montserratRegular,
                                              color: CustomTheme.color232F34,
                                            ),
                                      ),
                                      SizedBox(
                                        // height: Get.height * 0.035,
                                        child: TextFormField(
                                          controller:
                                              controller.passwordController,
                                          obscureText: controller
                                              .isObSecurePassword.value,
                                          cursorColor: CustomTheme.greyColor,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                if (controller
                                                        .passwordController
                                                        .text
                                                        .isEmpty !=
                                                    true) {
                                                  controller.isObSecurePassword
                                                          .value =
                                                      !controller
                                                          .isObSecurePassword
                                                          .value;
                                                }
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: Get.width * 0.12),
                                                child: Icon(
                                                  controller.isObSecurePassword
                                                          .value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: CustomTheme.blackColor.withOpacity(0.6),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChanged: (String val) {
                                            if (val.isNotEmpty) {
                                              controller.passwordError.value =
                                                  '';
                                            }
                                          },
                                          // text style
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                color: CustomTheme.color232F34,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        height: Get.height * 0.0007,
                                        color:
                                            controller.passwordError.value != ''
                                                ? CustomTheme.redColor
                                                : CustomTheme.darkFonts
                                                    .withOpacity(0.5),
                                      ),
                                      controller.passwordError.value != ''
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: Get.height * 0.03),
                                              child: StringErrorWidget(
                                                  error: controller
                                                      .passwordError.value),
                                            )
                                          : SizedBox(
                                              height: Get.height * 0.05,
                                            ),

                                      // confirm Password
                                      Text(
                                        'confirmPassword'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              fontFamily:
                                                  Constant.montserratRegular,
                                              color: CustomTheme.color232F34,
                                            ),
                                      ),
                                      SizedBox(
                                        // height: Get.height * 0.035,
                                        child: TextFormField(
                                          controller: controller
                                              .passwordConfirmController,
                                          obscureText: controller
                                              .isObSecureConfirmPassword.value,
                                          cursorColor: CustomTheme.greyColor,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                if (controller
                                                        .passwordConfirmController
                                                        .text
                                                        .isEmpty !=
                                                    true) {
                                                  controller
                                                          .isObSecureConfirmPassword
                                                          .value =
                                                      !controller
                                                          .isObSecureConfirmPassword
                                                          .value;
                                                }
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: Get.width * 0.12),
                                                child: Icon(
                                                  controller
                                                          .isObSecureConfirmPassword
                                                          .value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: CustomTheme.blackColor.withOpacity(0.6),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChanged: (String val) {
                                            if (val.isNotEmpty) {
                                              controller.passwordConfirmError
                                                  .value = '';
                                            }
                                          },
                                          // text style
                                        style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                color: CustomTheme.color232F34,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        height: Get.height * 0.0007,
                                        color: controller.passwordConfirmError
                                                    .value !=
                                                ''
                                            ? CustomTheme.redColor
                                            : CustomTheme.darkFonts
                                                .withOpacity(0.5),
                                      ),
                                      controller.passwordConfirmError.value !=
                                              ''
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: Get.height * 0.03),
                                              child: StringErrorWidget(
                                                  error: controller
                                                      .passwordConfirmError
                                                      .value),
                                            )
                                          : SizedBox(
                                              height: Get.height * 0.03,
                                            ),

                                      SizedBox(
                                        width: Get.width * 0.9,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.02,
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                Get.offAllNamed(
                                                    AppRoutes.loginScreen);
                                              },
                                              child: Text(
                                                'login1'.tr,
                                                 style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                      fontFamily: Constant
                                                          .montserratSemiBold,
                                                      color:
                                                          CustomTheme.color232F34,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: Get.height * 0.04,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Get.height * 0.02),
                                        child: KAppButton(
                                          buttonText: 'resetPassword'.tr,
                                          buttonColor: CustomTheme.color232F34,
                                          onTap: () {
                                            // new password
                                            if (controller
                                                    .passwordController.text ==
                                                '') {
                                              controller.passwordError.value =
                                                  'pleaseEnterNewPassword'.tr;
                                              return;
                                            }
                                            if (controller.passwordController
                                                    .text.length <
                                                8) {
                                              controller.passwordError.value =
                                                  'passwordLengthShouldAtleast8'.tr;
                                              return;
                                            }
                                            // confirm password
                                            if (controller
                                                    .passwordConfirmController
                                                    .text ==
                                                '') {
                                              controller.passwordConfirmError
                                                      .value =
                                                  'pleaseEnterConfirmPassword'.tr;
                                              return;
                                            }
                                            if (controller
                                                    .passwordConfirmController
                                                    .text
                                                    .length <
                                                8) {
                                              controller.passwordConfirmError
                                                      .value =
                                                  'passwordLengthShouldAtleast8'.tr;
                                              return;
                                            }
                                            if (controller
                                                    .passwordConfirmController
                                                    .text !=
                                                controller
                                                    .passwordController.text) {
                                              controller.passwordConfirmError
                                                      .value =
                                                  'passwordDoesNotMatch'.tr;
                                              return;
                                            }
                                            controller.resetPassword();
                                          },
                                          textColor: CustomTheme.whiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.035,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // center screen logo image
                      Padding(
                        padding: EdgeInsets.only(
                          top: Get.height * 0.15,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: Get.height * 0.08,
                            width: Get.height * 0.08,
                            child: RoundProfileImageFromAsset(
                              image: Constant.screenLogo,
                              roundRadius: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.002,
                  ),
               ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
