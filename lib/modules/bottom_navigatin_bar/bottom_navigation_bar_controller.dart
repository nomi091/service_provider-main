import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/utils/methods/get_user_location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationBarController extends GetxController {
  RxInt intialIndex = 0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  @override
  void onInit() {
    intialIndex.value = 0;
    super.onInit();
    getCurrentLocation();
    setPrefValue();
  }

  Future<void> setPrefValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    SessionController().isSwitchedFastTrack.value =
        prefs.getBool('isSwitchedFastTrack') ?? false;
  }

  Future getCurrentLocation() async {
    await UserCurrentLocation.determinePosition().then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      debugPrint('Latitude : $latitude');
      debugPrint('Longitude : $longitude');
      update();
    });
  }
}
