// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  RxBool isSwitchedFastTrack = false.obs;
  RxBool isEnglishLanguage = true.obs;
  @override
  void onInit() {
    super.onInit();
    setPrefValue();
  }

  Future<void> setPrefValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    SessionController().language = prefs.getString('language') ?? "en";
    if (SessionController().language == 'en') {
      isEnglishLanguage.value = true;
    } else {
      isEnglishLanguage.value = false;
    }
    isSwitchedFastTrack.value = prefs.getBool('isSwitchedFastTrack') ?? false;
  }
}
