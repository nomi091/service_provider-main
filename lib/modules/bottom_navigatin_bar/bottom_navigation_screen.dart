// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigatin_bar/bottom_navigation_bar_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/home.dart';
import 'package:service_provider/modules/bottom_navigation_screens/my_request/my_request_main.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/profile.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/setting_page.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

String globalPhone = '';

class BottomNavigationScreen extends StatefulWidget {
  // int? tab;
  const BottomNavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int? selectedIndex = 0;
  BottomNavigationBarController controller = Get.find();
  static List<Widget> navPages = <Widget>[
    const HomePage(),
    const MyRequestPage(),
    const ProfilePage(),
    const SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: navPages.elementAt(controller.intialIndex.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: controller.intialIndex.value == 0
                  ? Image.asset(Constant.homeS,
                      height: Get.height * 0.03, width: Get.height * 0.03)
                  : Image.asset(Constant.homeUS,
                      height: Get.height * 0.03, width: Get.height * 0.03),
              label: 'home'.tr,
              backgroundColor: CustomTheme.greyColor,
            ),
            BottomNavigationBarItem(
              icon: controller.intialIndex.value == 1
                  ? Image.asset(Constant.myrequestS,
                      height: Get.height * 0.03, width: Get.height * 0.03)
                  : Image.asset(Constant.myrequestUS,
                      height: Get.height * 0.03, width: Get.height * 0.03),
              label: 'myRequest'.tr,
              
              backgroundColor: CustomTheme.greyColor,
            ),
            BottomNavigationBarItem(
              icon: controller.intialIndex.value == 2
                  ? Image.asset(Constant.profileS,
                      height: Get.height * 0.03, width: Get.height * 0.03)
                  : Image.asset(Constant.profileUS,
                      height: Get.height * 0.03, width: Get.height * 0.03),
              label: 'profile'.tr,
              backgroundColor: CustomTheme.greyColor,
            ),
            BottomNavigationBarItem(
              icon: controller.intialIndex.value == 3
                  ? Image.asset(Constant.settingS,
                      height: Get.height * 0.03, width: Get.height * 0.03)
                  : Image.asset(Constant.settingUS,
                      height: Get.height * 0.03, width: Get.height * 0.03),
              label: 'setting'.tr,
              backgroundColor: CustomTheme.greyColor,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: Theme.of(context).textTheme.headline6!.copyWith(
              fontFamily: Constant.montserratRegular,
              color: CustomTheme.darkFonts,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: Theme.of(context).textTheme.headline6!.copyWith(
                fontFamily: Constant.montserratRegular,
                color: CustomTheme.darkFonts,
              ),
          currentIndex: controller.intialIndex.value,
          // unselectedItemColor: CustomTheme.greyColor,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 25,
          onTap: (val) {
            setState(() {
              controller.intialIndex.value = val;
            });
          },
          elevation: 5),
    );
  }
}
