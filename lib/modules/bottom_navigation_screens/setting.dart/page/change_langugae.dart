// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/setting_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/translation/change_language.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

class ChangeLanguage extends GetWidget<SettingController> {
  const ChangeLanguage({Key? key}) : super(key: key);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // top container
                  Container(
                    height: Get.height * 0.3,
                    width: double.infinity,
                    color: CustomTheme.color232F34,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Get.height * 0.02,
                              left: Constant.pagePadding,
                              right: Constant.pagePadding,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: CustomTheme.whiteColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Get.height * 0.05,
                            left: Constant.pagePadding,
                            right: Constant.pagePadding,
                          ),
                          child: Text(
                            'changeLanguge'.tr,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: Constant.montserratSemiBold,
                                      color: CustomTheme.colorF7F7F7,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // remaining Container
                  Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.23,
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
                                color:
                                    CustomTheme.color232F34.withOpacity(0.10),
                                blurRadius: 6,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Obx(() {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.08,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.isEnglishLanguage.value = true;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: Get.height * 0.03,
                                        left: Constant.pagePadding,
                                        right: Constant.pagePadding,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: CustomTheme.greyColor
                                                  .withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 6,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        height: Get.height * 0.07,
                                        child: Row(children: [
                                          SizedBox(
                                            width: Get.height * 0.03,
                                          ),
                                          Text(
                                            'english'.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  color: CustomTheme.darkFonts
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                height: Get.height * 0.02,
                                                width: Get.height * 0.02,
                                                decoration: BoxDecoration(
                                                  color: controller
                                                          .isEnglishLanguage
                                                          .value
                                                      ? CustomTheme.blackColor
                                                          .withOpacity(0.9)
                                                      : CustomTheme.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.height * 0.02,
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.002,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.isEnglishLanguage.value =
                                          false;
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: Get.height * 0.03,
                                        left: Constant.pagePadding,
                                        right: Constant.pagePadding,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: CustomTheme.greyColor
                                                  .withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 6,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        height: Get.height * 0.07,
                                        child: Row(children: [
                                          SizedBox(
                                            width: Get.height * 0.03,
                                          ),
                                          Text(
                                            'arabic'.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  fontFamily:
                                                      Constant.montserratMedium,
                                                  color: CustomTheme.darkFonts
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                height: Get.height * 0.02,
                                                width: Get.height * 0.02,
                                                decoration: BoxDecoration(
                                                  color: controller
                                                          .isEnglishLanguage
                                                          .value
                                                      ? CustomTheme.transparent
                                                      : CustomTheme.blackColor
                                                          .withOpacity(0.8),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.height * 0.02,
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: Get.height * 0.15,
                                      left: Constant.pagePadding + 5,
                                      right: Constant.pagePadding + 5,
                                    ),
                                    child: KAppButton(
                                      buttonText: 'update'.tr,
                                      buttonColor: CustomTheme.color232F34,
                                      onTap: () {
                                        if (controller
                                            .isEnglishLanguage.value) {
                                          LanguageChangeClass.changeLanguseFunc(
                                              'en');
                                        } else {
                                          debugPrint('Arabic');
                                          LanguageChangeClass.changeLanguseFunc(
                                              'ar');
                                        }
                                      },
                                      textColor: CustomTheme.whiteColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.08,
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // center screen logo image
                  Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.195,
                    ),
                    child: Center(
                      child: Container(
                          height: Get.height * 0.08,
                          width: Get.height * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.shade200),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              Constant.changeLanguage,
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
          ),
        ),
      ),
    );
  }
}
