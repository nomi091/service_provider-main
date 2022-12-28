import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

class StringErrorWidget extends StatelessWidget {
  const StringErrorWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      child: Padding(
        padding:  EdgeInsets.only(top: 2, bottom: Get.height * 0.01),
        child: Text(
          error,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: Constant.montserratRegular,
                color: CustomTheme.redColor,
                fontWeight: FontWeight.w300,
              ),
        ),
      ),
    );
  }
}