// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';

class CustomALertDialog {
  static flutterAlertSucess(String desc, BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      // title: “RFLUTTE”,
      desc: desc,
      style: AlertStyle(
          descStyle: TextStyle(
              fontFamily: Constant.montserratMedium,
              fontSize: 20,
              color: CustomTheme.color0B1E26)),
      buttons: [
        DialogButton(
          child: Text(
            'OK',
            style: TextStyle(
                color: CustomTheme.whiteColor,
                fontFamily: Constant.montserratMedium,
                fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          width: MediaQuery.of(context).size.width * 0.4,
          color: CustomTheme.color0B1E26,
          radius: const BorderRadius.all(Radius.circular(10)),
        )
      ],
    ).show();
  }

  static flutterAlertError(String desc, BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      // title: “RFLUTTE”,
      desc: desc,
      style: AlertStyle(
          descStyle: TextStyle(
              fontFamily: Constant.montserratMedium,
              fontSize: 20,
              color: CustomTheme.color0B1E26)),
      buttons: [
        DialogButton(
          child: Text(
            'Ok',
            style: TextStyle(
                color: CustomTheme.whiteColor,
                fontFamily: Constant.montserratMedium,
                fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          width: MediaQuery.of(context).size.width * 0.4,
          color: CustomTheme.color2242BC,
          radius: const BorderRadius.all(Radius.circular(10)),
        )
      ],
    ).show();
  }

  static flutterAlertSucessWithNavigation(String desc, BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      // title: “RFLUTTE”,
      desc: desc,
      style: AlertStyle(
          descStyle: TextStyle(
              fontFamily: Constant.montserratMedium,
              fontSize: 20,
              color: CustomTheme.color0B1E26)),
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(
                color: CustomTheme.whiteColor,
                fontFamily: Constant.montserratMedium,
                fontSize: 18),
          ),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(
            // builder: (BuildContext context) => BottomNavigationScreen(tab: 0)));
          },
          width: MediaQuery.of(context).size.width * 0.4,
          color: CustomTheme.color2242BC,
          radius: const BorderRadius.all(Radius.circular(10)),
        )
      ],
    ).show();
  }
}
