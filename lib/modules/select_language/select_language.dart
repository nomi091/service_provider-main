import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/auth_splash/splash-screen/splash_Screen_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/translation/change_language.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:sizer/sizer.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

int index = -1;
SplashController controller = Get.find();

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.whiteColor,
        body: Padding(
          padding: EdgeInsets.only(
              left: Get.width * 0.06,
              right: Get.width * 0.06,
              top: Get.height * 0.1),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select language',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontFamily: Constant.montserratMedium,
                        fontSize: 15.sp,
                        color: CustomTheme.color232F34,
                      ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                /////////English////////////////////////
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: Get.height * 0.07,
                    decoration: BoxDecoration(
                        color:
                            index == 0 ? CustomTheme.color232F34 : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 7,
                              spreadRadius: 5,
                              offset: Offset.fromDirection(0, 3))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.04, right: Get.width * 0.04),
                      child: Row(
                        children: [
                          Text(
                            'English',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: index == 0
                                          ? Colors.white
                                          : CustomTheme.color232F34,
                                    ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: index == 0
                                ? Colors.white
                                : CustomTheme.color232F34,
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ////////////////////////////////////Arabic//////////////////////////
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: Get.height * 0.07,
                    decoration: BoxDecoration(
                        color:
                            index == 1 ? CustomTheme.color232F34 : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 7,
                              spreadRadius: 5,
                              offset: Offset.fromDirection(0, 3))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.04, right: Get.width * 0.04),
                      child: Row(
                        children: [
                          Text(
                            'Arabic',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: index == 1
                                          ? Colors.white
                                          : CustomTheme.color232F34,
                                    ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: index == 1
                                ? Colors.white
                                : CustomTheme.color232F34,
                            size: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                KAppButton(
                  buttonText: "Select",
                  buttonColor: index == -1
                      ? CustomTheme.greyColor
                      : CustomTheme.blackColor,
                  onTap: () async {
                    index == 0
                        ? LanguageChangeClass.changeLanguseFunc('en')
                        : LanguageChangeClass.changeLanguseFunc('ar');
                    if (index != -1) {
                      Get.offNamed(AppRoutes.loginScreen);
                    }
                  },
                  textColor: index == -1
                      ? CustomTheme.blackColor
                      : CustomTheme.whiteColor,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
              ]),
        ));
  }
}
