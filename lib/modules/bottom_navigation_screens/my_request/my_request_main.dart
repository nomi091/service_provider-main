import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/my_request/my_request_details/my_request_deatil_view.dart';
import 'package:service_provider/modules/bottom_navigation_screens/my_request/my_request_main_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/my_request_widget.dart';

class MyRequestPage extends StatefulWidget {
  const MyRequestPage({Key? key}) : super(key: key);

  @override
  State<MyRequestPage> createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {
  MyRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.blackColor.withOpacity(0.9),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: CustomTheme.whiteColor,
        // main Column
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // top container
                  Container(
                    color: CustomTheme.colorF7F7F7,
                    height: Get.height * 0.23,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
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
                                width: 40, height: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  // for shaow
                  Container(
                    height: Get.height * 0.001,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: Get.height * 0.23,
                    ),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  // Request and Fast tracks
                  Container(
                      margin: EdgeInsets.only(
                        top: Get.height * 0.196,
                        left: Constant.pagePadding - 5,
                        right: Constant.pagePadding - 5,
                      ),
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   color: CustomTheme.greyColor.withOpacity(0.7),
                        //   width: 0.5,
                        // ),
                        // boxShadow: [
                        //   // BoxShadow(
                        //   //   color: Colors.grey.withOpacity(0.5),
                        //   //   spreadRadius: 1,
                        //   //   blurRadius: 6,
                        //   //   offset:
                        //   //       const Offset(0, 3), // changes position of shadow
                        //   // ),
                        // ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomTheme.colorF7F7F7,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: CustomTheme.color232F34.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.selectedTab.value = 0;
                              },
                              child: Container(
                                width: Get.width * 0.45,
                                decoration: BoxDecoration(
                                    color: controller.selectedTab.value == 0
                                        ? Colors.black
                                        : CustomTheme.colorF7F7F7,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.selectedTab.value == 0
                                          ? CustomTheme.greyColor
                                          : Colors.transparent,
                                      width: 0.5,
                                    )),
                                child: Center(
                                  child: Text(
                                    'requests'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontFamily:
                                                Constant.montserratSemiBold,
                                            color:
                                                controller.selectedTab.value ==
                                                        0
                                                    ? Colors.white
                                                    : CustomTheme.color232F34),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: SessionController()
                                          .isSwitchedFastTrack
                                          .value ==
                                      false
                                  ? null
                                  : () {
                                      controller.selectedTab.value = 1;
                                    },
                              child: Container(
                                width: Get.width * 0.441,
                                decoration: BoxDecoration(
                                    color: controller.selectedTab.value == 1
                                        ? Colors.black
                                        : CustomTheme.colorF7F7F7,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.selectedTab.value == 1
                                          ? CustomTheme.greyColor
                                          : Colors.transparent,
                                      width: controller.selectedTab.value == 1
                                          ? 0.5
                                          : 0,
                                    )),
                                child: Center(
                                  child: Text(
                                    'fastTracks'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          fontFamily:
                                              Constant.montserratSemiBold,
                                          color: SessionController()
                                                      .isSwitchedFastTrack
                                                      .value ==
                                                  false
                                              ? CustomTheme.color232F34
                                                  .withOpacity(0.3)
                                              : controller.selectedTab.value ==
                                                      1
                                                  ? Colors.white
                                                  : CustomTheme.color232F34,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      // : InkWell(
                      //     onTap: () {
                      //       controller.selectedTab.value = 0;
                      //     },
                      //     child: Container(
                      //       width: Get.width * 0.9,
                      //       decoration: BoxDecoration(
                      //           color: Colors.black,
                      //           borderRadius: BorderRadius.circular(10),
                      //           border: Border.all(
                      //             color: CustomTheme.greyColor,
                      //             width: 0.5,
                      //           )),
                      //       child: Center(
                      //         child: Text(
                      //           'requests'.tr,
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .headline5!
                      //               .copyWith(
                      //                 fontFamily: Constant.montserratSemiBold,
                      //                 color: Colors.white,
                      //               ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      ),
                  Container(
                      height: Get.height * 0.61,
                      margin: EdgeInsets.only(
                        top: Get.height * 0.28,
                        left: Constant.pagePadding - 10,
                        right: Constant.pagePadding - 10,
                      ),
                      child: ListView.builder(
                        itemCount: controller.selectedTab.value == 1 ? 2 : 1,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, element) {
                          return InkWell(
                              onTap: () {
                                Get.to(() => const MyRequestDetailView());
                              },
                              child: MyRequestWidget(
                                  controller: controller, status: ''));
                        },
                      ))
                ],
              )
            ],
          );
        }),
      ),
    );
  }

  void _modalBottomSheetMenu(
      BuildContext context, MyRequestController controller) {
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
