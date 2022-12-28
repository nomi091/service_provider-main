import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/detail/pending_detail_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/image_preview.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class PendingDetailView extends StatefulWidget {
  final String screenName;
  const PendingDetailView({Key? key, required this.screenName})
      : super(key: key);

  @override
  State<PendingDetailView> createState() => _PendingDetailViewState();
}

class _PendingDetailViewState extends State<PendingDetailView> {
  var list = ['Pending', 'Com', 'hhh'];
  double customHeight = 0.033;
  PendingDetailController controller = Get.put(PendingDetailController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        customHeight = 0.033;
        return true;
      },
      child: Scaffold(
        backgroundColor: CustomTheme.appBarbackGround,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: CustomTheme.color232F34),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Get.height * 0.05),
                      SizedBox(
                        width: width * 0.85,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: CustomTheme.colorF7F7F7,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'Ammar Bakheit',
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      fontFamily: Constant.montserratSemiBold,
                                      color: CustomTheme.colorF7F7F7,
                                    ),
                          )),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: width * 0.85,
                          child: ReuseableIconWithTextWidget(
                              image: Constant.phoneIcon,
                              text: '+971505050505')),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: width * 0.85,
                          child: ReuseableIconWithTextWidget(
                              image: Constant.emailIcon,
                              text: '+ammar.bakheit@gmail.com')),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: width * 0.85,
                          child: ReuseableIconWithTextWidget(
                              image: Constant.locationIconn,
                              text: '+Al-Nahda St. Dubai, UAE')),
                      const SizedBox(height: 10),
                      const Spacer(),
                      Stack(clipBehavior: Clip.none, children: [
                        Container(
                          height: height * 0.65,
                          width: width,
                          decoration: BoxDecoration(
                            color: CustomTheme.whiteColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              topRight: Radius.circular(18.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'carDetails'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratSemiBold,
                                            color: CustomTheme.color232F34,
                                          ),
                                    )),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: width * 0.85,
                                  child: Row(
                                    children: [
                                      ReusebaleCarDetailContainerWithImageAndTextWidget(
                                        image: Constant.brandIcon,
                                        text: 'Hyundai',
                                        width: width,
                                      ),
                                      const Spacer(),
                                      ReusebaleCarDetailContainerWithImageAndTextWidget(
                                        image: Constant.carIcon,
                                        text: 'Sonata - E45632',
                                        width: width,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: width * 0.85,
                                  child: Row(
                                    children: [
                                      ReusebaleCarDetailContainerWithImageAndTextWidget(
                                        image: Constant.gear,
                                        text: 'Automatic',
                                        width: width,
                                      ),
                                      const Spacer(),
                                      ReusebaleCarDetailContainerWithImageAndTextWidget(
                                        image: Constant.calenderIcon,
                                        text: '2020',
                                        width: width,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 25),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'serviceDetails'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratSemiBold,
                                            color: CustomTheme.color232F34,
                                          ),
                                    )),
                                const SizedBox(height: 10),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'serviceName'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratMedium,
                                            color: CustomTheme.colorC7001E,
                                          ),
                                    )),
                                const SizedBox(height: 5),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'Maintenance.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratMedium,
                                            color: CustomTheme.color232F34,
                                          ),
                                    )),
                                const SizedBox(height: 10),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'serviceType'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratMedium,
                                            color: CustomTheme.colorC7001E,
                                          ),
                                    )),
                                const SizedBox(height: 5),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'Mechanical Maintenance.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratMedium,
                                            color: CustomTheme.color232F34,
                                          ),
                                    )),
                                const SizedBox(height: 10),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'description'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratMedium,
                                            color: CustomTheme.colorC7001E,
                                          ),
                                    )),
                                const SizedBox(height: 5),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'My car has a metallic grinding coming from the left rear when I press the brake.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratMedium,
                                            color: CustomTheme.color232F34,
                                          ),
                                    )),
                                const SizedBox(height: 10),
                                SizedBox(
                                    width: width * 0.85,
                                    child: Text(
                                      'attachedPicture'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            fontFamily:
                                                Constant.montserratMedium,
                                            color: CustomTheme.colorC7001E,
                                          ),
                                    )),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => ImagePreviewHome(
                                          image: Constant.faultyImage,
                                          imageUrl: '',
                                        ));
                                  },
                                  child: SizedBox(
                                    width: width * 0.85,
                                    child: Row(
                                      children: [
                                        Image.asset(Constant.faultyImage),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      controller.isCall = true;
                                    });
                                  },
                                  child: SizedBox(
                                    width: width * 0.9,
                                    child: KAppButton(
                                        buttonText: 'contactNow'.tr,
                                        buttonColor: CustomTheme.color232F34,
                                        textColor: CustomTheme.whiteColor,
                                        onTap: () {
                                          setState(() {
                                            controller.isCall = true;
                                          });
                                        }),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: -Get.height * 0.07,
                          child: Image.asset(
                            Constant.whiteCarImage,
                            width: 194,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ]),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: Get.height * 0.05),
                      Align(
                        alignment: SessionController().language == 'en'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: Get.width * 0.7,
                          margin: EdgeInsets.only(
                              left: SessionController().language == 'en'
                                  ? width / 2
                                  : 0,
                              right: SessionController().language != 'en'
                                  ? width / 1.8
                                  : 0),
                          child: InkWell(
                            onTap: () {
                              if (customHeight == 0.033) {
                                setState(() {
                                  customHeight = 0.18;
                                });
                              } else {
                                setState(() {
                                  customHeight = 0.033;
                                });
                              }
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: Get.width * 0.35,
                                height: Get.height * customHeight,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  // color: Colors.black.withOpacity(0.7),
                                  color: CustomTheme.color232F34,
                                  border:
                                      Border.all(width: 2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: customHeight == 0.033
                                    ? Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                              width: Get.width * 0.26,
                                              child: Text(widget.screenName,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: Constant
                                                          .montserratMedium,
                                                      fontSize: 15,
                                                      color: CustomTheme
                                                          .colorF7F7F7))),
                                          const Spacer(),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Center(
                                              child: Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color: CustomTheme.colorF7F7F7,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                  width: Get.width * 0.26,
                                                  child: Text(widget.screenName,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontFamily: Constant
                                                              .montserratMedium,
                                                          fontSize: 15,
                                                          color: CustomTheme
                                                              .colorF7F7F7))),
                                              const Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color:
                                                        CustomTheme.colorF7F7F7,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.grey,
                                          ),
                                          widget.screenName == 'newRequest'.tr
                                              ? const SizedBox()
                                              : InkWell(
                                                  onTap: () {
                                                    debugPrint('newRequest'.tr);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.26,
                                                          child: Text(
                                                              'newRequest'.tr,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratMedium,
                                                                  fontSize: 14,
                                                                  color: CustomTheme
                                                                      .colorF7F7F7))),
                                                      const Spacer(),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down_sharp,
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                          widget.screenName == 'accepted'.tr
                                              ? const SizedBox()
                                              : InkWell(
                                                  onTap: () {
                                                    debugPrint('accepted'.tr);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.26,
                                                          child: Text(
                                                              'accepted'.tr,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratMedium,
                                                                  fontSize: 15,
                                                                  color: CustomTheme
                                                                      .colorF7F7F7))),
                                                      const Spacer(),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down_sharp,
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                          widget.screenName == 'inProgress'.tr
                                              ? const SizedBox()
                                              : InkWell(
                                                  onTap: () {
                                                    debugPrint('Progress');
                                                  },
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.26,
                                                          child: Text(
                                                              'inProgress'.tr,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratMedium,
                                                                  fontSize: 15,
                                                                  color: CustomTheme
                                                                      .colorF7F7F7))),
                                                      const Spacer(),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down_sharp,
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                          widget.screenName == 'pending'.tr
                                              ? const SizedBox()
                                              : InkWell(
                                                  onTap: () {
                                                    debugPrint('pending'.tr);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.26,
                                                          child: Text(
                                                              'pending'.tr,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratMedium,
                                                                  fontSize: 15,
                                                                  color: CustomTheme
                                                                      .colorF7F7F7))),
                                                      const Spacer(),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down_sharp,
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                          widget.screenName == 'completed'.tr
                                              ? const SizedBox()
                                              : InkWell(
                                                  onTap: () {
                                                    debugPrint('completed'.tr);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.2,
                                                          child: Text(
                                                              'completed'.tr,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      Constant
                                                                          .montserratMedium,
                                                                  fontSize: 15,
                                                                  color: CustomTheme
                                                                      .colorF7F7F7))),
                                                      const Spacer(),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .arrow_drop_down_sharp,
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                        ],
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            controller.isCall == true
                ? InkWell(
                    onTap: () {
                      setState(() {
                        controller.isCall = false;
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: CustomTheme.blackColor.withOpacity(0.55),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: height / 3.5,
                            width: width * 0.95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(children: [
                              Container(
                                height: 80,
                                width: width * 0.95,
                                decoration: BoxDecoration(
                                  color: CustomTheme.color232F34,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: SizedBox(
                                        width: Get.width * 0.2,
                                        child: Text('contactVia'.tr,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontFamily:
                                                    Constant.montserratMedium,
                                                fontSize: 15,
                                                color:
                                                    CustomTheme.colorF7F7F7))),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: (){
                                  UrlLauncher.launch("tel://214324234");
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      Icons.phone,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'phoneCall'.tr,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            fontFamily: Constant.montserratMedium,
                                            color: CustomTheme.color232F34,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Icon(
                                    Icons.chat,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'liveChat'.tr,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          fontFamily: Constant.montserratMedium,
                                          color: CustomTheme.color232F34,
                                        ),
                                  )
                                ],
                              ),
                               const SizedBox(
                                height: 40,
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class ReusebaleCarDetailContainerWithImageAndTextWidget
    extends StatelessWidget {
  final String image, text;
  final double width;
  const ReusebaleCarDetailContainerWithImageAndTextWidget({
    Key? key,
    required this.image,
    required this.text,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: 80,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: CustomTheme.whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CustomTheme.color232F34.withOpacity(0.15),
            offset: const Offset(1.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Image.asset(image, width: 30, height: 30),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width * 0.34,
              child: Text(text,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: Constant.montserratSemiBold,
                      fontSize: 15,
                      color: CustomTheme.color232F34)),
            ),
          ]),
    );
  }
}

class ReuseableIconWithTextWidget extends StatelessWidget {
  final String text, image;
  const ReuseableIconWithTextWidget({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        image,
        width: 20,
        height: 15,
      ),
      SizedBox(
        width: Get.width * 0.02,
      ),
      Text(text,
          style: TextStyle(
              fontFamily: Constant.montserratMedium,
              fontSize: 15,
              color: CustomTheme.colorF7F7F7))
    ]);
  }
}
