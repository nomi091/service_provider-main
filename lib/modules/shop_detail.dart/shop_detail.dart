// ignore_for_file: file_names

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/create_shop/create_shop_controller.dart';
import 'package:service_provider/modules/create_shop/create_shop_page.dart';
import 'package:service_provider/modules/google_map.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/methods/get_user_location.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/textfield_widget.dart';
import 'package:service_provider/utils/widget/Textext_and_textfieldt/title_text_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_error_widget.dart';
import 'package:service_provider/utils/widget/error_widget/string_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:service_provider/utils/widget/map_widget.dart';
import 'package:image_picker/image_picker.dart';

// SplashPage is not containing any logic yet
// just navigative toward GetStartedScreen from SplashController after 2 seconds
class ShopDetailPage extends StatefulWidget {
  const ShopDetailPage({Key? key}) : super(key: key);

  @override
  State<ShopDetailPage> createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends State<ShopDetailPage> {
  CreateShopController controller = Get.put(CreateShopController());
  bool isImageShow = false;
  bool isImportant = false;
  bool isEnabled = false;
  dynamic value = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint(controller.isFromMap.value.toString());
      if (controller.isFromMap.value) {
        setState(() {
          controller.isMapSHow.value = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {});
      } else {
        controller.isLoading.value = true;
        getMapData();
      }
    });
  }

  getMapData() async {
    if (controller.imageUrl.contains('')) {
      controller.imageUrl.clear();
    }
    if (controller.imageName.contains('')) {
      controller.imageName.clear();
    }
    await UserCurrentLocation.determinePosition().then((value) {
      setState(() {
        controller.latitude = value.latitude;
        controller.longitude = value.longitude;
        // controller.isMapSHow.value = true;
      });
      controller.getShopDetail();
      controller.getActivityCoreData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.blackColor.withOpacity(0.7),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: CustomTheme.whiteColor,
          // main Column
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              Obx(
                                () => Container(
                                  height: Get.height * 0.28,
                                  width: double.infinity,
                                  color: CustomTheme.color232F34,
                                  child: InkWell(
                                    onTap: () {
                                      debugPrint('helloooo');
                                      setState(() {
                                        if (controller.imageUrl.isNotEmpty) {
                                          isImageShow = !isImageShow;
                                        }
                                      });
                                    },
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        controller.imageUrl.toSet().toList();
                                        final image =
                                            controller.imageUrl[index];
                                        return Image.network(
                                          controller.imageUrl
                                                  .toSet()
                                                  .toList()
                                                  .isEmpty
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
                                                child: const Icon(Icons.error));
                                          },
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      itemCount: controller.imageUrl
                                          .toSet()
                                          .toList()
                                          .length,
                                      pagination: controller.imageUrl
                                                  .toSet()
                                                  .toList()
                                                  .length <=
                                              1
                                          ? null
                                          : const SwiperPagination(
                                              alignment: Alignment.topCenter,
                                              builder:
                                                  DotSwiperPaginationBuilder(
                                                      color: Colors.white,
                                                      activeColor:
                                                          Colors.white54,
                                                      size: 12.0,
                                                      activeSize: 10.0),
                                            ),

                                      autoplay: controller.imageUrl
                                                  .toSet()
                                                  .toList()
                                                  .length <=
                                              1
                                          ? false
                                          : true,
                                      // control: controller.imageUrl.isEmpty
                                      //     ? null
                                      //     : const SwiperControl(),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 30, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          'shopDetail'.tr,
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
                                    alignment:
                                        SessionController().language == 'en'
                                            ? Alignment.topRight
                                            : Alignment.topLeft,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, top: 20, right: 20),
                                      height: 30,
                                      width: 30,
                                      child: Center(
                                          child: InkWell(
                                              onTap: () async {
                                                debugPrint('Tapped');
                                                await _getFromGallery();
                                                setState(() {});
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                  Constant.editimage,
                                                  width: 20,
                                                  height: 20))),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // remaining Container
                          controller.isLoading.value
                              ? Padding(
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
                                        decoration: BoxDecoration(
                                          color: CustomTheme.colorF7F7F7,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 3,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        height: Get.height * 0.75,
                                        width: double.infinity,
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
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
                                        height: Get.height * 0.75,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: CustomTheme.colorF7F7F7,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 3,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: Get.height * 0.06,
                                                ),
                                                // Activity Core*
                                                SubTitleWidget(
                                                  title: 'coreActivity1'.tr,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    controller.activityCoreError
                                                        .value = '';
                                                    controller.isActivityCore
                                                        .value = true;
                                                    controller.isYourService
                                                        .value = false;
                                                  },
                                                  child: SizedBox(
                                                    height: Get.height * 0.035,
                                                    child: TextField(
                                                      enabled: false,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'select'.tr,
                                                        hintStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline6!
                                                                .copyWith(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratRegular,
                                                                  color: CustomTheme
                                                                      .darkFonts,
                                                                ),
                                                        suffixIcon: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: SessionController()
                                                                          .language ==
                                                                      'en'
                                                                  ? Get.width *
                                                                      0.12
                                                                  : 0,
                                                              right: SessionController()
                                                                          .language ==
                                                                      'en'
                                                                  ? 0
                                                                  : Get.width *
                                                                      0.1),
                                                          child: SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                            child: Image.asset(
                                                              Constant
                                                                  .dropDown2,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // text style
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                            fontFamily: Constant
                                                                .montserratRegular,
                                                            color: CustomTheme
                                                                .darkFonts,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                ////////////////////////////////////////////////////////////////
                                                // Activity Core List Card
                                                controller.isActivityCore.value
                                                    ? Container(
                                                        height:
                                                            Get.height * 0.2,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: CustomTheme
                                                              .whiteColor,
                                                          border: Border.all(
                                                            width: 1,
                                                            color: CustomTheme
                                                                .greyColor,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Spacer(),
                                                                InkWell(
                                                                  onTap: () {
                                                                    controller
                                                                        .isActivityCore
                                                                        .value = false;
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        Get.width *
                                                                            0.06,
                                                                    width:
                                                                        Get.width *
                                                                            0.06,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .transparent,
                                                                        borderRadius:
                                                                            BorderRadius.circular(100)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          SizedBox(
                                                                        height: Get.width *
                                                                            0.44,
                                                                        child: Icon(
                                                                            Icons
                                                                                .close,
                                                                            color:
                                                                                CustomTheme.color232F34,
                                                                            size: 18),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              height:
                                                                  Get.height *
                                                                      0.16,
                                                              color: CustomTheme
                                                                  .whiteColor,
                                                              child: ListView
                                                                  .builder(
                                                                padding: EdgeInsets.only(
                                                                    bottom: Get
                                                                            .height *
                                                                        0.02),
                                                                itemCount:
                                                                    controller
                                                                        .activitCoreList
                                                                        .data!
                                                                        .length,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  return SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            0.9,
                                                                    height: Get
                                                                            .height *
                                                                        0.035,
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        // for add from selected list
                                                                        if (controller.selectedActivitCoreNameList.contains(controller
                                                                            .activitCoreList
                                                                            .data![index]
                                                                            .name!)) {
                                                                        } else {
                                                                          controller
                                                                              .selectedActivitCoreNameList
                                                                              .add(controller.activitCoreList.data![index].name ?? "");
                                                                          controller
                                                                              .selectedActivitCoreIDList
                                                                              .add(controller.activitCoreList.data![index].id ?? "");
                                                                          controller.selectedActivitCoreList.add(Service1(
                                                                              controller.activitCoreList.data![index].name ?? "",
                                                                              controller.activitCoreList.data![index].id ?? ""));
                                                                          var id =
                                                                              '';
                                                                          controller
                                                                              .selectedActivitCoreIDList
                                                                              .toSet()
                                                                              .toList();
                                                                          id = controller
                                                                              .selectedActivitCoreIDList
                                                                              .reduce((value, element) => '$value,$element');

                                                                          await controller
                                                                              .getServicesByCoreID(id);
                                                                          controller
                                                                              .isSelectedActivitCoreList
                                                                              .value = true;
                                                                          controller
                                                                              .isActivityCore
                                                                              .value = false;
                                                                        }

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        color: controller.selectedActivitCoreNameList.contains(controller.activitCoreList.data![index].name)
                                                                            ? CustomTheme.color232F34.withOpacity(0.2)
                                                                            : Colors.transparent,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: Get.width * 0.03,
                                                                            ),
                                                                            ///////////////////////////kami///////////////////
                                                                            Container(
                                                                              height: 13,
                                                                              width: 13,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(3),
                                                                                border: Border.all(
                                                                                  width: 1,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(2.0),
                                                                                child: Container(
                                                                                  height: 10,
                                                                                  width: 10,
                                                                                  decoration: BoxDecoration(
                                                                                      color: controller.selectedActivitCoreNameList.contains(controller.activitCoreList.data![index].name) ? CustomTheme.blackColor : Colors.transparent,
                                                                                      borderRadius: BorderRadius.circular(2),
                                                                                      border: Border.all(
                                                                                        width: 1,
                                                                                        color: Colors.transparent,
                                                                                      )),
                                                                                ),
                                                                                //////////////////////////kami/////////
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: Get.width * 0.03,
                                                                            ),
                                                                            Text(
                                                                              controller.activitCoreList.data![index].name!.length >= 20 ? controller.activitCoreList.data![index].name!.substring(0, 20) : controller.activitCoreList.data![index].name!.substring(0, controller.activitCoreList.data![index].name!.length),
                                                                              style: Theme.of(context).textTheme.headline6!.copyWith(fontFamily: Constant.montserratRegular, color: controller.selectedActivitCoreNameList.contains(controller.activitCoreList.data![index].name) ? CustomTheme.whiteColor : CustomTheme.darkFonts, fontWeight: controller.selectedActivitCoreNameList.contains(controller.activitCoreList.data![index].name) ? FontWeight.bold : FontWeight.normal),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                                ///////////////////////////////////////////////////////////////////////////
                                                // for Activity Core Error
                                                Divider(
                                                  height: Get.height * 0.0007,
                                                  color: controller
                                                              .activityCoreError
                                                              .value !=
                                                          ''
                                                      ? CustomTheme.redColor
                                                      : CustomTheme.darkFonts
                                                          .withOpacity(0.5),
                                                ),
                                                controller.activityCoreError
                                                            .value !=
                                                        ''
                                                    ? StringErrorWidget(
                                                        error: controller
                                                            .activityCoreError
                                                            .value)
                                                    : SizedBox(
                                                        height: controller
                                                                .isSelectedActivitCoreList
                                                                .value
                                                            ? Get.height * 0.007
                                                            : Get.height * 0.02,
                                                      ),
                                                ///////////////////////////////////////////////////////////////////////////
                                                // for Selected Activity Core Card
                                                controller
                                                        .isSelectedActivitCoreList
                                                        .value
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 8.0),
                                                        child: SizedBox(
                                                          height:
                                                              Get.height * 0.03,
                                                          width:
                                                              Get.width * 0.9,
                                                          child:
                                                              ListView.builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  itemCount:
                                                                      controller
                                                                          .selectedActivitCoreList
                                                                          .length,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    return Container(
                                                                      margin: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              5),
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: Get.width *
                                                                              0.02,
                                                                          vertical:
                                                                              Get.height * 0.002),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        color: CustomTheme
                                                                            .whiteColor
                                                                            .withOpacity(0.6),
                                                                        border: Border.all(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                CustomTheme.greyColor),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            controller.selectedActivitCoreList[index].servicename,
                                                                            style:
                                                                                Theme.of(context).textTheme.headline6!.copyWith(fontFamily: Constant.montserratMedium, color: CustomTheme.darkFonts),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                Get.width * 0.02,
                                                                          ),
                                                                          InkWell(
                                                                              onTap: () async {
                                                                                setState(() {
                                                                                  controller.selectedActivitCoreList.removeAt(index);
                                                                                  controller.selectedActivitCoreNameList.removeAt(index);
                                                                                  controller.selectedActivitCoreIDList.removeAt(index);
                                                                                });
                                                                                if (controller.selectedActivitCoreIDList.isNotEmpty) {
                                                                                  var id = '';
                                                                                  controller.selectedActivitCoreIDList.toSet().toList();
                                                                                  id = controller.selectedActivitCoreIDList.reduce((value, element) => '$value,$element');

                                                                                  await controller.getServicesByCoreID(id);
                                                                                } else {
                                                                                  controller.isYourAddedService.value = false;
                                                                                  controller.addedService.clear();
                                                                                  controller.addedServiceForColor.clear();
                                                                                  await controller.getServicesByCoreID('000111222333');
                                                                                }
                                                                                controller.isYourService.value = false;
                                                                                // if empty above screen then
                                                                                if (controller.selectedActivitCoreList.isEmpty) {
                                                                                  controller.isYourService.value = false;
                                                                                  controller.isSelectedActivitCoreList.value = false;
                                                                                }
                                                                              },
                                                                              child: const Icon(
                                                                                Icons.close_rounded,
                                                                                size: 15,
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  }),
                                                        ),
                                                      )
                                                    : const SizedBox(),

                                                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                // // your services
                                                SubTitleWidget(
                                                  title: 'yourServices1'.tr,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (controller
                                                        .selectedActivitCoreList
                                                        .isNotEmpty) {
                                                      controller.isYourService
                                                          .value = true;
                                                      controller.isActivityCore
                                                          .value = false;
                                                      controller
                                                          .yourServiceError
                                                          .value = '';
                                                    } else {
                                                      Constant.showSnackBar(
                                                          'error'.tr,
                                                          'pleaseSelectAtleastOneActivityCore'
                                                              .tr);
                                                    }
                                                  },
                                                  child: SizedBox(
                                                    height: Get.height * 0.035,
                                                    child: TextField(
                                                      enabled: false,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'select'.tr,
                                                        hintStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline6!
                                                                .copyWith(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratRegular,
                                                                  color: CustomTheme
                                                                      .darkFonts,
                                                                ),
                                                        suffixIcon: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: SessionController()
                                                                          .language ==
                                                                      'en'
                                                                  ? Get.width *
                                                                      0.12
                                                                  : 0,
                                                              right: SessionController()
                                                                          .language ==
                                                                      'en'
                                                                  ? 0
                                                                  : Get.width *
                                                                      0.1),
                                                          child: SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                            child: Image.asset(
                                                              Constant
                                                                  .dropDown2,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // text style
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                            fontFamily: Constant
                                                                .montserratRegular,
                                                            color: CustomTheme
                                                                .darkFonts,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                //////////////////////////////////////////////////////////
                                                Divider(
                                                  height: Get.height * 0.0007,
                                                  color: controller
                                                              .yourServiceError
                                                              .value !=
                                                          ''
                                                      ? CustomTheme.redColor
                                                      : CustomTheme.darkFonts
                                                          .withOpacity(0.5),
                                                ),
                                                /////////////////////////////////////////////////////////
                                                // Your Services Card
                                                controller.isYourService.value
                                                    ? Container(
                                                        height:
                                                            Get.height * 0.23,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: CustomTheme
                                                              .whiteColor,
                                                          border: Border.all(
                                                            width: 1,
                                                            color: CustomTheme
                                                                .greyColor,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.01,
                                                            ),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.9,
                                                              height:
                                                                  Get.height *
                                                                      0.03,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            0.03,
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () {},
                                                                    child: Icon(
                                                                      Icons
                                                                          .search,
                                                                      color: isEnabled
                                                                          ? Colors
                                                                              .blue
                                                                          : Colors
                                                                              .grey,
                                                                      size: Get
                                                                              .width *
                                                                          0.07,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      border: Border.all(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                    width:
                                                                        Get.width *
                                                                            0.44,
                                                                    child:
                                                                        TextField(
                                                                      controller:
                                                                          controller
                                                                              .searchController,
                                                                      onChanged:
                                                                          (val) {
                                                                        if (val
                                                                            .isNotEmpty) {
                                                                          if (val.length >
                                                                              2) {
                                                                            controller.yourSearchServiceListModel.clear();
                                                                            for (int i = 0;
                                                                                i < controller.yourServiceListModel.value.data!.length;
                                                                                i++) {
                                                                              if (controller.yourServiceListModel.value.data![i].name!.contains(val.toLowerCase())) {
                                                                                controller.yourSearchServiceListModel.add(controller.yourServiceListModel.value.data![i]);
                                                                                controller.yourSearchServiceListModel.toSet().toList();
                                                                                controller.isSearch.value = true;
                                                                              }
                                                                              // if (controller.yourSearchServiceListModel.isNotEmpty) {
                                                                              //   controller.isSearch.value = true;
                                                                              // } else {
                                                                              //   controller.isSearch.value = false;
                                                                              // }
                                                                            }
                                                                          }
                                                                        } else {
                                                                          if (val == "" ||
                                                                              val.isEmpty) {
                                                                            controller.yourSearchServiceListModel.clear();
                                                                            controller.isSearch.value =
                                                                                false;
                                                                          }
                                                                        }
                                                                      },
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      cursorColor:
                                                                          Colors
                                                                              .grey,
                                                                      decoration: const InputDecoration(
                                                                          contentPadding: EdgeInsets.all(
                                                                              10),
                                                                          border:
                                                                              InputBorder.none),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            0.02,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      controller
                                                                          .serviceNameController
                                                                          .clear();
                                                                      controller
                                                                          .serviceNameError
                                                                          .value = '';
                                                                      controller
                                                                          .priceController
                                                                          .clear();
                                                                      controller
                                                                          .priceError
                                                                          .value = '';
                                                                      controller
                                                                          .addedServiceIed = '';
                                                                      controller
                                                                          .isEditServide
                                                                          .value = false;
                                                                      controller
                                                                          .priceController
                                                                          .clear();
                                                                      modalBottomSheetMenu(
                                                                          context,
                                                                          controller,
                                                                          '',
                                                                          true,
                                                                          '');
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: Get
                                                                    .width *
                                                                          0.055,
                                                                      height: Get
                                                                              .height *
                                                                          0.025,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(2),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.white),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                CustomTheme.greyColor.withOpacity(0.3),
                                                                            spreadRadius:
                                                                                1,
                                                                            blurRadius:
                                                                                2,
                                                                            offset:
                                                                                const Offset(0, 3), // changes position of shadow
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .black,
                                                                        size: Get.height *
                                                                            0.022,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            0.01,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        controller
                                                                            .isYourService
                                                                            .value = false;
                                                                        controller
                                                                            .searchController
                                                                            .clear();
                                                                        controller
                                                                            .isSearch
                                                                            .value = false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: Get
                                                                              .width *
                                                                          0.06,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .transparent,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100)),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              Colors.black,
                                                                          size: Get.height *
                                                                              0.022,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.01,
                                                            ),
                                                            const Divider(
                                                              color:
                                                                  Colors.grey,
                                                              height: 1,
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.01,
                                                            ),
                                                            Container(
                                                              height:
                                                                  Get.height *
                                                                      0.16,
                                                              color: CustomTheme
                                                                  .whiteColor,
                                                              child: controller
                                                                          .isSearch
                                                                          .value ==
                                                                      true
                                                                  ? ListView
                                                                      .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      itemCount: controller
                                                                          .yourSearchServiceListModel
                                                                          .length,
                                                                      itemBuilder:
                                                                          (BuildContext context,
                                                                              int index) {
                                                                        print(
                                                                            "----------- ---------${controller.yourSearchServiceListModel[index].name} ---------------");

                                                                        return InkWell(
                                                                          onTap:
                                                                              () {
                                                                            controller.serviceNameController.text =
                                                                                controller.yourSearchServiceListModel[index].name ?? "";
                                                                            controller.priceController.clear();
                                                                            // controller.priceController.text =
                                                                            //     controller.yourSearchyourServiceListModel.value.data!Model[index].id ?? "";
                                                                            controller.isEditServide.value =
                                                                                false;
                                                                            modalBottomSheetMenu(
                                                                                context,
                                                                                controller,
                                                                                controller.yourSearchServiceListModel[index].id ?? "",
                                                                                false,
                                                                                '');
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            color: controller.addedServiceForColor.contains(controller.yourSearchServiceListModel[index].name)
                                                                                ? CustomTheme.greyColor
                                                                                : Colors.transparent,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Get.width * 0.9,
                                                                              height: Get.height * 0.03,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: Get.width * 0.03,
                                                                                  ),
                                                                                  Container(
                                                                                    height: 13,
                                                                                    width: 13,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(3),
                                                                                      border: Border.all(
                                                                                        width: 1,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(2.0),
                                                                                      child: Container(
                                                                                        height: 10,
                                                                                        width: 10,
                                                                                        decoration: BoxDecoration(
                                                                                            color: controller.addedServiceForColor.contains(controller.yourSearchServiceListModel[index].name ?? "") ? CustomTheme.blackColor : Colors.transparent,
                                                                                            borderRadius: BorderRadius.circular(2),
                                                                                            border: Border.all(
                                                                                              width: 1,
                                                                                              color: Colors.transparent,
                                                                                            )),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: Get.width * 0.03,
                                                                                  ),
                                                                                  Text(
                                                                                    controller.yourSearchServiceListModel[index].name ?? "",
                                                                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                                          fontFamily: Constant.montserratRegular,
                                                                                          color: controller.addedServiceForColor.contains(controller.yourSearchServiceListModel[index].name) ? CustomTheme.whiteColor : CustomTheme.darkFonts,
                                                                                          fontWeight: controller.addedServiceForColor.contains(controller.yourSearchServiceListModel[index].name) ? FontWeight.bold : FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    )
                                                                  : ListView
                                                                      .builder(
                                                                      padding: EdgeInsets.only(
                                                                          bottom:
                                                                              Get.height * 0.02),
                                                                      itemCount: controller
                                                                          .yourServiceListModel
                                                                          .value
                                                                          .data!
                                                                          .length,
                                                                      itemBuilder:
                                                                          (BuildContext context,
                                                                              int index) {
                                                                        print(
                                                                            "##################### ${controller.yourServiceListModel.value.data![index].name} ################");
                                                                        return InkWell(
                                                                          onTap:
                                                                              () {
                                                                            if (controller.addedServiceForColor.contains(controller.yourServiceListModel.value.data![index].name ??
                                                                                "")) {
                                                                            } else {
                                                                              controller.serviceNameController.text = controller.yourServiceListModel.value.data![index].name ?? "";
                                                                              // controller.priceController.text = controller.youryourServiceListModel.value.data!Model.value.data![index].id ?? "";
                                                                              controller.chooseServiceType.value = 'shopService'.tr;
                                                                              controller.isEditServide.value = false;
                                                                              controller.priceController.clear();
                                                                              modalBottomSheetMenu(context, controller, controller.yourServiceListModel.value.data![index].id ?? "", false,'');
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            color: controller.addedServiceForColor.contains(controller.yourServiceListModel.value.data![index].name ?? "")
                                                                                ? CustomTheme.color232F34.withOpacity(0.2)
                                                                                : Colors.transparent,
                                                                            child:
                                                                                SizedBox(
                                                                              width: Get.width * 0.9,
                                                                              height: Get.height * 0.03,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: Get.width * 0.03,
                                                                                  ),
                                                                                  Container(
                                                                                    height: 13,
                                                                                    width: 13,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(3),
                                                                                      border: Border.all(
                                                                                        width: 1,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(2.0),
                                                                                      child: Container(
                                                                                        height: 10,
                                                                                        width: 10,
                                                                                        decoration: BoxDecoration(
                                                                                            color: controller.addedServiceForColor.contains(controller.yourServiceListModel.value.data![index].name ?? "") ? CustomTheme.blackColor : Colors.transparent,
                                                                                            borderRadius: BorderRadius.circular(2),
                                                                                            border: Border.all(
                                                                                              width: 1,
                                                                                              color: Colors.transparent,
                                                                                            )),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: Get.width * 0.03,
                                                                                  ),

                                                                                  //////////////////////////Kami///////////////////////
                                                                                  Text(
                                                                                    controller.yourServiceListModel.value.data![index].name ?? "null",
                                                                                    //.length >= 20 ? controller.yourServiceListModel.value.data![index].name!.substring(0, 20) : controller.yourServiceListModel.value.data![index].name!.substring(0, controller.yourServiceListModel.value.data![index].name!.length),
                                                                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                                          fontFamily: Constant.montserratRegular,
                                                                                          color: controller.addedServiceForColor.contains(controller.yourServiceListModel.value.data![index].name) ? CustomTheme.whiteColor : CustomTheme.darkFonts,
                                                                                          fontWeight: controller.addedServiceForColor.contains(controller.yourServiceListModel.value.data![index].name) ? FontWeight.bold : FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                                ///////////////////////////////////////////////////////
                                                // Your Services Error
                                                controller.yourServiceError
                                                            .value !=
                                                        ''
                                                    ? StringErrorWidget(
                                                        error: controller
                                                            .yourServiceError
                                                            .value)
                                                    : SizedBox(
                                                        height: controller
                                                                .isYourAddedService
                                                                .value
                                                            ? Get.height * 0.015
                                                            : Get.height *
                                                                0.025,
                                                      ),
                                                ////////////////////////////////////////////////////////
                                                // Your Added Services sespecious
                                                controller.isYourAddedService
                                                        .value
                                                    ? Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: Get.height *
                                                                0.01),
                                                        child: GridView.builder(
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                5.0,
                                                            mainAxisSpacing:
                                                                5.0,
                                                            childAspectRatio:
                                                                10 / 4.5,
                                                          ),
                                                          itemCount: controller
                                                              .addedService
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Stack(
                                                              children: [
                                                                //  container for name etc
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: Get.height *
                                                                          0.01),
                                                                  height:
                                                                      Get.height *
                                                                          0.07,
                                                                  width:
                                                                      Get.width *
                                                                          0.34,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: Get.width * 0.03),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              Get.width * 0.2,
                                                                          child:
                                                                              Text(
                                                                            controller.addedService[index].servicename,
                                                                            maxLines:
                                                                                1,
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                                  fontFamily: Constant.montserratSemiBold,
                                                                                  height: Get.height * 0.002,
                                                                                  color: CustomTheme.whiteColor,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // ignore: unrelated_type_equality_checks
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: Get.width * 0.03),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            controller.addedService[index].serviceType == 'bothService'
                                                                                ? Row(
                                                                                    children: [
                                                                                      Image.asset(
                                                                                        Constant.homeSer,
                                                                                        height: 15,
                                                                                        width: 15,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: Get.width * 0.008,
                                                                                      ),
                                                                                      Image.asset(
                                                                                        Constant.shopSer1,
                                                                                        height: 15,
                                                                                        width: 15,
                                                                                      )
                                                                                    ],
                                                                                  )
                                                                                : controller.addedService[index].serviceType == 'shopService'
                                                                                    ? Image.asset(
                                                                                        Constant.shopSer1,
                                                                                        height: 15,
                                                                                        width: 15,
                                                                                      )
                                                                                    : Image.asset(
                                                                                        Constant.homeSer,
                                                                                        height: 15,
                                                                                        width: 15,
                                                                                      ),
                                                                            SizedBox(
                                                                                width: Get.width * 0.20,
                                                                                child: Text(
                                                                                  controller.addedService[index].subName != 'CA' ? ' ${controller.addedService[index].subName} ${'aED'.tr}' : " ${controller.shopDetailModel.value.data!.services![index].price.toString()} ${'aED'.tr}",
                                                                                  // controller.addedService[index].price,
                                                                                  maxLines: 1,
                                                                                  textAlign: TextAlign.left,
                                                                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                                                                        fontFamily: Constant.montserratRegular,
                                                                                        height: Get.height * 0.002,
                                                                                        color: CustomTheme.whiteColor,
                                                                                      ),
                                                                                )),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                // container for edit img icon
                                                                InkWell(
                                                                  onTap: () {
                                                               
                                                                    var ServiceId=controller.addedService[index].price;
                                                                    controller
                                                                        .isEditServide
                                                                        .value = true;
                                                                    controller
                                                                        .isYourService
                                                                        .value = false;
                                                                    debugPrint(index
                                                                        .toString());
                                                                    debugPrint(controller
                                                                        .isEditServide
                                                                        .value
                                                                        .toString());
                                                                    controller
                                                                            .serviceNameController
                                                                            .text =
                                                                        controller
                                                                            .addedService[index]
                                                                            .servicename;
                                                                    controller
                                                                        .priceController
                                                                        .text = controller.addedService[index].price ==
                                                                            ''
                                                                        ? controller
                                                                            .priceController
                                                                            .text
                                                                            .toString()
                                                                        : '';

                                                                    setState(
                                                                        () {
                                                                      controller
                                                                              .chooseServiceType
                                                                              .value =
                                                                          controller
                                                                              .addedService[index]
                                                                              .serviceType;
                                                                      controller.serviceID = controller
                                                                          .addedService[
                                                                              index]
                                                                          .price;
                                                                    });

                                                                    modalBottomSheetMenu(
                                                                        context,
                                                                        controller,
                                                                        '',
                                                                        false,
                                                                        ServiceId);
                                                                  },
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child:
                                                                        Container(
                                                                      height: Get
                                                                              .width *
                                                                          0.05,
                                                                      width: Get
                                                                              .width *
                                                                          0.05,
                                                                      decoration: BoxDecoration(
                                                                          color: CustomTheme
                                                                              .colorF7F7F7,
                                                                          border: Border.all(
                                                                              width: 0.5,
                                                                              color: CustomTheme.color232F34),
                                                                          borderRadius: BorderRadius.circular(100)),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          size: Get.height *
                                                                              0.018,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                //  // Shop Location
                                                SubTitleWidget(
                                                  title: 'shopLocation1'.tr,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    Constant.showDialog();
                                                    controller.isMapSHow.value =
                                                        false;
                                                    controller.locationError
                                                        .value = '';
                                                    await Get.to(() =>
                                                        const GoogleMapClassN(
                                                          screenName:
                                                              'shopDetail',
                                                        ));
                                                    Get.back();

                                                    setState(() {});
                                                    if (SessionController()
                                                                .lat !=
                                                            0.0 ||
                                                        SessionController()
                                                                .lon !=
                                                            0.0) {
                                                      controller
                                                          .locationController
                                                          .text = SessionController()
                                                              .selectedLocation ??
                                                          "";
                                                      controller.isMapSHow
                                                          .value = true;
                                                    }
                                                    setState(() {});
                                                    setState(() {});
                                                  },
                                                  child: SizedBox(
                                                    height: Get.height * 0.05,
                                                    child: TextField(
                                                      controller: controller
                                                          .locationController,
                                                      enabled: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'location'.tr,
                                                        hintStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline6!
                                                                .copyWith(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratRegular,
                                                                  color: CustomTheme
                                                                      .darkFonts,
                                                                ),
                                                        border:
                                                            InputBorder.none,
                                                        suffixIcon: Padding(
                                                          padding: EdgeInsets.only(
                                                              left: SessionController()
                                                                          .language ==
                                                                      'en'
                                                                  ? Get.width *
                                                                      0.12
                                                                  : 0,
                                                              right: SessionController()
                                                                          .language ==
                                                                      'en'
                                                                  ? 0
                                                                  : Get.width *
                                                                      0.1),
                                                          // const EdgeInsets.all(
                                                          //     5),
                                                          child: SizedBox(
                                                              child:
                                                                  Image.asset(
                                                            Constant
                                                                .attachedFileIcon,
                                                            height: 15,
                                                            width: 15,
                                                          )),
                                                        ),
                                                      ),
                                                      // text style
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                            fontFamily: Constant
                                                                .montserratRegular,
                                                            color: CustomTheme
                                                                .darkFonts,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  height: Get.height * 0.0007,
                                                  color: controller
                                                              .locationError
                                                              .value !=
                                                          ''
                                                      ? CustomTheme.redColor
                                                      : CustomTheme.darkFonts
                                                          .withOpacity(0.5),
                                                ),
                                                controller.locationError
                                                            .value !=
                                                        ''
                                                    ? StringErrorWidget(
                                                        error: controller
                                                            .locationError
                                                            .value)
                                                    : SizedBox(
                                                        height: controller
                                                                .isMapSHow.value
                                                            ? Get.height * 0.007
                                                            : Get.height * 0.03,
                                                      ),
                                                controller.isMapSHow.value
                                                    ? Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        height:
                                                            Get.height * 0.15,
                                                        child: GoogleMapWidget(
                                                          latLng: LatLng(
                                                              SessionController()
                                                                  .lat,
                                                              SessionController()
                                                                  .lon),
                                                        ),
                                                      )
                                                    : const SizedBox(),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                // Shop Image
                                                SubTitleWidget(
                                                  title: 'shopImage'.tr,
                                                ),

                                                InkWell(
                                                  onTap: () async {
                                                    debugPrint('Tapped');
                                                    await _getFromGallery();
                                                    setState(() {});
                                                    setState(() {});
                                                  },
                                                  child: SizedBox(
                                                    height: Get.height * 0.035,
                                                    child: TextField(
                                                      controller: controller
                                                          .imgController,
                                                      enabled: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'image'.tr,
                                                        hintStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline6!
                                                                .copyWith(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratRegular,
                                                                  color: CustomTheme
                                                                      .darkFonts,
                                                                ),
                                                        border:
                                                            InputBorder.none,
                                                        suffixIcon: Padding(
                                                            // padding:
                                                            padding: EdgeInsets.only(
                                                                left: SessionController()
                                                                            .language ==
                                                                        'en'
                                                                    ? Get.width *
                                                                        0.12
                                                                    : 0,
                                                                right: SessionController()
                                                                            .language ==
                                                                        'en'
                                                                    ? 0
                                                                    : Get.width *
                                                                        0.1),
                                                            // const EdgeInsets
                                                            //     .all(5),
                                                            child: Image.asset(
                                                              Constant
                                                                  .locationMarkerIcon,
                                                              width: 15,
                                                              height: 15,
                                                            )),
                                                      ),

                                                      // text style
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                            fontFamily: Constant
                                                                .montserratRegular,
                                                            color: CustomTheme
                                                                .color232F34,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  height: Get.height * 0.0007,
                                                  color: controller
                                                              .imgError.value !=
                                                          ''
                                                      ? CustomTheme.redColor
                                                      : CustomTheme.darkFonts
                                                          .withOpacity(0.5),
                                                ),
                                                controller.imageName.isNotEmpty
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 8.0,
                                                                top: 5),
                                                        child: SizedBox(
                                                          height:
                                                              Get.height * 0.03,
                                                          width:
                                                              Get.width * 0.9,
                                                          child:
                                                              ListView.builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  itemCount: controller
                                                                      .imageName
                                                                      .toSet()
                                                                      .toList()
                                                                      .length,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    return Container(
                                                                      margin: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              5),
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: Get.width *
                                                                              0.02,
                                                                          vertical:
                                                                              Get.height * 0.002),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        color: CustomTheme
                                                                            .whiteColor
                                                                            .withOpacity(0.6),
                                                                        border: Border.all(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                CustomTheme.greyColor),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            controller.imageName.toSet().toList()[index],
                                                                            style:
                                                                                Theme.of(context).textTheme.headline6!.copyWith(fontFamily: Constant.montserratMedium, color: CustomTheme.color232F34),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                Get.width * 0.002,
                                                                          ),
                                                                          InkWell(
                                                                              onTap: () async {
                                                                                setState(() {
                                                                                  controller.imageUrl.removeAt(index);
                                                                                  controller.imageName.removeAt(index);
                                                                                });
                                                                              },
                                                                              child: const Icon(
                                                                                Icons.close,
                                                                                size: 20,
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  }),
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                                controller.imgError.value != ''
                                                    ? StringErrorWidget(
                                                        error: controller
                                                            .imgError.value)
                                                    : SizedBox(
                                                        height:
                                                            Get.height * 0.03,
                                                      ),
                                                /////////////////////////////////////////////////////////////////////////////////////////////////////
                                                // Bio
                                                SubTitleWidget(
                                                  title: 'bio'.tr,
                                                ),

                                                Container(
                                                  height: Get.height * 0.09,
                                                  margin: EdgeInsets.only(
                                                      top: Get.height * 0.01),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color:
                                                          CustomTheme.greyColor,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: TextField(
                                                      controller: controller
                                                          .bioController,
                                                      maxLines: null,
                                                      cursorColor:
                                                          CustomTheme.greyColor,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      onChanged: (String val) {
                                                        if (val.isNotEmpty) {
                                                          controller.bioError
                                                              .value = '';
                                                        }
                                                      },
                                                      // text style
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                            fontFamily: Constant
                                                                .montserratRegular,
                                                            color: CustomTheme
                                                                .darkFonts,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                // 'Workdays and Times*',
                                                SubTitleWidget(
                                                  title: 'workdaysAndTimes1'.tr,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(AppRoutes
                                                        .shopScehduleDetail);
                                                  },
                                                  child: Container(
                                                    height: Get.height * 0.05,
                                                    margin: EdgeInsets.only(
                                                        top: Get.height * 0.01),
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white70,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 1,
                                                            blurRadius: 3,
                                                            offset: const Offset(
                                                                0,
                                                                1), // changes position of shadow
                                                          ),
                                                        ],
                                                        border: Border.all(
                                                          color: CustomTheme
                                                              .greyColor,
                                                          width:
                                                              Get.width * 0.001,
                                                        )),
                                                    child: SizedBox(
                                                      height:
                                                          Get.height * 0.035,
                                                      child: TextField(
                                                        enabled: false,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          prefixIcon: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: Get
                                                                            .width *
                                                                        0.02),
                                                            child:
                                                                const SizedBox(
                                                              height: 15,
                                                              width: 15,
                                                              child: Icon(Icons
                                                                  .lock_clock),
                                                            ),
                                                          ),
                                                        ),
                                                        onChanged:
                                                            (String val) {
                                                          if (val.isNotEmpty) {
                                                            controller
                                                                .workedAndTimesError
                                                                .value = '';
                                                          }
                                                        },
                                                        // text style
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6!
                                                            .copyWith(
                                                              fontFamily: Constant
                                                                  .montserratRegular,
                                                              color: CustomTheme
                                                                  .darkFonts,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                controller.workedAndTimesError
                                                            .value !=
                                                        ''
                                                    ? StringErrorWidget(
                                                        error: controller
                                                            .workedAndTimesError
                                                            .value)
                                                    : SizedBox(
                                                        height:
                                                            Get.height * 0.03,
                                                      ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: Get.height * 0.02),
                                                  child: KAppButton(
                                                    buttonText: 'update'.tr,
                                                    buttonColor:
                                                        CustomTheme.blackColor,
                                                    onTap: () {
                                                      // if (controller
                                                      //     .selectedActivitCoreIDList
                                                      //     .isEmpty) {
                                                      //   Constant.showSnackBar(
                                                      //       'Error',
                                                      //       'Please select at least one Activity Core');
                                                      //   return;
                                                      // }
                                                      // if (SessionController()
                                                      //             .lat ==
                                                      //         0.0 ||
                                                      //     SessionController()
                                                      //             .lon ==
                                                      //         0.0) {
                                                      //   Constant.showSnackBar(
                                                      //       'Error',
                                                      //       'Please select  your shop location');
                                                      //   return;
                                                      // }
                                                      if (controller
                                                          .selectedActivitCoreIDList
                                                          .isEmpty) {
                                                        controller
                                                                .activityCoreError
                                                                .value =
                                                            'pleaseSelectAtleastOneActivityCore'
                                                                .tr;
                                                        return;
                                                      }
                                                      if (controller
                                                          .addedServiceSelected
                                                          .isEmpty) {
                                                        controller
                                                                .yourServiceError
                                                                .value =
                                                            'pleaseSelectorADDAtlEaseOneService'
                                                                .tr;
                                                        // Constant.showSnackBar(
                                                        //     'Error',
                                                        //     'Please select at least one Activity Core');
                                                        return;
                                                      }
                                                      if (SessionController()
                                                                  .lat ==
                                                              0.0 ||
                                                          SessionController()
                                                                  .lon ==
                                                              0.0) {
                                                        // Constant.showSnackBar(
                                                        //     'Error',
                                                        //     'Please select  your shop location');
                                                        controller.locationError
                                                                .value =
                                                            'pleaseSelectYourShopLocation'
                                                                .tr;
                                                        return;
                                                      }
                                                      var activtyCoreListString =
                                                          controller
                                                              .selectedActivitCoreIDList
                                                              .reduce((value,
                                                                      element) =>
                                                                  '$value,$element');
                                                      var addServicesListString =
                                                          controller
                                                              .addedServiceSelected
                                                              .reduce((value,
                                                                      element) =>
                                                                  '$value,$element');
                                                      var imagesString = '';
                                                      if (controller.imageUrl
                                                          .isNotEmpty) {
                                                        imagesString = controller
                                                            .imageUrl
                                                            .reduce((value,
                                                                    element) =>
                                                                '$value,$element');
                                                      }
                                                      // var imagesString = controller
                                                      //     .imageUrl
                                                      //     .reduce((value,
                                                      //             element) =>
                                                      //         '$value,$element');

                                                      Map data = {
                                                        "coreActivitiesIds":
                                                            activtyCoreListString,
                                                        "servicesIds":
                                                            addServicesListString,
                                                        "imageUrlsIds":
                                                            imagesString,
                                                        "location":
                                                            '${SessionController().lat},${SessionController().lon}',
                                                        "bio": controller
                                                            .bioController.text
                                                      };
                                                      // controller.updateShop(
                                                      //     data,
                                                      //     SessionController()
                                                      //             .user
                                                      //             .data!
                                                      //             .shops?[0]
                                                      //             .sId ??
                                                      //         "",
                                                      //     'ShopDetail',
                                                      //     context);
                                                    },
                                                    textColor:
                                                        CustomTheme.whiteColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.035,
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
                          Obx((() => Padding(
                                padding: EdgeInsets.only(
                                  top: Get.height * 0.15,
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: Get.height * 0.1,
                                    width: Get.height * 0.1,
                                    child: CircleAvatar(
                                        radius: 55,
                                        backgroundColor: Colors.grey.shade300,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(55),
                                          child: Image.network(
                                            controller
                                                .imageFilePathForProfile.value,
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
                                                      const Icon(Icons.person));
                                            },
                                            height: Get.height * 0.1,
                                            width: Get.height * 0.1,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ),
                                ),
                              )))
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.002,
                      ),
                    ],
                  );
                }),
                isImageShow == true
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            isImageShow = false;
                          });
                        }, //1122
                        child: Center(
                          child: Container(
                            height: Get.height * 0.999,
                            width: Get.width * 0.999,
                            color: Colors.black.withOpacity(0.8),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isImageShow = false;
                                });
                              },
                              child: Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  controller.imageUrl.toSet().toList();
                                  final image = controller.imageUrl[index];
                                  return Center(
                                    child: Image.network(
                                      controller.imageUrl
                                              .toSet()
                                              .toList()
                                              .isEmpty
                                          ? ""
                                          : image,
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
                                            child: const Icon(Icons.error));
                                      },
                                      height: 300,
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                },
                                itemCount:
                                    controller.imageUrl.toSet().toList().length,
                                pagination: const SwiperControl(),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Get from gallery
  Future _getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      controller.imageFile = pickedFile!;
      controller.updateProfileImage();
      (context as Element).markNeedsBuild();
    });
  }
}

// days
List<Widget> generateChildOfActivityCore(RxList selectedCoreActivity,
    BuildContext context, CreateShopController controller) {
  List<Widget> items = [];
  for (int i = 0; i < selectedCoreActivity.length; i++) {
    items.add(generateItemOfActivityCore(i, context, controller));
  }
  return items;
}

// days
Widget generateItemOfActivityCore(
    int index, BuildContext context, CreateShopController controller) {
  return FittedBox(
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.01, vertical: Get.height * 0.002),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: CustomTheme.greyColor),
          ),
          child: Row(
            children: [
              Text(
                controller.selectedActivitCoreList[index].servicename,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontFamily: Constant.montserratMedium,
                    color: CustomTheme.darkFonts),
              ),
              SizedBox(
                width: Get.width * 0.002,
              ),
              InkWell(
                onTap: () {
                  controller.selectedActivitCoreList.removeAt(index);
                  controller.yourSearchServiceListModel.clear();
                },
                child: const Icon(
                  Icons.cancel,
                  size: 15,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

void modalBottomSheetMenu(BuildContext context, CreateShopController controller,
    String id, bool isAdd, ServiceId) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        // main container and its height
        return SingleChildScrollView(
          child: Obx(() {
            return Container(
              height: Get.height * 0.7,
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
                child: ListView(
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: Get.width * 0.3, right: Get.width * 0.3),
                      height: 3,
                      color: CustomTheme.blackColor,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    TitleText(
                        title: controller.isEditServide.value
                            ? 'updateService'.tr
                            : 'addNewService'.tr),
                    SizedBox(
                      height: Get.height * 0.07,
                    ),
                    // service name
                    Text(
                      isImportant == true ? 'serviceName *' : 'serviceName'.tr,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: Constant.montserratRegular,
                            color: CustomTheme.color232F34,
                          ),
                    ),
                    // service name
                    TextFormField(
                      controller: controller.serviceNameController,
                      cursorColor: CustomTheme.greyColor,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (String val) {
                        if (val.isNotEmpty) {
                          controller.serviceNameError.value = '';
                        }
                      },
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontFamily: Constant.montserratMedium,
                            color: CustomTheme.color232F34,
                          ),
                    ),
                    // StringTextFieldWidget(
                    //   controller: controller.serviceNameController,
                    //   title: 'serviceName'.tr,
                    //   isImportant: true,
                    //   onChange: (String val) {
                    //     if (val.isNotEmpty) {
                    //       controller.serviceNameError.value = '';
                    //     }
                    //   },
                    // ),
                    Divider(
                      height: Get.height * 0.0007,
                      color: controller.serviceNameError.value != ''
                          ? CustomTheme.redColor
                          : CustomTheme.darkFonts.withOpacity(0.5),
                    ),
                    controller.serviceNameError.value != ''
                        ? StringErrorWidget(
                            error: controller.serviceNameError.value)
                        : SizedBox(
                            height: Get.height * 0.035,
                          ),
                    // Service Price
                    StringTextFieldWidget(
                        controller: controller.priceController,
                        title: 'servicePrice'.tr,
                        isImportant: true,
                        onChange: (String val) {
                          if (val.isNotEmpty) {
                            controller.priceError.value = '';
                          }
                        },
                        keyboard: TextInputType.phone),
                    Divider(
                      height: Get.height * 0.0007,
                      color: controller.priceError.value != ''
                          ? CustomTheme.redColor
                          : CustomTheme.darkFonts.withOpacity(0.5),
                    ),
                    controller.priceError.value != ''
                        ? StringErrorWidget(error: controller.priceError.value)
                        : SizedBox(
                            height: Get.height * 0.035,
                          ),
                    // change service price
                    Text(
                      'chooseServicePlace1'.tr,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: Constant.montserratRegular,
                            color: CustomTheme.darkFonts.withOpacity(0.7),
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Obx(() {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // controller.chooseServiceType.value =
                              //     'shopService'.tr;
                              controller.shopService.value =
                                  !controller.shopService.value;
                            },
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: controller.shopService.value
                                        ? Colors.black87
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    // border: Border.all(
                                    //   width: 1,
                                    //   color: controller.shopService.value
                                    //       ? Colors.black87
                                    //       : Colors.transparent,
                                    // )
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            'shopService'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                  fontFamily: Constant.montserratRegular,
                                  color: CustomTheme.darkFonts.withOpacity(0.7),
                                ),
                          ),
                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                          InkWell(
                            onTap: () {
                              // controller.chooseServiceType.value =
                              //     'homeService'.tr;
                              controller.homeService.value =
                                  !controller.homeService.value;
                            },
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: controller.homeService.value
                                        ? Colors.black87
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(60),
                                    // border: Border.all(
                                    //   width: 1,
                                    //   color: controller.homeService.value
                                    //       ? Colors.black87
                                    //       : Colors.transparent,
                                    // )
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            'homeService'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                  fontFamily: Constant.montserratRegular,
                                  color: CustomTheme.darkFonts.withOpacity(0.7),
                                ),
                          ),
                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Row(
                      children: [
                        KAppButton(
                          buttonText: controller.isEditServide.value
                              ? '  ${'update'.tr}  '
                              : '  ${'add'.tr}  ',
                          buttonColor: Colors.black,
                          onTap: () async {
                            print(" sadasd $ServiceId");
                            controller.shopService.value == true &&
                                    controller.homeService.value == true
                                ? controller.chooseServiceType.value =
                                    "bothService"
                                : controller.shopService.value == true
                                    ? controller.chooseServiceType.value =
                                        "shopService"
                                    : controller.homeService.value == true
                                        ? controller.chooseServiceType.value =
                                            "homeService"
                                        : controller.chooseServiceType.value;
                            if (controller.isEditServide.value) {
                              if (controller.serviceNameController.text == '') {
                                controller.serviceNameError.value =
                                    'pleaseEnterServiceName'.tr;
                                return;
                              }
                              if (controller.priceController.text == '') {
                                controller.priceError.value =
                                    'pleaseEnterServicePrice'.tr;
                                return;
                              }
                              await controller.updateServiceFunc(
                                  context, controller.serviceID,ServiceId);
                            } else {
                              if (controller.serviceNameController.text == '') {
                                controller.serviceNameError.value =
                                    'pleaseEnterServiceName'.tr;
                                return;
                              }
                              if (controller.priceController.text == '') {
                                controller.priceError.value =
                                    'pleaseEnterServicePrice'.tr;
                                return;
                              }
                              if (isAdd) {
                                await controller.addNewServiceFunc(context);
                                if (controller.isAddServiceError.value) {
                                } else {
                                  // ignore: use_build_context_synchronously
                                  _showDialog(context, controller,
                                      controller.addedServiceIed, isAdd);
                                }
                              } else {
                                _showDialog(context, controller, id, isAdd);
                              }
                            }
                          },
                          textColor: Colors.white,
                          width: 0.4,
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        KAppButton(
                          buttonText: '  ${'cancel'.tr}  ',
                          buttonColor: Colors.grey.withOpacity(0.7),
                          onTap: () {
                            controller.isEditServide.value = false;
                            Navigator.of(context).pop();
                          },
                          textColor: Colors.black,
                          width: 0.4,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      });
}

_showDialog(BuildContext context, CreateShopController controller, String id,
    bool isServiceAdded) {
  showDialog(
    context: context,
    builder: (BuildContext context1) {
      return AlertDialog(
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('successfullyAdded'.tr,
                maxLines: null,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: Constant.montserratSemiBold,
                    fontSize: 23,
                    color: CustomTheme.color232F34)),
          ),
        )),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: StringWidget(
                title: 'successfullyAddedYourServiceInformation'.tr,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            KAppButton(
              buttonText: 'ok'.tr,
              buttonColor: CustomTheme.blackColor,
              onTap: () {
                controller.addedService.add(Service(
                  controller.serviceNameController.text,
                  controller.priceController.text,
                  controller.shopService.value == true &&
                          controller.homeService.value == true
                      ? controller.chooseServiceType.value = "bothService"
                      : controller.shopService.value == true
                          ? controller.chooseServiceType.value = "shopService"
                          : controller.homeService.value == true
                              ? controller.chooseServiceType.value =
                                  "homeService"
                              : controller.chooseServiceType.value,
                  id,
                  '',
                ));
                controller.addedServiceForColor
                    .add(controller.serviceNameController.text);
                controller.addedServiceSelected.add(id);

                Navigator.of(context).pop();
                Navigator.of(context).pop();
                controller.isYourService.value = false;
                controller.isYourAddedService.value = true;
              },
              textColor: CustomTheme.whiteColor,
            )
          ],
        ),
      );
    },
  );
}

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            fontFamily: Constant.montserratRegular,
            color: CustomTheme.darkFonts.withOpacity(0.7),
          ),
    );
  }
}
