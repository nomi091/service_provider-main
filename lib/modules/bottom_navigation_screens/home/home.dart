import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/home_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/request_completed.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/request_in_progress.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/request_pending.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.colorF7F7F7,
      body: Column(
        children: [
          Container(
            height: Get.height * 0.15,
            width: double.infinity,
            color: CustomTheme.colorF7F7F7,
            child: Padding(
              padding: EdgeInsets.only(
                  top: Get.height * 0.04,
                  left: Constant.pagePadding - 5,
                  right: Constant.pagePadding - 5),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.75,
                    child: TitleText1(
                        maxLine: 1,
                        title:
                            '${'hi'.tr} ${SessionController().user.data!.userName ?? ""}'),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        _modalBottomSheetMenu(context, controller);
                      },
                      child: Image.asset(Constant.filterIcon,
                          width: 40, height: 20))
                ],
              ),
            ),
          ),
          Obx(() {
            return Expanded(
              child: Container(
                color: CustomTheme.colorF7F7F7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: ContainedTabBarView(
                    tabs: [
                      Text(
                        'pending'.tr,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontFamily: Constant.montserratSemiBold,
                              color: controller.homeSelectedTab.value == 0
                                  ? CustomTheme.color232F34
                                  : CustomTheme.color232F34.withOpacity(0.5),
                            ),
                      ),
                      Text(
                        'inProgress'.tr,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontFamily: Constant.montserratSemiBold,
                              color: controller.homeSelectedTab.value == 1
                                  ? CustomTheme.color232F34
                                  : CustomTheme.color232F34.withOpacity(0.5),
                            ),
                      ),
                      Text(
                        'completed'.tr,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontFamily: Constant.montserratSemiBold,
                              color: controller.homeSelectedTab.value == 2
                                  ? CustomTheme.color232F34
                                  : CustomTheme.color232F34.withOpacity(0.5),
                            ),
                      ),
                    ],
                    tabBarProperties: TabBarProperties(
                      height: 20.0,
                      indicatorColor: CustomTheme.color232F34,
                      indicatorWeight: 2.0,
                      labelColor: CustomTheme.blackColor,
                      //labelStyle: TextStyle(fontFamily: FontFamily.SofiaProSemiBold600, fontSize: 13),
                      unselectedLabelColor:
                          CustomTheme.blackColor.withOpacity(0.40),
                      //unselectedLabelStyle: TextStyle(fontFamily: FontFamily.SofiaProRegular400, fontSize: 13),
                    ),
                    views: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: RequestPendingPage(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: RequestInProgressPage(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: RequestCompletedPage(),
                      ),
                    ],
                    onChange: (index) {
                      controller.homeSelectedTab.value = index;
                      debugPrint(index.toString());
                    },
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu(BuildContext context, HomeController controller) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          // main container and its height
          return Container(
            height: Get.height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: Get.width * 0.06,
                right: Get.width * 0.06,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  // cancel ,search friend , done
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'cancel'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontFamily: Constant.montserratSemiBold,
                                  color: CustomTheme.darkFonts,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'sortBy'.tr,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontFamily: Constant.montserratSemiBold,
                            color: CustomTheme.color232F34,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'done'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontFamily: Constant.montserratSemiBold,
                                  color: CustomTheme.darkFonts,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: CustomTheme.darkFonts.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: Get.height * 0.001,
                  ),
                  SizedBox(
                    height: Get.height * 0.3,
                    child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: controller.list.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                // name and description
                                Container(
                                  constraints: BoxConstraints(
                                      maxWidth: Get.width * 0.65),
                                  child: Text(
                                    controller.list[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontFamily:
                                                Constant.montserratRegular,
                                            color: CustomTheme.darkFonts,
                                            fontWeight: FontWeight.w400),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Spacer(),
                                Obx(() {
                                  return Checkbox(
                                    shape: const CircleBorder(),
                                    value: controller.isCheckedFriends[index],
                                    onChanged: (val) {
                                      controller.isCheckedFriends[index] = val!;
                                      debugPrint(controller.isCheckedFriends
                                          .toString());

                                      if (controller.isCheckedListOfFriendsID
                                          .contains(controller.list[index])) {
                                        controller.isCheckedListOfFriendsID
                                            .remove(controller.list[index]);
                                      } else {
                                        controller.isCheckedListOfFriendsID
                                            .add(controller.list[index]);
                                      }
                                      debugPrint(controller
                                          .isCheckedListOfFriendsID
                                          .toString());
                                    },
                                  );
                                })
                              ],
                            ),
                          );
                        })),
                  )

                ],
              ),
            ),
          );
        });
  }

}
