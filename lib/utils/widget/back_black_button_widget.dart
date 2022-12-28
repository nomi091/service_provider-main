import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/utils/constant/contant.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: SizedBox(
          height: Get.height * 0.02,
          width: Get.width * 0.06,
          child: Image.asset(
            Constant.backArrow,
            fit: BoxFit.fill,
          )),
    );
  }
}
