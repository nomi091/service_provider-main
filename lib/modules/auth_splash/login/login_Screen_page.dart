// ignore_for_file: file_names
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/translation/change_language.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/textfield_widget.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_error_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:service_provider/utils/widget/round_profile_image.dart';
import 'package:sizer/sizer.dart';
import 'login_Screen_controller.dart';

// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Obx(
                            () => Column(
                              children: [
                                Align(
                                  alignment: controller.isArabiicLanguage.value
                                      ? Alignment.topLeft
                                      : Alignment.topRight,
                                  child: Text(
                                    'Language'.tr,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Align(
                                    alignment:
                                        controller.isArabiicLanguage.value
                                            ? Alignment.topLeft
                                            : Alignment.topRight,
                                    child: SizedBox(
                                      height: Get.height * 0.03,
                                      width: Get.height * 0.05,
                                      child: Switch(
                                          activeTrackColor:
                                              CustomTheme.whiteColor,
                                          activeColor:
                                              CustomTheme.cardBackGround,
                                          inactiveThumbColor:
                                              CustomTheme.greyColor,
                                          onChanged: (val) {
                                            controller.isArabiicLanguage.value =
                                                !controller
                                                    .isArabiicLanguage.value;
                                            if (controller
                                                .isArabiicLanguage.value) {
                                              LanguageChangeClass
                                                  .changeLanguseFunc('ar');
                                            } else {
                                              controller.isArabiicLanguage
                                                  .value = false;
                                              LanguageChangeClass
                                                  .changeLanguseFunc('en');
                                            }
                                            if (controller
                                                    .isEnglishLanguage.value ==
                                                false) {
                                              controller.isEnglishLanguage
                                                  .value = false;
                                            }
                                          },
                                          value: controller
                                              .isArabiicLanguage.value),
                                    )),
                              ],
                            ),
                          ),
                        ),
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
                                      // InkWell(
                                      //   onTap: () {
                                      //     showCountryPicker(
                                      //       context: context,
                                      //       //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                      //       exclude: <String>['KN', 'MF'],
                                      //       favorite: <String>['SE'],

                                      //       //Optional. Shows phone code before the country name.
                                      //       showPhoneCode: true,

                                      //       onSelect: (Country country) {
                                      //         if (kDebugMode) {
                                      //           print(
                                      //             'Select country: ${country.displayName}');
                                      //         }
                                      //       },
                                      //       countryListTheme:
                                      //           CountryListThemeData(
                                      //         borderRadius:
                                      //             const BorderRadius.only(
                                      //           topLeft: Radius.circular(40.0),
                                      //           topRight: Radius.circular(40.0),
                                      //         ),
                                      //         // Optional. Styles the search field.
                                      //         inputDecoration: InputDecoration(
                                      //           labelText:
                                      //               'Search Country Code',
                                      //           hintText: '+92',
                                      //           prefixIcon:
                                      //               const Icon(Icons.search),
                                      //           border: OutlineInputBorder(
                                      //             borderSide: BorderSide(
                                      //               color:
                                      //                   const Color(0xFF8C98A8)
                                      //                       .withOpacity(0.2),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     );
                                      // },
                                      // child:
                                      TitleText(
                                        title: 'login'.tr,
                                      ),
                                      // ),

                                      SizedBox(
                                        height: Get.height * 0.05,
                                      ),

                                      // //country picker field
                                      // IntlPhoneField(
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .headline5!
                                      //       .copyWith(
                                      //         fontFamily:
                                      //             Constant.montserratMedium,
                                      //         color: CustomTheme.color232F34,
                                      //       ),
                                      //   decoration: InputDecoration(

                                      //     // labelText: 'Phone Number',
                                      //     enabledBorder: UnderlineInputBorder(
                                      //       borderSide: BorderSide(
                                      //           color: CustomTheme.color232F34
                                      //               .withOpacity(0.2)),
                                      //     ),
                                      //     focusedBorder: UnderlineInputBorder(
                                      //       borderSide: BorderSide(
                                      //           color: CustomTheme.color232F34
                                      //               .withOpacity(0.2)),
                                      //     ),
                                      //   ),
                                      //   initialCountryCode: 'AE',

                                      //   onChanged: (phone) {
                                      //     debugPrint(phone.completeNumber);
                                      //   },
                                      // ),
                                      // const Center(
                                      //     child: Text(
                                      //   'Above country Picker is just For testing',
                                      //   style: TextStyle(
                                      //       color: Colors.red, fontSize: 13),
                                      // )),
                                      // SizedBox(
                                      //   height: Get.height * 0.05,
                                      // ),
                                      // ////////////
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
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: Get.height * 0.03),
                                              child: StringErrorWidget(
                                                  error: controller
                                                      .emailError.value),
                                            )
                                          : SizedBox(
                                              height: Get.height * 0.04,
                                            ),

                                      ////////////
                                      // Password
                                      Text(
                                        'password'.tr,
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
                                                Get.toNamed(AppRoutes
                                                    .forgotPasswordScreen);
                                              },
                                              child: Text(
                                                'forgotPassword'.tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                      fontFamily: Constant
                                                          .montserratSemiBold,
                                                      color: CustomTheme
                                                          .color232F34,
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
                                          buttonText: 'login'.tr,
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
                                            if (controller
                                                    .passwordController.text ==
                                                '') {
                                              controller.passwordError.value =
                                                  'pleaseEnterPassword'.tr;
                                              return;
                                            }
                                            // if (controller.passwordController
                                            //         .text.length <
                                            //     8) {
                                            //   controller.passwordError.value =
                                            //       'Password length should atleast 8';
                                            //   return;
                                            // }
                                            controller.loginwithEmail(
                                                controller.emailController.text
                                                    .trim()
                                                    .toString(),
                                                controller
                                                    .passwordController.text
                                                    .trim()
                                                    .toString(),
                                                context);
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
                            child: InkWell(
                              onTap: () {
                                // controller.isEnglishLanguage.value =
                                //     !controller.isEnglishLanguage.value;
                                // if (controller.isEnglishLanguage.value) {
                                //   LanguageChangeClass.changeLanguseFunc('en');
                                // } else {
                                //   debugPrint('Arabic');
                                //   LanguageChangeClass.changeLanguseFunc('ar');
                                // }
                              },
                              child: RoundProfileImageFromAsset(
                                image: Constant.screenLogo,
                                roundRadius: 30,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.002,
                  ),
                  // Already have an account?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.025,
                              left: Get.height * 0.07,
                              right: Get.height * 0.07,
                            ),
                            child: Text(
                              'doNotHaveAccount'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontFamily: Constant.montserratRegular,
                                    color: CustomTheme.color232F34,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      // Login
                      InkWell(
                        onTap: () async {
                          // Get.toNamed(AppRoutes.createShop);
                          controller.emailController.clear();
                          controller.passwordController.clear();
                          Get.toNamed(AppRoutes.signUpScreen);
                        },
                        child: SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.025,
                            ),
                            child: Text(
                              'signup'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontFamily: Constant.montserratSemiBold,
                                      color: CustomTheme.color232F34,
                                      decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ),
                    ],
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
