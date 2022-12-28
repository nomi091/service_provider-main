// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/setting.dart/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
