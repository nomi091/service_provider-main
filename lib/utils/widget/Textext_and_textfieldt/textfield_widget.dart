import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

class StringTextFieldWidget extends StatelessWidget {
  const StringTextFieldWidget({
    Key? key,
    required this.title,
    required this.controller,
    this.isImportant = false,
    required this.onChange,
    this.isEnabale = true,
    this.isPDF = false,
    this.keyboard = TextInputType.emailAddress,
    this.suffixIconOnTap,
  }) : super(key: key);
  final String title;
  final bool? isImportant;
  final bool? isEnabale;
  final bool? isPDF;
  final TextEditingController controller;
  final Function(String val) onChange;
  final Function()? suffixIconOnTap;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          isImportant == true ? '$title *' : title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontFamily: Constant.montserratRegular,
                color: CustomTheme.color232F34,
              ),
        ),

        SizedBox(
          // height: Get.height * 0.035,
          child: isPDF == true
              ? Row(
                  children: [
                    SizedBox(
                      height: Get.height * 0.035,
                      width: controller.text == 'Not Uploaded'
                          ? 0
                          : Get.width * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: controller.text == 'Not Uploaded'
                            ? const SizedBox()
                            : Image.asset(Constant.pdfPrefix),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: TextFormField(
                        controller: controller,
                        enabled: isEnabale,
                        cursorColor: CustomTheme.greyColor,
                        keyboardType: keyboard,
                        onChanged: onChange,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontFamily: Constant.montserratMedium,
                              color: CustomTheme.color232F34,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: suffixIconOnTap,
                      child: Container(
                          padding: const EdgeInsets.only(top: 3),
                          child: controller.text == 'Not Uploaded'
                              ? const SizedBox()
                              : const Icon(
                                  Icons.cancel,
                                  size: 15,
                                )),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: Get.height * 0.035,
                      width: Get.width * 0.1,
                      child: Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.12),
                        child: Image.asset(
                          Constant.pdfPost,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                )
              : title == 'Comercial Licence'
                  ? Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            enabled: isEnabale,
                            cursorColor: CustomTheme.greyColor,
                            keyboardType: keyboard,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: onChange,
                            // text style
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontFamily: Constant.montserratMedium,
                                      color: CustomTheme.color232F34,
                                    ),
                          ),
                        ),
                        SizedBox(
                          // height: Get.height * 0.035,
                          // width: Get.width * 0.1,
                          child: Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.12),
                            child: Image.asset(
                              Constant.pdfPost,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  : TextFormField(
                      controller: controller,
                      enabled: isEnabale,
                      cursorColor: CustomTheme.greyColor,
                      keyboardType: keyboard,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: onChange,
                      // text style
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontFamily: Constant.montserratMedium,
                            color: CustomTheme.color232F34,
                          ),
                    ),
        ),
      ],
    );
  }
}

// Email
class EmailTextFieldWidget extends StatelessWidget {
  const EmailTextFieldWidget({
    Key? key,
    required this.title,
    required this.controller,
    this.isImportant = false,
    required this.onChange,
  }) : super(key: key);
  final String title;
  final bool? isImportant;
  final TextEditingController controller;
  final Function(String val) onChange;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          isImportant == true ? '$title *' : title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontFamily: Constant.montserratRegular,
                color: CustomTheme.color232F34,
              ),
        ),
        SizedBox(
          // height: Get.height * 0.035,
          child: TextFormField(
            controller: controller,
            cursorColor: CustomTheme.greyColor,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: onChange,
            // text style
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontFamily: Constant.montserratMedium,
                  color: CustomTheme.color232F34,
                ),
          ),
        ),
      ],
    );
  }
}

// Password and confirm password
class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    Key? key,
    required this.title,
    required this.controller,
    this.isImportant = false,
    this.validator,
    required this.isObscureText,
    required this.onTap,
    required this.onChange,
  }) : super(key: key);
  final String title;
  final bool isImportant;
  final RxBool isObscureText;
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final Function(String val) onChange;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          isImportant == true ? '$title *' : title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontFamily: Constant.montserratRegular,
                color: CustomTheme.darkFonts.withOpacity(0.7),
              ),
        ),
        SizedBox(
          height: Get.height * 0.035,
          child: TextFormField(
            controller: controller,
            obscureText: isObscureText.value,
            cursorColor: CustomTheme.greyColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.02),
                  child: Icon(
                    isObscureText.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: CustomTheme.greyColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            onChanged: onChange,
            // text style
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontFamily: Constant.montserratRegular,
                  color: CustomTheme.darkFonts,
                ),
            // validator
            validator: validator,
          ),
        ),
      ],
    );
  }
}
