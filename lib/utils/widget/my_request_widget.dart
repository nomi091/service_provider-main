import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/my_request/my_request_main_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

class MyRequestWidget extends StatelessWidget {
  final String status;
  const MyRequestWidget({
    Key? key,
    required this.controller,
    required this.status,
  }) : super(key: key);

  final MyRequestController controller;

  @override
  Widget build(BuildContext context) {
 
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CustomTheme.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: Get.height * 0.18,
                  margin: EdgeInsets.only(top: Get.height * 0.038),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.centerRight,
                          image: AssetImage(Constant.backgroundimage1),
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.06),
                            BlendMode.modulate,
                          ))),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * 0.04,
                  padding: EdgeInsets.only(
                      left: Get.width * 0.04, right: Get.width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    color: CustomTheme.color232F34.withOpacity(0.1),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '15-10-2022   9:18 am',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontFamily: Constant.montserratMedium,
                              height: Get.height * 0.002,
                              color: CustomTheme.color232F34,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        status,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontFamily: Constant.montserratSemiBold,
                              height: Get.height * 0.002,
                              color: status == 'Pending'
                                  ? CustomTheme.colorC7001E
                                  : status == 'In Progress'
                                      ? CustomTheme.colorD5A918
                                      : CustomTheme.color19A84C,
                              // fontWeight: FontWeight.w500,
                            ),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: Get.width * 0.04,
                    right: Get.width * 0.04,
                    top: Get.height * 0.01,
                  ),
                  child: Text(
                    'Ammar Bakhat',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontFamily: Constant.montserratSemiBold,
                          color: CustomTheme.color232F34,
                        ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.013,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SessionController().language == 'en' ? 15 : 0,
                      right: SessionController().language != 'en' ? 15 : 0),
                  child: Container(
                    padding: EdgeInsets.only(
                        right: SessionController().language != 'en' ? 9 : 0),
                    height: Get.height * 0.13,
                    child: Row(
                      children: [
                        SizedBox(
                          width: SessionController().language == 'en'
                              ? Get.width * 0.03
                              : 0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.05,
                                  child: Image.asset(
                                    Constant.brandIcon,
                                    height: 17,
                                    width: 17,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: SizedBox(
                                    width: Get.width * 0.45,
                                    child: Text(
                                      'Hyundai',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratSemiBold,
                                            color: CustomTheme.color232F34,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.05,
                                  child: Image.asset(
                                    Constant.carIcon,
                                    height: 17,
                                    width: 17,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: SizedBox(
                                    width: Get.width * 0.45,
                                    child: Text(
                                      'Sonata',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratSemiBold,
                                            color: CustomTheme.color232F34,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.05,
                                  child: Image.asset(
                                    Constant.numerPlateIcon,
                                    height: 17,
                                    width: 17,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: SizedBox(
                                    width: Get.width * 0.45,
                                    child: Text(
                                      'E45632',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratSemiBold,
                                            color: CustomTheme.color232F34,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                  child: Image.asset(
                                    Constant.gear,
                                    height: 17,
                                    width: 17,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: SizedBox(
                                    width: Get.width * 0.45,
                                    child: Text(
                                      // space must ha before name
                                      ' '
                                      'Automatic',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratSemiBold,
                                            color: CustomTheme.color232F34,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: Get.height * 0.2,
                          width: Get.width * 0.26,
                          child: Image.asset(
                            status == 'Pending'
                                ? Constant.blackCarImage
                                : status == 'In Progress'
                                    ? Constant.blackCarImage
                                    : Constant.blackCarImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: Get.width * 0.02),
                      ],
                    ),
                  ),
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
