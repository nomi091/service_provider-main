import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/detail/pending_details.dart';
import 'package:service_provider/modules/bottom_navigation_screens/image_preview.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';

class MyRequestDetailView extends StatefulWidget {
  const MyRequestDetailView({Key? key}) : super(key: key);

  @override
  State<MyRequestDetailView> createState() => _MyRequestDetailViewState();
}

class _MyRequestDetailViewState extends State<MyRequestDetailView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomTheme.appBarbackGround,
      appBar: AppBar(
        backgroundColor: CustomTheme.color232F34,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: CustomTheme.colorF7F7F7,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(color: CustomTheme.color232F34),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            SizedBox(
                width: width * 0.85,
                child: Text(
                  'Ammar Bakheit',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontFamily: Constant.montserratSemiBold,
                        color: CustomTheme.colorF7F7F7,
                      ),
                )),
            const SizedBox(height: 20),
            SizedBox(
                width: width * 0.85,
                child: ReuseableIconWithTextWidget(
                    image: Constant.phoneIcon, text: '+971505050505')),
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
                      const SizedBox(height: 60),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'carDetails'.tr,
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      fontFamily: Constant.montserratSemiBold,
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
                                width: width),
                            const Spacer(),
                            ReusebaleCarDetailContainerWithImageAndTextWidget(
                                image: Constant.carIcon,
                                text: 'Sonata - E45632',
                                width: width),
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
                                width: width),
                            const Spacer(),
                            ReusebaleCarDetailContainerWithImageAndTextWidget(
                                image: Constant.brandIcon,
                                text: '2020',
                                width: width),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'serviceDetails'.tr,
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      fontFamily: Constant.montserratSemiBold,
                                      color: CustomTheme.color232F34,
                                    ),
                          )),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'serviceName'.tr,
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: CustomTheme.colorC7001E,
                                    ),
                          )),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'Maintenance.',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: CustomTheme.color232F34,
                                    ),
                          )),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'serviceType'.tr,
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: CustomTheme.colorC7001E,
                                    ),
                          )),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'Mechanical Maintenance.',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: CustomTheme.color232F34,
                                    ),
                          )),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'description'.tr,
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: CustomTheme.colorC7001E,
                                    ),
                          )),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'My car has a metallic grinding coming from the left rear when I press the brake.',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: CustomTheme.color232F34,
                                    ),
                          )),
                      const SizedBox(height: 10),
                      SizedBox(
                          width: width * 0.85,
                          child: Text(
                            'attachedPicture'.tr,
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontFamily: Constant.montserratMedium,
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
                            children: [Image.asset(Constant.faultyImage)],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: width * 0.85,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.4,
                              child: KAppButton(
                                  buttonText: 'accept'.tr,
                                  buttonColor: CustomTheme.color232F34,
                                  textColor: CustomTheme.whiteColor,
                                  onTap: () {}),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: width * 0.4,
                              child: KAppButton(
                                  buttonText: 'reject'.tr,
                                  buttonColor: CustomTheme.whiteColor,
                                  textColor: CustomTheme.color232F34,
                                  borderColor: CustomTheme.color232F34,
                                  onTap: () {
                                    showDialogWithMultilineText(context);
                                  }),
                            ),
                          ],
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
      ),
    );
  }

  showDialogWithMultilineText(BuildContext context) {
    TextEditingController remarksController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  height: 135,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: CustomTheme.colorC9C9C9, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: remarksController,
                    decoration:  InputDecoration(
                        hintText: 'typeyourReason'.tr,
                        // hintStyle: TextStyle(
                        //   fontFamily: FontFamily.SofiaProRegular400,
                        //   fontSize: 15,
                        //   color: Constants.color0B1E26.withOpacity(0.60),
                        // ),
                        contentPadding:
                            const EdgeInsets.only(left: 15, top: 15, right: 15),
                        isDense: true,
                        border: InputBorder.none),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(),
                    const Spacer(),
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: KAppButton(
                          buttonText: 'send'.tr,
                          buttonColor: CustomTheme.color232F34,
                          textColor: CustomTheme.whiteColor,
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    ),
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
                  style: TextStyle(
                      fontFamily: Constant.montserratSemiBold,
                      fontSize: 15,
                      color: CustomTheme.color232F34)),
            ),
          ]),
    );
  }
}

// class ReuseableIconWithTextWidget extends StatelessWidget {
//   final String image, text;
//   const ReuseableIconWithTextWidget({
//     Key? key,
//     required this.image,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: [
//       Image.asset(
//         image,
//         width: 20,
//         height: 20,
//       ),
//       Text(text,
//           style: TextStyle(
//               fontFamily: Constant.montserratMedium,
//               fontSize: 15,
//               color: CustomTheme.colorF7F7F7))
//     ]);
//   }
// }
