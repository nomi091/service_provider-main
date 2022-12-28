// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/create_shop/create_shop_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    authFunction();
    getIsFastTrack();
  }

  moveTowardLanguage() {
    Future.delayed(const Duration(milliseconds: 100));
    Get.offNamed(AppRoutes.selectLanguage);
  }

  getIsFastTrack() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    SessionController().isSwitchedFastTrack.value =
        prefs.getBool('isSwitchedFastTrack') ?? false;
  }
var UserID;
  Future<void> authFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserID = prefs.getString("UserID");
    // prefs.setString('language', languageCode);
    SessionController().language = prefs.getString('language') ?? 'en';
    if (kDebugMode) {
      print(SessionController().language);
    }
    await SessionController.getUserFromPreference().then((value) async {
      debugPrint('******************');
      debugPrint(SessionController().isLogin.toString());
      if (SessionController().isLogin == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await SessionController.getUserFromPreference();
        debugPrint('******************');
        debugPrint(SessionController()
            .user
            .data!
            .shops![0]
            .coreActivities!
            .isEmpty
            .toString());
        SessionController().token = prefs.getString('token');
        if (UserID==null) {
          CreateShopController controller = Get.put(CreateShopController());
          controller.screnName = 'Login';
          Get.offAllNamed(AppRoutes.createShop);
        } else {
          Get.offAllNamed(AppRoutes.bottomNavigationBar);
        }
      } else {
        Future.delayed(const Duration(seconds: 3)).then((value) {
          Get.offNamed(AppRoutes.loginScreen);
        });
      }
    });
  }
}
