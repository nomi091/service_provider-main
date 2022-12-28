import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppMethods {
  // get Age
  static String getUserAge(String birthDateString) {
    try {
      String datePattern = 'MMM/dd/yyyy';

      DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
      DateTime today = DateTime.now();

      int yearDiff = today.year - birthDate.year;
      return yearDiff.toString();
    } catch (e) {
      debugPrint("Error in getting Age from DOB : $e");
      return '';
    }
  }
}
