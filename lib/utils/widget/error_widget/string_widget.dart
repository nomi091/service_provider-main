import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

class StringWidget extends StatelessWidget {
  const StringWidget({
    Key? key,
    required this.title,
    this.textAlign,
  }) : super(key: key);

  final String title;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      child: Padding(
        padding: EdgeInsets.only(top: 2, bottom: Get.height * 0.01),
        child: Text(
          title,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontFamily: Constant.montserratRegular,
                color: CustomTheme.color232F34,
              ),
        ),
      ),
    );
  }
}
