// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/profile_controller.dart';
import 'package:service_provider/modules/shop_detail.dart/shop_detail.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';

class ProfilePage extends GetWidget<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);
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
                  child: TitleText1(title: 'profile'.tr),
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
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Profile info
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.personalProfile);
                },
                child: Padding(
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
                          Constant.personalInfo,
                        ),
                      ),
                      SizedBox(
                        width: Get.height * 0.015,
                      ),
                      Text(
                        'personalInfo'.tr,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
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
              // Shop Detail
              InkWell(
                onTap: () {
                  Get.to(() => const ShopDetailPage());
                },
                child: Padding(
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
                          Constant.shopDetail,
                        ),
                      ),
                      SizedBox(
                        width: Get.height * 0.015,
                      ),
                      Text(
                        'shopDetails'.tr,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
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
              // Change Password
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.changePassword);
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
                          Constant.keyS,
                        ),
                      ),
                      SizedBox(
                        width: Get.height * 0.015,
                      ),
                      Text(
                        'changePassword'.tr,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
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
              // Delete Account
              InkWell(
                onTap: () {
                  _showDialog(context, controller);
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
                          Constant.deleteProfile,
                        ),
                      ),
                      SizedBox(
                        width: Get.height * 0.015,
                      ),
                      Text(
                        'deleteMyAccount'.tr,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
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
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context, ProfileController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context1) {
        return AlertDialog(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'wantToDelete1'.tr,
                maxLines: null,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontFamily: Constant.montserratSemiBold,
                      color: CustomTheme.color232F34,
                    ),
              ),
            ),
          )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                  text: TextSpan(
                      text: 'areYouSureWantDeleteAccount'.tr,
                      style: TextStyle(
                          color: CustomTheme.color232F34, fontSize: 17),
                      children: [
                        TextSpan(
                          text: 'notBeAbleRecover'.tr,
                          style: TextStyle(
                              color: CustomTheme.colorC7001E,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 3.3,
                        child: DialogButton(
                            buttonText: 'delete'.tr,
                            textColor: CustomTheme.whiteColor,
                            buttonColor: CustomTheme.colorC7001E,
                            borderColor: CustomTheme.colorC7001E,
                            onTap: () {
                              controller.personalProfileController
                                  .deleteUser(context);
                            })),
                    const Spacer(),
                    SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 3.3,
                        child: DialogButton(
                            buttonText: 'cancel'.tr,
                            textColor: CustomTheme.colorC7001E,
                            buttonColor: CustomTheme.whiteColor,
                            borderColor: CustomTheme.colorC7001E,
                            onTap: () async {
                              Navigator.pop(context, true);
                            }))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
