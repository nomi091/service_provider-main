// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:service_provider/utils/widget/round_profile_image.dart';
import 'forgot_password_controller.dart';

class VerifyForgotPinPage extends GetWidget<ForgotPasswordController> {
  const VerifyForgotPinPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.pinCode.value = '';
    controller.errorOTP.value = '';
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
                                        title: 'verifyPin'.tr,
                                      ),

                                      SizedBox(
                                        height: Get.height * 0.009,
                                      ),
                                       StringWidget(
                                          title:
                                              'aVerificationCodeSentYourEmail'.tr),
                                      SizedBox(
                                        height: Get.height * 0.06,
                                      ),

                                      ////////////
                                      // Email
                                      Center(
                                        child: SizedBox(
                                            // height: Get.height * 0.05,
                                            width: Get.width * 0.9,
                                            child: PinCodeTextField(
                                              // controller: controller.pincodeController,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9]')),
                                              ],
                                              appContext: context,

                                              length: 4,
                                              pinTheme: PinTheme(
                                                  fieldHeight:
                                                      Get.height * 0.05,
                                                  fieldWidth: Get.width * 0.13,
                                                  shape: PinCodeFieldShape
                                                      .underline,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  activeColor:
                                                      CustomTheme.darkFonts,
                                                  selectedColor:
                                                      CustomTheme.darkFonts,
                                                  inactiveColor:
                                                      CustomTheme.greyColor,
                                                  errorBorderColor:
                                                      CustomTheme.redColor),
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      fontFamily: Constant
                                                          .montserratSemiBold,
                                                      color: CustomTheme
                                                          .color232F34),
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {
                                                controller.pinCode.value =
                                                    value;
                                                controller.errorOTP.value = '';
                                              },
                                              onCompleted: (value) async {
                                                controller.pinCode.value =
                                                    value;
                                                if (SessionController()
                                                        .emailForVerifyAccount !=
                                                    '') {
                                                  controller
                                                      .verifyPincodeForAccountVerify(
                                                          context);
                                                } else {
                                                  controller.verifyPincode();
                                                }
                                              }
                                              // call api for verify code
                                              ,
                                            )),
                                      ),
                                      controller.errorOTP.value != ''
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                bottom: Get.height * 0.1,
                                              ),
                                              child: SizedBox(
                                                width: Get.width * 0.9,
                                                child: Text(
                                                  controller.errorOTP.value,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        fontFamily: Constant
                                                            .montserratRegular,
                                                        color: CustomTheme
                                                            .redColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(
                                              height: Get.height * 0.1,
                                            ),

                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Get.height * 0.02),
                                        child: KAppButton(
                                          buttonText: 'send'.tr,
                                          buttonColor: CustomTheme.color232F34,
                                          onTap: () {
                                            if (controller.pinCode.value
                                                        .toString() ==
                                                    '' ||
                                                controller
                                                        .pinCode.value.length <
                                                    4) {
                                              controller.errorOTP.value =
                                                  'pleaseEnterPinCode'.tr;

                                              return;
                                            }

                                            if (SessionController()
                                                    .emailForVerifyAccount !=
                                                '') {
                                              controller
                                                  .verifyPincodeForAccountVerify(
                                                      context);
                                            } else {
                                              controller.verifyPincode();
                                            }
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
