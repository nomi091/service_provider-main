import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height * 0.020,
        left: Constant.pagePadding,
        right: Constant.pagePadding,
      ),
      child: SizedBox(
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  width: Get.width * 0.05,
                  height: Get.height * 0.05,
                  child: Image.asset(Constant.backArrowIcon),
                ),
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontFamily: Constant.montserratBold,
                    color: CustomTheme.darkFonts),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
