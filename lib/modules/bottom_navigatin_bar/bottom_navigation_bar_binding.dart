import 'package:get/instance_manager.dart';
import 'package:service_provider/modules/bottom_navigatin_bar/bottom_navigation_bar_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/home_binding.dart';
import 'package:service_provider/modules/bottom_navigation_screens/my_request/my_request_main_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/profile_controller.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/setting_controller.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => MyRequestController());
    Get.lazyPut(() => HomeBinding());
    Get.lazyPut(() => ProfileController());
  }
}
