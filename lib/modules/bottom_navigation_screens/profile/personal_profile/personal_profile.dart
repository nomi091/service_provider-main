// ignore_for_file: file_names, depend_on_referenced_packages
import 'package:card_swiper/card_swiper.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/personal_profile/personal_profile_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/textfield_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_error_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';

// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

// ignore: must_be_immutable
class PersonalProfilePage extends GetWidget<PersonalProfileController> {
  const PersonalProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.appBarbackGround,
      body: Container(
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
                      // color: CustomTheme.color232F34,
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(
                        children: [
                          Obx(
                            () => Container(
                              height: Get.height * 0.28,
                              width: double.infinity,
                              color: CustomTheme.color232F34,
                              child: Stack(
                                children: [
                                  Swiper(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final image =
                                          controller.imageFilePathList[index];
                                      return Stack(
                                        children: [
                                          Image.network(
                                            controller.imageFilePathList.isEmpty
                                                ? ""
                                                : image,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            },
                                            errorBuilder: (context, child,
                                                loadingProgress) {
                                              return Container(
                                                  color: Colors.grey.shade300,
                                                  child:
                                                      const Icon(Icons.error));
                                            },
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 32, right: 20, left: 20),
                                            child: InkWell(
                                              onTap: () {
                                                controller.imageFilePathList
                                                    .removeAt(index);
                                                (context as Element)
                                                    .markNeedsBuild();
                                              },
                                              child: Align(
                                                alignment: SessionController()
                                                            .language ==
                                                        'en'
                                                    ? Alignment.topRight
                                                    : Alignment.topLeft,
                                                child: const Icon(
                                                  Icons.cancel,
                                                  size: 25,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount:
                                        controller.imageFilePathList.length,
                                    pagination: const SwiperPagination(),
                                    autoplay:
                                        controller.imageFilePathList.length <= 1
                                            ? false
                                            : true,
                                    // control: controller.imageFilePathList.isEmpty
                                    //     ? null
                                    //     : const SwiperControl(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 30, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: const Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      'personalInfo'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratSemiBold,
                                            color: CustomTheme.colorF7F7F7,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Align(
                                alignment: SessionController().language == 'en'
                                    ? Alignment.topRight
                                    : Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 20,
                                      top: 30,
                                      right:
                                          controller.imageFilePathList.isEmpty
                                              ? 20
                                              : 60),
                                  height: 30,
                                  width: 30,
                                  child: Center(
                                      child: InkWell(
                                          onTap: () {
                                            _getFromGalleryForCover(
                                                '', context);
                                          },
                                          child: Image.asset(Constant.editimage,
                                              width: 20, height: 20))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // remaining Container
                    Padding(
                      padding: EdgeInsets.only(
                        top: Get.height * 0.25,
                        left: Constant.pagePadding + 5,
                        right: Constant.pagePadding + 5,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          elevation: 0,
                          child: Container(
                            height: Get.height * 0.7,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: CustomTheme.colorF7F7F7,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      CustomTheme.color232F34.withOpacity(0.10),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.12,
                                    ),

                                    // User Name
                                    Text(
                                      'userName1'.tr,
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
                                     
                                      width: Get.width * 0.9,
                                      child: TextFormField(
                                        controller:
                                            controller.userNameController,
                                        cursorColor: CustomTheme.greyColor,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              if (controller.userNameController
                                                      .text.isEmpty !=
                                                  true) {}
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: Get.width * 0.02),
                                            ),
                                          ),
                                        ),
                                        onChanged: (String val) {
                                          if (val.isNotEmpty) {
                                            controller.userNameError.value = '';
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
                                          controller.userNameError.value != ''
                                              ? CustomTheme.redColor
                                              : CustomTheme.darkFonts
                                                  .withOpacity(0.5),
                                    ),
                                    controller.userNameError.value != ''
                                        ? StringErrorWidget(
                                            error:
                                                controller.userNameError.value)
                                        : SizedBox(
                                            height: Get.height * 0.03,
                                          ),

                                    // Email
                                    Text(
                                      'email1'.tr,
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
                                     
                                      width: Get.width * 0.9,
                                      child: TextFormField(
                                        enabled: false,
                                        controller: controller.emailController,
                                        cursorColor: CustomTheme.greyColor,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontFamily:
                                                  Constant.montserratMedium,
                                              color: CustomTheme.color232F34,
                                            ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              if (controller.emailController
                                                      .text.isEmpty !=
                                                  true) {}
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: Get.width * 0.02),
                                              // child: Icon(
                                              //   controller.isObSecurePassword
                                              //           .value
                                              //       ? Icons.visibility_off
                                              //       : Icons.visibility,
                                              //   color: CustomTheme.greyColor,
                                              //   size: 20,
                                              // ),
                                            ),
                                          ),
                                        ),
                                        onChanged: (String val) {
                                          if (val.isNotEmpty) {
                                            controller.emailError.value = '';
                                          }
                                        },
                                        // text style
                                      ),
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
                                            error: controller.emailError.value)
                                        : SizedBox(
                                            height: Get.height * 0.03,
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
                                                      .headline5!
                                                      .copyWith(
                                                        fontFamily: Constant
                                                            .montserratMedium,
                                                        color: CustomTheme
                                                            .color232F34,
                                                      ),
                                                  onChanged: (val) {
                                                    controller.countryCode
                                                        .value = val.toString();
                                                  },
                                                  onInit: (val) {
                                                    controller.countryCode
                                                        .value = val.toString();
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
                                                          fillColor: Colors.grey
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
                                                    hintStyle: Theme.of(context)
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
                                          color: controller
                                                      .phoneNumberError.value !=
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
                                                    controller.otherCountryCode
                                                        .value = val.toString();
                                                  },
                                                  onInit: (val) {
                                                    controller.otherCountryCode
                                                        .value = val.toString();
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
                                                          fillColor: Colors.grey
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
                                                    hintStyle: Theme.of(context)
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
                                    controller.otherPhoneNumberError.value != ''
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
                                            await FilePicker.platform.pickFiles(
                                                onFileLoading: (val) {},
                                                allowedExtensions: ['pdf'],
                                                type: FileType.custom);

                                        if (result != null) {
                                          PlatformFile file =
                                              result.files.first;
                                          await controller.updatePdf(file.path);
                                          controller.pdfFileController.text =
                                              file.name;
                                          (context as Element).markNeedsBuild();
                                        } else {
                                          debugPrint(
                                              '/ User canceled the picker');
                                          // User canceled the picker
                                        }
                                      },
                                      child: StringTextFieldWidget(
                                        isEnabale: false,
                                        controller:
                                            controller.pdfFileController,
                                        isPDF:
                                            controller.pdfFileController.text ==
                                                    ''
                                                ? false
                                                : true,
                                        suffixIconOnTap:
                                            controller.pdfFileController.text ==
                                                    ''
                                                ? () {}
                                                : () {
                                                    controller.pdfFileController
                                                        .text = '';
                                                    controller.pdfUrl = '';
                                                    (context as Element)
                                                        .markNeedsBuild();
                                                  },
                                        title: 'comercialLicence'.tr,
                                        isImportant: true,
                                        onChange: (String val) {
                                          if (val.isNotEmpty) {
                                            controller.pdfFileError.value = '';
                                          }
                                        },
                                      ),
                                    ),
                                    Divider(
                                      height: Get.height * 0.0007,
                                      color: controller.pdfFileError.value != ''
                                          ? CustomTheme.redColor
                                          : CustomTheme.darkFonts
                                              .withOpacity(0.5),
                                    ),
                                    controller.pdfFileError.value != ''
                                        ? StringErrorWidget(
                                            error:
                                                controller.pdfFileError.value)
                                        : SizedBox(
                                            height: Get.height * 0.0,
                                          ),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: Get.height * 0.04),
                                      child: KAppButton(
                                        buttonText: 'update'.tr,
                                        buttonColor: CustomTheme.color232F34,
                                        onTap: () {
                                          if (controller
                                                  .userNameController.text ==
                                              '') {
                                            controller.userNameError.value =
                                                'pleaseEnterUserName'.tr;
                                            return;
                                          }
                                          // if (controller
                                          //         .emailController.text ==
                                          //     '') {
                                          //   controller.emailError.value =
                                          //       'pleaseEnterEmail'.tr;
                                          //   return;
                                          // }
                                          // if (controller.phoneNumberController
                                          //         .text ==
                                          //     '') {
                                          //   controller
                                          //           .phoneNumberError.value =
                                          //       'Please enter password';
                                          //   return;
                                          // }
                                          // if (controller
                                          //         .pdfFileController.text ==
                                          //     '') {
                                          //   controller.pdfFileError.value =
                                          //       'Please enter password';
                                          //   return;
                                          // }
                                          if (controller.emailController.text ==
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
                                          controller.updateUserProfile(context);
                                        },
                                        textColor: CustomTheme.whiteColor,
                                      ),
                                    ),
                                    const SizedBox(
                                     height: 10,
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
                        top: Get.height * 0.2,
                      ),
                      child: InkWell(
                        onTap: () {
                          _getFromGallery('', context);
                        },
                        child: Center(
                          child: SizedBox(
                            height: Get.height * 0.1,
                            width: Get.height * 0.1,
                            child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.grey.shade300,
                                child:
                                    // controller.imageFilePath.value == ''
                                    // child:
                                    // SessionController().profileImg == ''
                                    // ?
                                    ClipRRect(
                                  borderRadius: BorderRadius.circular(55),
                                  child: Image.network(
                                    controller.imageFilePath.value,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                    errorBuilder:
                                        (context, child, loadingProgress) {
                                      return Container(
                                          color: Colors.grey.shade300,
                                          child: const Icon(Icons.person));
                                    },
                                    height: Get.height * 0.1,
                                    width: Get.height * 0.1,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: Get.height * 0.28, left: 50),
                      child: Center(
                          child: InkWell(
                              onTap: () {},
                              child: Image.asset(Constant.cameraIcon,
                                  width: 20, height: 20))),
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
    );
  }

  // img get from gallery
  Future _getFromGallery(String userId, BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    controller.imageFile = pickedFile;
    controller.imageFilePath.value = controller.imageFile!.path;
    controller.updateProfileImage(context);
    (context as Element).markNeedsBuild();
  }

  Future _getFromGalleryForCover(String userId, BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    controller.imageFile = pickedFile;
    // controller.imageFilePath.value = controller.imageFile!.path;
    controller.updateCoverImageImage(context);
    (context as Element).markNeedsBuild();
  }
}
