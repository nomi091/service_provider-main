import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeClass {
  static changeLanguseFunc(String languageCode) async {
    Locale local = Locale(languageCode);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', languageCode);
    SessionController().language = prefs.getString('language')??'en';
    await Get.updateLocale(local);
  }
}
