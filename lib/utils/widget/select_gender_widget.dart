import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    Key? key,
    required this.selectedGender,
    required this.onChanged,
  }) : super(key: key);

  final String selectedGender;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    String dropDownValue;
    // ignore: unnecessary_null_comparison
    if (selectedGender == null) {
      dropDownValue = 'male';
    } else {
      dropDownValue = selectedGender;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileHintTextWidget(
          hintText: 'gender'.tr,
        ),
        DropdownButtonFormField<String>(
          value: dropDownValue,
          hint: Text('select_gender'.tr,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontFamily: Constant.montserratRegular,
                  color: CustomTheme.darkFonts.withOpacity(0.4))),
          isExpanded: true,
          focusColor: Colors.transparent,
          iconEnabledColor: CustomTheme.blueColor,
          decoration: InputDecoration(
              isDense: true,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              prefixIconConstraints: BoxConstraints(
                  minWidth: Get.width * 0.07, minHeight: Get.width * 0.1),
              prefixIcon: UnconstrainedBox(
                child: Image.asset(
                  Constant.profileGenderIcon,
                  height: 17,
                  width: 14,
                ),
              )),
          onChanged: onChanged,
          items:
              Constant.genderList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value.tr,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontFamily: Constant.montserratRegular,
                    color: CustomTheme.darkFonts),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ProfileHintTextWidget extends StatelessWidget {
  const ProfileHintTextWidget({Key? key, required this.hintText})
      : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.065),
      child: Text(
        hintText,
        style: Theme.of(context).textTheme.headline6!.copyWith(
            fontFamily: Constant.montserratRegular,
            color: CustomTheme.darkFonts.withOpacity(0.4)),
      ),
    );
  }
}
