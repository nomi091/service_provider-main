import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/utils/constant/contant.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.onTap,
      required this.textColor,
      this.borderColor})
      : super(key: key);
  final String buttonText;
  final Color buttonColor;
  final Color? textColor, borderColor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.055,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontFamily: Constant.montserratMedium,
                  color: textColor,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

class KAppButton extends StatelessWidget {
  const KAppButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.onTap,
      required this.textColor,
      this.width = 0.0,
      this.borderColor})
      : super(key: key);
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Function() onTap;
  final double? width;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.055,
        width: width == 0.0 ? null : Get.width * width!,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor ?? buttonColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontFamily: Constant.montserratSemiBold,
                    color: textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class KAppButton1 extends StatelessWidget {
  const KAppButton1({
    Key? key,
    required this.buttonText,
    required this.buttonWidth,
    required this.buttonColor,
    required this.onTap,
    required this.textColor,
    required this.asset,
  }) : super(key: key);
  final String buttonText;
  final double buttonWidth;
  final Color buttonColor;
  final Color textColor;
  final String asset;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.068,
        width: Get.width * buttonWidth,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: Get.width * 0.08,
            ),
            Text(
              buttonText,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontFamily: Constant.montserratBold,
                  color: textColor,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            SizedBox(
                width: Get.width * 0.07,
                height: Get.height * 0.04,
                child: Image.asset(asset)),
            SizedBox(
              width: Get.width * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
