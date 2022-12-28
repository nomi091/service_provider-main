// ignore_for_file: file_names
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/auth_splash/sign_up/sign_up_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/textfield_widget.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_error_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:service_provider/utils/widget/round_profile_image.dart';

class SignUpPage extends GetWidget<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Locale myLocale = Localizations.localeOf(context);
    // print(myLocale.languageCode.toString() +
    //     ' ' +
    //     myLocale.countryCode.toString());
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
                              height: Get.height * 0.72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: CustomTheme.colorF7F7F7,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
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
                                        title: 'signup1'.tr,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      // userName
                                      StringTextFieldWidget(
                                        controller:
                                            controller.usernameController,
                                        title: 'userName'.tr,
                                        isImportant: true,
                                        onChange: (String val) {
                                          if (val.isNotEmpty) {
                                            controller.userNameError.value = '';
                                          }
                                        },
                                      ),
                                      Divider(
                                        height: Get.height * 0.0007,
                                        color:
                                            controller.userNameError.value != ''
                                                ? CustomTheme.redColor
                                                : CustomTheme.darkFonts
                                                    .withOpacity(0.5),
                                      ),
                                      controller.userNameError.value != ''
                                          ? StringErrorWidget(
                                              error: controller
                                                  .userNameError.value)
                                          : SizedBox(
                                              height: Get.height * 0.025,
                                            ),
                                      ////////////
                                      // Shop Name
                                      StringTextFieldWidget(
                                        controller:
                                            controller.shopNameController,
                                        title: 'shopName'.tr,
                                        onChange: (String val) {
                                          if (val.isNotEmpty) {
                                            controller.shopNameError.value = '';
                                          }
                                        },
                                      ),
                                      Divider(
                                        height: Get.height * 0.0007,
                                        color:
                                            controller.shopNameError.value != ''
                                                ? CustomTheme.redColor
                                                : CustomTheme.darkFonts
                                                    .withOpacity(0.5),
                                      ),
                                      controller.shopNameError.value != ''
                                          ? StringErrorWidget(
                                              error: controller
                                                  .shopNameError.value)
                                          : SizedBox(
                                              height: Get.height * 0.025,
                                            ),
                                      ////////////
                                      // Email
                                      EmailTextFieldWidget(
                                        controller: controller.emailController,
                                        title: 'email'.tr,
                                        isImportant: true,
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
                                          ? StringErrorWidget(
                                              error:
                                                  controller.emailError.value)
                                          : SizedBox(
                                              height: Get.height * 0.025,
                                            ),

                                      ////////////
                                      // Password
                                      Text(
                                        'password1'.tr,
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
                                          ? StringErrorWidget(
                                              error: controller
                                                  .passwordError.value)
                                          : SizedBox(
                                              height: Get.height * 0.025,
                                            ),
                                      ////////////
                                      // confirm password
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
                                                              : Get.width *
                                                                  0.1),
                                                child: Icon(
                                                  controller
                                                          .isObSecureConfirmPassword
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
                                              height: Get.height * 0.025,
                                            ),
                                      ////////////
                                      // Number
                                      // phone number
                                      Text(
                                        'phoneNumber1'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              fontFamily:
                                                  Constant.montserratRegular,
                                              color: CustomTheme.color232F34,
                                            ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    minWidth: Get.width * 0.21,
                                                    maxWidth: Get.width * 0.26,
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                  margin: EdgeInsets.zero,
                                                  child: CountryCodePicker(
                                                    flagWidth: Get.width * 0.06,
                                                    padding: EdgeInsets.zero,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                          fontFamily: Constant
                                                              .montserratRegular,
                                                          color: CustomTheme
                                                              .darkFonts,
                                                        ),
                                                    onChanged: (val) {
                                                      controller.countryCode
                                                              .value =
                                                          val.toString();
                                                    },
                                                    
                                                    onInit: (val) {
                                                      controller.countryCode
                                                              .value =
                                                          val.toString();
                                                    }, //print,
                                                    // initialSelection: myLocale
                                                    //     .countryCode
                                                    //     .toString(),
                                                    initialSelection:
                                                        'دولة الإمارات العربية المتحدة',
                                                    favorite: const [
                                                      'دولة الإمارات العربية المتحدة',
                                                      'Pakistan'
                                                    ],
                                                    
                                                    flagDecoration:
                                                        const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle),
                                                    alignLeft: true,
                                                    searchDecoration:
                                                        const InputDecoration(
                                                            focusColor:
                                                                Colors.grey,
                                                            fillColor:
                                                                Colors.grey
                                                            // border: InputBorder.none,
                                                            ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp(r'[0-9]')),
                                                    ],
                                                    controller: controller
                                                        .phoneNumberController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        CustomTheme.greyColor,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5!
                                                        .copyWith(
                                                          fontFamily: Constant
                                                              .montserratMedium,
                                                          color: CustomTheme
                                                              .color232F34,
                                                        ),
                                                    decoration: InputDecoration(
                                                      prefixIcon:
                                                          UnconstrainedBox(
                                                        child: Icon(
                                                          Icons
                                                              .arrow_drop_down_sharp,
                                                          color: CustomTheme
                                                              .blackColor
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                      prefixIconConstraints:
                                                          const BoxConstraints(
                                                              maxWidth: 40),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 0,
                                                                  color: Colors
                                                                      .transparent)),
                                                      border: const UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 3,
                                                              color: Colors
                                                                  .transparent)),
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent)),
                                                      hintText: '000 000 0000',
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline4!
                                                              .copyWith(
                                                                fontFamily: Constant
                                                                    .montserratMedium,
                                                                color: CustomTheme
                                                                    .greyColor,
                                                              ),
                                                    ),
                                                    onChanged: (value) {
                                                      if (value.isEmpty ==
                                                          false) {
                                                        controller
                                                            .phoneNumberError
                                                            .value = '';
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: Get.height * 0.0007,
                                            color: controller.phoneNumberError
                                                        .value !=
                                                    ''
                                                ? CustomTheme.redColor
                                                : CustomTheme.darkFonts
                                                    .withOpacity(0.5),
                                          ),
                                        ],
                                      ),
                                      controller.phoneNumberError.value != ''
                                          ? StringErrorWidget(
                                              error: controller
                                                  .phoneNumberError.value)
                                          : SizedBox(
                                              height: Get.height * 0.025,
                                            ),

                                      // other phone number
                                      Text(
                                        'otherNumber'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              fontFamily:
                                                  Constant.montserratRegular,
                                              color: CustomTheme.color232F34,
                                            ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    minWidth: Get.width * 0.21,
                                                    maxWidth: Get.width * 0.26,
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                  margin: EdgeInsets.zero,
                                                  child: CountryCodePicker(
                                                    flagWidth: Get.width * 0.06,
                                                    padding: EdgeInsets.zero,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .headline5!
                                                        .copyWith(
                                                          fontFamily: Constant
                                                              .montserratMedium,
                                                          color: CustomTheme
                                                              .color232F34,
                                                        ),
                                                    onChanged: (val) {
                                                      controller
                                                              .otherCountryCode
                                                              .value =
                                                          val.toString();
                                                    },
                                                    onInit: (val) {
                                                      controller
                                                              .otherCountryCode
                                                              .value =
                                                          val.toString();
                                                    }, //print,
                                                    initialSelection:
                                                        'دولة الإمارات العربية المتحدة',
                                                    favorite: const [
                                                      'دولة الإمارات العربية المتحدة',
                                                      '+92',
                                                    ],
                                                    flagDecoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    alignLeft: true,
                                                    searchDecoration:
                                                        const InputDecoration(
                                                            focusColor:
                                                                Colors.grey,
                                                            fillColor:
                                                                Colors.grey
                                                            // border: InputBorder.none,
                                                            ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp(r'[0-9]')),
                                                    ],
                                                    controller: controller
                                                        .otherPhoneNumberController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        CustomTheme.greyColor,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                          fontFamily: Constant
                                                              .montserratMedium,
                                                          color: CustomTheme
                                                              .darkFonts,
                                                        ),
                                                    decoration: InputDecoration(
                                                      prefixIcon:
                                                          UnconstrainedBox(
                                                        child: Icon(
                                                          Icons
                                                              .arrow_drop_down_sharp,
                                                          color: CustomTheme
                                                              .blackColor
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                      prefixIconConstraints:
                                                          const BoxConstraints(
                                                              maxWidth: 40),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  width: 0,
                                                                  color: Colors
                                                                      .transparent)),
                                                      border: const UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 3,
                                                              color: Colors
                                                                  .transparent)),
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent)),
                                                      hintText: '000 000 0000',
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline4!
                                                              .copyWith(
                                                                fontFamily: Constant
                                                                    .montserratRegular,
                                                                color: CustomTheme
                                                                    .greyColor,
                                                              ),
                                                    ),
                                                    onChanged: (value) {
                                                      if (value.isEmpty ==
                                                          false) {
                                                        controller
                                                            .otherPhoneNumberError
                                                            .value = '';
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: Get.height * 0.0007,
                                            color: controller
                                                        .otherPhoneNumberError
                                                        .value !=
                                                    ''
                                                ? CustomTheme.redColor
                                                : CustomTheme.darkFonts
                                                    .withOpacity(0.5),
                                          ),
                                        ],
                                      ),
                                      controller.otherPhoneNumberError.value !=
                                              ''
                                          ? StringErrorWidget(
                                              error: controller
                                                  .otherPhoneNumberError.value)
                                          : SizedBox(
                                              height: Get.height * 0.025,
                                            ),

                                      ///////////////
                                      // Licence
                                      InkWell(
                                        onTap: () async {
                                          debugPrint('hello');
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles(
                                                      onFileLoading: (val) {},
                                                      allowedExtensions: [
                                                        'pdf'
                                                      ],
                                                      type: FileType.custom);

                                          if (result != null) {
                                            PlatformFile file =
                                                result.files.first;
                                            await controller
                                                .updatePdf(file.path);
                                            controller.licnenceController.text =
                                                file.name;
                                            (context as Element)
                                                .markNeedsBuild();
                                          } else {
                                            debugPrint(
                                                '/ User canceled the picker');
                                            // User canceled the picker
                                          }
                                        },
                                        child: StringTextFieldWidget(
                                          isEnabale: false,
                                          controller:
                                              controller.licnenceController,
                                          isPDF: controller.licnenceController
                                                      .text ==
                                                  ''
                                              ? false
                                              : true,
                                          suffixIconOnTap: controller
                                                      .licnenceController
                                                      .text ==
                                                  ''
                                              ? () {}
                                              : () {
                                                  controller.licnenceController
                                                      .text = '';
                                                  controller.pdfUrl = '';
                                                  (context as Element)
                                                      .markNeedsBuild();
                                                },
                                          title: 'comercialLicence'.tr,
                                          isImportant: true,
                                          onChange: (String val) {
                                            if (val.isNotEmpty) {
                                              controller.licenceError.value =
                                                  '';
                                            }
                                          },
                                        ),
                                      ),
                                      Divider(
                                        height: Get.height * 0.0007,
                                        color:
                                            controller.licenceError.value != ''
                                                ? CustomTheme.redColor
                                                : CustomTheme.darkFonts
                                                    .withOpacity(0.5),
                                      ),
                                      controller.licenceError.value != ''
                                          ? StringErrorWidget(
                                              error:
                                                  controller.licenceError.value)
                                          : SizedBox(
                                              height: Get.height * 0.0,
                                            ),
                                      SizedBox(
                                        width: Get.width * 0.9,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.05,
                                              child: Checkbox(
                                                  value: controller
                                                      .isChecked.value,
                                                  onChanged: (val) {
                                                    controller.isChecked.value =
                                                        val!;
                                                  }),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.02,
                                            ),
                                            Text(
                                              'iAgreeTo'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                    fontFamily: Constant
                                                        .montserratRegular,
                                                    color:
                                                        CustomTheme.color232F34,
                                                  ),
                                            ),
                                            Text(
                                              'termAndPolices'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                    fontFamily: Constant
                                                        .montserratSemiBold,
                                                    color:
                                                        CustomTheme.color232F34,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Get.height * 0.01),
                                        child: KAppButton(
                                          buttonText: 'signup1'.tr,
                                          buttonColor: CustomTheme.blackColor,
                                          onTap: () async {
                                            if (controller
                                                    .usernameController.text ==
                                                '') {
                                              controller.userNameError.value =
                                                  'pleaseEnterUserName'.tr;
                                              return;
                                            }
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
                                            if (controller.passwordController
                                                    .text.length <
                                                8) {
                                              controller.passwordError.value =
                                                  'passwordLengthShouldAtleast8'
                                                      .tr;
                                              return;
                                            }
                                            if (controller
                                                    .confirmPasswordController
                                                    .text ==
                                                '') {
                                              controller.confirmPasswordError
                                                      .value =
                                                  'pleaseEnterConfirmPassword'
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
                                            if (controller
                                                    .confirmPasswordController
                                                    .text !=
                                                controller
                                                    .passwordController.text) {
                                              controller.confirmPasswordError
                                                      .value =
                                                  'passwordDoesNotMatch'.tr;
                                              return;
                                            }

                                            if (controller.phoneNumberController
                                                    .text ==
                                                '') {
                                              controller
                                                      .phoneNumberError.value =
                                                  'pleaseEnterNumber'.tr;
                                              return;
                                            }
                                            // if (controller
                                            //         .otherPhoneNumberController
                                            //         .text ==
                                            //     '') {
                                            //   controller.otherPhoneNumberError
                                            //           .value =
                                            //       'pleaseEnterNumber'.tr;
                                            //   return;
                                            // }
                                            if (controller
                                                    .licnenceController.text ==
                                                '') {
                                              controller.licenceError.value =
                                                  'pleaseEnterLicence'.tr;
                                              return;
                                            }
                                            if (!controller.isChecked.value) {
                                              Constant.showSnackBar(
                                                  'error'.tr,
                                                  'pleaseReadTermAndPolicies'
                                                      .tr);
                                              return;
                                            }
                                            controller.signUpFunc();
                                          },
                                          textColor: CustomTheme.whiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.02,
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
                  // Already have an account?
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: Get.height * 0.01,
                                left: Constant.pagePadding + 30,
                                right: Constant.pagePadding + 30),
                            child: Text(
                              'alreadyHaveAnAccount?'.tr,
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
                        onTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.01,
                            ),
                            child: Text(
                              'login1'.tr,
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
