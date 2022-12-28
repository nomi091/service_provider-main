// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/setting_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

class SettingPage extends GetWidget<SettingController> {
  const SettingPage({Key? key}) : super(key: key);
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
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top container
                Container(
                  height: Get.height * 0.1,
                  width: double.infinity,
                  color: CustomTheme.colorF7F7F7,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Get.height * 0.04,
                        left: Constant.pagePadding,
                        right: Constant.pagePadding),
                    child:  TitleText1(title: 'setting1'.tr),
                  ),
                ),
                // for shaow
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CustomTheme.blackColor.withOpacity(0.15),
                        spreadRadius: 0.2,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Fast Tracks
                Padding(
                  padding: EdgeInsets.only(
                    top: Get.height * 0.03,
                    left: Constant.pagePadding,
                    right: Constant.pagePadding,
                  ),
                  child: Container(
                    height: Get.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: CustomTheme.greyColor.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(children: [
                      SizedBox(
                        width: Get.height * 0.02,
                      ),
                      SizedBox(
                        height: Get.height * 0.025,
                        width: Get.height * 0.025,
                        child: Image.asset(
                          Constant.importIcon,
                        ),
                      ),
                      SizedBox(
                        width: Get.height * 0.015,
                      ),
                      Text(
                        'fastTracks'.tr,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontFamily: Constant.montserratMedium,
                              color: CustomTheme.color232F34,
                            ),
                      ),
                      const Spacer(),
                      SizedBox(
                          height: Get.height * 0.03,
                          width: Get.height * 0.03,
                          child: Switch(
                            activeTrackColor: Colors.blue,
                            activeColor: Colors.white,
                            onChanged: (val) async {
                              controller.isSwitchedFastTrack.value = val;
                              debugPrint(controller.isSwitchedFastTrack.value
                                  .toString());
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('isSwitchedFastTrack', val);
                              SessionController().isSwitchedFastTrack.value =
                                  prefs.getBool('isSwitchedFastTrack') ?? false;
                            },
                            value: controller.isSwitchedFastTrack.value,
                          )),
                      SizedBox(
                        width: Get.height * 0.02,
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.002,
                ),
                // Change Languge
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.changeLangugae);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.03,
                      left: Constant.pagePadding,
                      right: Constant.pagePadding,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: CustomTheme.greyColor.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: Get.height * 0.07,
                      child: Row(children: [
                        SizedBox(
                          width: Get.height * 0.02,
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                          width: Get.height * 0.025,
                          child: Image.asset(
                            Constant.globalIcon,
                          ),
                        ),
                        SizedBox(
                          width: Get.height * 0.015,
                        ),
                        Text(
                          'changeLanguge'.tr,
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontFamily: Constant.montserratMedium,
                                    color: CustomTheme.color232F34,
                                  ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: Get.height * 0.02,
                          width: Get.height * 0.02,
                          child: Image.asset(
                             SessionController().language == 'en'
                              ? Constant.forwordIcon
                              : Constant.backwardIcon,
                            width: 20,
                            height: 20,
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
                // Terms and Policies
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.termandPolicy);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.03,
                      left: Constant.pagePadding,
                      right: Constant.pagePadding,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: CustomTheme.greyColor.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: Get.height * 0.07,
                      child: Row(children: [
                        SizedBox(
                          width: Get.height * 0.02,
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                          width: Get.height * 0.025,
                          child: Image.asset(
                            Constant.termConditionIcon,
                          ),
                        ),
                        SizedBox(
                          width: Get.height * 0.015,
                        ),
                        Text(
                          'termsAndPolicies'.tr,
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontFamily: Constant.montserratMedium,
                                    color: CustomTheme.color232F34,
                                  ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: Get.height * 0.02,
                          width: Get.height * 0.02,
                          child: Image.asset(  SessionController().language == 'en'
                              ? Constant.forwordIcon
                              : Constant.backwardIcon,
                              width: 20, height: 20),
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
                // Logout
                InkWell(
                  onTap: () async {
                    await SessionController.removeUserFromPreferences();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('ProfileImg', '');
                    Get.offAllNamed(AppRoutes.loginScreen);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.03,
                      left: Constant.pagePadding,
                      right: Constant.pagePadding,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: CustomTheme.greyColor.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: Get.height * 0.07,
                      child: Row(children: [
                        SizedBox(
                          width: Get.height * 0.02,
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                          width: Get.height * 0.025,
                          child: Image.asset(
                            Constant.logout,
                          ),
                        ),
                        SizedBox(
                          width: Get.height * 0.015,
                        ),
                        Text(
                          'logout'.tr,
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontFamily: Constant.montserratMedium,
                                    color: CustomTheme.color232F34,
                                  ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: Get.height * 0.02,
                          width: Get.height * 0.02,
                          child: Image.asset(  SessionController().language == 'en'
                              ? Constant.forwordIcon
                              : Constant.backwardIcon,
                              width: 20, height: 20),
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
              ],
            );
          }),
        ),
      ),
    );
  }
}
