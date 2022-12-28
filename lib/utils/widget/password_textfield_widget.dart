import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

// ignore: must_be_immutable
class PasswordTextFieldWidget extends StatelessWidget {
  PasswordTextFieldWidget({
    Key? key,
    required this.isObsecure,
    required this.controller,
    required this.hintText,
    required this.onTap,
    this.validator,
    this.isBlack = false,
  }) : super(key: key);
  final RxBool isObsecure;
  final TextEditingController controller;
  final String hintText;
  final Function() onTap;
  String? Function(String? val)? validator;
  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        obscureText: isObsecure.value,

        controller: controller,
        style: Theme.of(context).textTheme.headline4!.copyWith(
            fontFamily: Constant.montserratRegular, color: CustomTheme.darkFonts),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: CustomTheme.darkFonts.withOpacity(0.8))),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: CustomTheme.greyColor)),
          prefixIcon: Icon(
            Icons.lock_outline_sharp,
            color: CustomTheme.blackColor.withOpacity(0.6),
            size: 20,
          ),
          border: const UnderlineInputBorder(),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                fontFamily: Constant.montserratRegular,
                color: CustomTheme.darkFonts.withOpacity(0.5),
              ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              isObsecure.value ? Icons.visibility_off : Icons.visibility,
              color: isBlack == true
                  ? CustomTheme.blackColor.withOpacity(0.6)
                  : CustomTheme.whiteColor,
              size: 20,
            ),
          ),
        ),
        validator: validator,
        // (value) {
        //   if (value == null || value.trim().toString().isEmpty) {
        //     return 'Please enter password';
        //   }
        //   if (value.length < 8) {
        //     return 'The password length should atleast 8';
        //   }
        //   return null;
        // },
      );
    });
  }
}
