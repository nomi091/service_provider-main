// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/setting_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds

class TermAndPoliciesPage extends GetWidget<SettingController> {
  const TermAndPoliciesPage({Key? key}) : super(key: key);
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
                            'termsAndPolicies'.tr,
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
                                    height: Get.height * 0.06,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.9,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 2, bottom: Get.height * 0.01),
                                      child: Text(
                                        'The obligations and duties prepared below that govern the use of the site policy are prepared in the light of the laws and guidelines for the safety of the use of the sites and therefore please read it carefully and comply with this privacy policy, because it is important and the duty to know that you may use this site only in accordance with the terms of use, and for legal and appropriate purposes only your access to the site, it is an acknowledgment of your agreement to what is described in the terms and conditions and the privacy policy, and in the case that you do not agree to the terms and conditions and the privacy policy, you must stop using this website immediately.',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontFamily:
                                                  Constant.montserratMedium,
                                              height: Get.height * 0.002,
                                              color: CustomTheme.color232F34,
                                            ),
                                      ),
                                    ),
                                  )
                                  // const StringWidget(
                                  //   title:
                                  //      ''
                                  // )
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
                              Constant.termConditionIcon,
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
