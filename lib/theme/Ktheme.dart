// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomTheme {
  // new
  static Color color232F34 = const Color(0xff232F34);

  ///
  static Color colorF7F7F7 = const Color(0xffF7F7F7);
  static Color primaryColor = const Color(0xffF5F5F5);
  static Color blueColor = const Color(0xff376AED);
  static Color blueColor1 = const Color(0xffE2F3F5);
  static Color lightBlueColor = const Color(0xffCDDBFF);
  static Color darkOrange = const Color(0xffFF6A3C);
  static Color darkOrange1 = const Color(0xffFEF6F8);
  static Color color0B1E26 = const Color(0xff0B1E26);
  static Color color2242BC = const Color(0xff2242BC);
  static Color darkFonts = const Color(0xff060C2F);
  static Color darkFonts1 = const Color(0xffC4BABD);
  static Color darkFonts2 = const Color(0xff212121);
  static Color orangeColor = const Color(0xffFF6A3C);
  static Color greyishColor = const Color(0xff151510);
  static Color greyTextColor = const Color(0xffBBADAD);
  static Color greyTextColor1 = const Color(0xffF4F4F6);
  static Color greyTextColor2 = const Color(0xff090A0A);
  static Color greyTextColor3 = const Color(0xffE9E9E9);
  static Color greyTextColor4 = const Color(0xff595085);
  static Color greyTextColor5 = const Color(0xff333333);
  static Color cardBackGround = const Color(0xffF3F7FA);
  static Color shimmerColor1 = const Color(0xffC4C4C4);
  static Color shimmerColor2 = const Color(0xffDADADA);
  static Color shimmerColor3 = const Color(0xffEFEFEF);
  static Color appBarbackGround = const Color(0xffF1F5F8);
  // static Color color232F34 = const Color(0xff232F34);
  static Color colorC7001E = const Color(0xffC7001E);
  static Color colorC9C9C9 = const Color(0xffC9C9C9);
  static Color colorD5A918 = const Color(0xffD5A918);
  static Color color19A84C = const Color(0xff19A84C);
  static Color color7E2242 = const Color(0xff7E2242);
  static Color color707070 = const Color(0xff707070);
  static Color colorC7CACB = const Color(0xffC7CACB);

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color redColor = Colors.red;
  static Color greyColor = Colors.grey.shade400;
  static Color transparent = Colors.transparent;
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 30),
        headline2: TextStyle(fontSize: 20), //new
        headline3: TextStyle(fontSize: 18),
        headline4: TextStyle(fontSize: 17), //new
        headline5: TextStyle(fontSize: 15), //new
        headline6: TextStyle(fontSize: 13), //new
        bodyText1: TextStyle(fontSize: 23), //new
        bodyText2: TextStyle(fontSize: 10),
      ),
    );
  }
}
