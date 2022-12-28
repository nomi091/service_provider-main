// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/change_password/change_password_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/error_widget/string_error_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

class ChangePasswordPage extends GetWidget<ChangePasswordController> {
  const ChangePasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.appBarbackGround,
      appBar: AppBar(
        backgroundColor: CustomTheme.color232F34,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        elevation: 0,
      ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 30, right: 20),
                          child: Text(
                            'changePassword'.tr,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: Constant.montserratSemiBold,
                                      color: CustomTheme.colorF7F7F7,
                                    ),
                          ),
                        ),
                      ),

                      // remaining Container
                      Padding(
                        padding: EdgeInsets.only(
                          top: Get.height * 0.14,
                          left: Constant.pagePadding + 5,
                          right: Constant.pagePadding + 5,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            elevation: 0,
                            child: Container(
                              height: Get.height * 0.6,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: CustomTheme.colorF7F7F7,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomTheme.color232F34
                                        .withOpacity(0.10),
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
                                        height: Get.height * 0.12,
                                      ),

                                      // Current Password
                                      Text(
                                        'currentPassword1'.tr,
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
                                        width: Get.width * 0.9,
                                        child: TextFormField(
                                          controller: controller
                                              .currentPasswordController,
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
                                                        .currentPasswordController
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
                                                    left: SessionController()
                                                                .language ==
                                                            'en'
                                                        ? Get.width * 0.12
                                                        : 0,
                                                    right: SessionController()
                                                                .language ==
                                                            'en'
                                                        ? 0
                                                        : Get.width * 0.1),
                                                child: Icon(
                                                  controller.isObSecurePassword
                                                          .value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: CustomTheme.blackColor
                                                      .withOpacity(0.6),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChanged: (String val) {
                                            if (val.isNotEmpty) {
                                              controller.currentPasswordError
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
                                        color: controller.currentPasswordError
                                                    .value !=
                                                ''
                                            ? CustomTheme.redColor
                                            : CustomTheme.darkFonts
                                                .withOpacity(0.5),
                                      ),
                                      controller.currentPasswordError.value !=
                                              ''
                                          ? StringErrorWidget(
                                              error: controller
                                                  .currentPasswordError.value)
                                          : SizedBox(
                                              height: Get.height * 0.03,
                                            ),

                                      // New Password
                                      Text(
                                        'newPassword1'.tr,
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
                                        width: Get.width * 0.9,
                                        child: TextFormField(
                                          controller:
                                              controller.newPasswordController,
                                          obscureText: controller
                                              .isObSecureNewPassword.value,
                                          cursorColor: CustomTheme.greyColor,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                if (controller
                                                        .newPasswordController
                                                        .text
                                                        .isEmpty !=
                                                    true) {
                                                  controller
                                                          .isObSecureNewPassword
                                                          .value =
                                                      !controller
                                                          .isObSecureNewPassword
                                                          .value;
                                                }
                                              },
                                              child: Padding(
                                                 padding: EdgeInsets.only(
                                                    left: SessionController()
                                                                .language ==
                                                            'en'
                                                        ? Get.width * 0.12
                                                        : 0,
                                                    right: SessionController()
                                                                .language ==
                                                            'en'
                                                        ? 0
                                                        : Get.width * 0.1),
                                                child: Icon(
                                                  controller.isObSecurePassword
                                                          .value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: CustomTheme.blackColor
                                                      .withOpacity(0.6),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChanged: (String val) {
                                            if (val.isNotEmpty) {
                                              controller
                                                  .newPasswordError.value = '';
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
                                            controller.newPasswordError.value !=
                                                    ''
                                                ? CustomTheme.redColor
                                                : CustomTheme.darkFonts
                                                    .withOpacity(0.5),
                                      ),
                                      controller.newPasswordError.value != ''
                                          ? StringErrorWidget(
                                              error: controller
                                                  .newPasswordError.value)
                                          : SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                      Text(
                                        'confirmPassword1'.tr,
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
                                        width: Get.width * 0.9,
                                        child: TextFormField(
                                          controller: controller
                                              .confirmPasswordController,
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
                                                        .confirmPasswordController
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
                                                    left: SessionController()
                                                                .language ==
                                                            'en'
                                                        ? Get.width * 0.12
                                                        : 0,
                                                    right: SessionController()
                                                                .language ==
                                                            'en'
                                                        ? 0
                                                        : Get.width * 0.1),
                                                child: Icon(
                                                  controller.isObSecurePassword
                                                          .value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: CustomTheme.blackColor
                                                      .withOpacity(0.6),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChanged: (String val) {
                                            if (val.isNotEmpty) {
                                              controller.confirmPasswordError
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
                                        color: controller.confirmPasswordError
                                                    .value !=
                                                ''
                                            ? CustomTheme.redColor
                                            : CustomTheme.darkFonts
                                                .withOpacity(0.5),
                                      ),
                                      controller.confirmPasswordError.value !=
                                              ''
                                          ? StringErrorWidget(
                                              error: controller
                                                  .confirmPasswordError.value)
                                          : SizedBox(
                                              height: Get.height * 0.03,
                                            ),

                                      controller.confirmPasswordError.value !=
                                              ''
                                          ? StringErrorWidget(
                                              error: controller
                                                  .confirmPasswordError.value)
                                          : SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                      SizedBox(
                                        height: Get.height * 0.04,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Get.height * 0.02),
                                        child: KAppButton(
                                          buttonText: 'update'.tr,
                                          buttonColor: CustomTheme.color232F34,
                                          onTap: () {
                                            if (controller
                                                    .currentPasswordController
                                                    .text ==
                                                '') {
                                              controller.currentPasswordError
                                                      .value =
                                                  'pleaseEnterPassword'.tr;
                                              return;
                                            }
                                            if (controller.newPasswordController
                                                    .text ==
                                                '') {
                                              controller
                                                      .newPasswordError.value =
                                                  'pleaseEnterPassword'.tr;
                                              return;
                                            }
                                            if (controller
                                                    .confirmPasswordController
                                                    .text ==
                                                '') {
                                              controller.confirmPasswordError
                                                      .value =
                                                  'pleaseEnterPassword'.tr;
                                              return;
                                            }
                                            if (controller
                                                    .currentPasswordController
                                                    .text
                                                    .length <
                                                8) {
                                              controller.currentPasswordError
                                                      .value =
                                                  'passwordLengthShouldAtleast8'
                                                      .tr;
                                              return;
                                            }
                                            if (controller.newPasswordController
                                                    .text.length <
                                                8) {
                                              controller
                                                      .newPasswordError.value =
                                                  'passwordLengthShouldAtleast8'
                                                      .tr;
                                              return;
                                            }
                                            if (controller
                                                    .confirmPasswordController
                                                    .text
                                                    .length <
                                                8) {
                                              controller.confirmPasswordError
                                                      .value =
                                                  'passwordLengthShouldAtleast8'
                                                      .tr;
                                              return;
                                            }
                                            dynamic data = {
                                              'currentPassword': controller
                                                  .currentPasswordController
                                                  .text,
                                              'NewPassword': controller
                                                  .newPasswordController.text,
                                            };
                                            controller.resetPassword(data);
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
                          top: Get.height * 0.10,
                        ),
                        child: Center(
                          child: Container(
                              height: Get.height * 0.08,
                              width: Get.height * 0.08,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Padding(
                                padding: EdgeInsets.all(Get.width * 0.04),
                                child: Image.asset(
                                  Constant.keyS,
                                ),
                              )),
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
