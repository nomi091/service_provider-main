import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/models/user_model.dart';
import 'package:service_provider/data/response/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

//singleton class
class SessionController {
  static final SessionController _session = SessionController._internel();

  bool? isLogin;
  RxBool isSwitchedFastTrack = false.obs;
  late User user;
  String? token;
  String? profileImg;
  String? emailForVerifyAccount;
  String? passwordForVerifyAccount;
  String? selectedLocation;
  double lat = 0.0;
  double lon = 0.0;
  String language = 'en';

  factory SessionController() {
    return _session;
  }
  SessionController._internel() {
    // here we can initialize the values
    isLogin = false;
  }

  // saving data into shared prefrences
  static Future<void> saveUserInPreference(
    dynamic user,
  ) async {
    SharedPreferenceClass.setValueBoolen('isLogin', true);
    SharedPreferenceClass.setValue('user', jsonEncode(user));
  }

  static Future<void> saveRefreshSessionTokens(var user) async {
    // SharedPreferenceClass.setValueBoolen('isLogin', true);
    SharedPreferenceClass.setValue('user', user);
  }

  //getting User Data from shared Prefrence
  static Future<void> getUserFromPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      dynamic userData = prefs.getString("user")!;
      if (userData.isNotEmpty) {
        SessionController().user = User.fromJson(jsonDecode(userData));
        SessionController().isLogin = prefs.getBool('isLogin');
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //removing User Data from Prefrence
  static Future<void> removeUserFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', '');
    prefs.setBool('isLogin', false);
  }
}
