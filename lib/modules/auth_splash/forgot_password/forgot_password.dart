// ignore_for_file: file_names
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/textfield_widget.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_error_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:service_provider/utils/widget/round_profile_image.dart';
import 'forgot_password_controller.dart';

// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

class ForgotPasswordPage extends GetWidget<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                                        height: Get.height * 0.06,
                                      ),
                                       TitleText(
                                        title: 'forgotPassword1'.tr,
                                      ),

                                      SizedBox(
                                        height: Get.height * 0.009,
                                      ),
                                       StringWidget(
                                          title:
                                              'PleaseEnterEmailToReceiveOTP'.tr),
                                      SizedBox(
                                        height: Get.height * 0.06,
                                      ),

                                      ////////////
                                      // Email
                                      EmailTextFieldWidget(
                                        controller: controller.emailController,
                                        title: 'email'.tr,
                                        onChange: (String val) {
                                          if (val.isNotEmpty) {
                                            controller.emailError.value = '';
                                          }
                                        },
                                      ),
                                      Divider(
                                        height: Get.height * 0.0007,
                                        color: controller.emailError.value != ''
                                            ? CustomTheme.redColor
                                            : CustomTheme.darkFonts
                                                .withOpacity(0.5),
                                      ),
                                      controller.emailError.value != ''
                                          ? SizedBox(
                                              height: Get.height * 0.03,
                                              child: StringErrorWidget(
                                                  error: controller
                                                      .emailError.value),
                                            )
                                          : SizedBox(
                                              height: Get.height * 0.02,
                                            ),
                                      SizedBox(
                                        width: Get.width * 0.9,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.03,
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {
                                                Get.back();
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
                                        height: Get.height * 0.1,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Get.height * 0.02),
                                        child: KAppButton(
                                          buttonText: 'send'.tr,
                                          buttonColor: CustomTheme.color232F34,
                                          onTap: () {
                                            if (controller
                                                    .emailController.text ==
                                                '') {
                                              controller.emailError.value =
                                                  'pleaseEnterEmail'.tr;
                                              return;
                                            }
                                            if (!EmailValidator.validate(
                                                controller.emailController.text
                                                    .trim()
                                                    .toString())) {
                                              controller.emailError.value =
                                                  'invalidEmail'.tr;
                                              return;
                                            }
                                            SessionController()
                                                        .emailForVerifyAccount = '';
                                            controller.sendOTPOnEmail(controller.emailController.text.trim().toString());
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
