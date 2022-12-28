// ignore_for_file: file_names

import 'package:get/get.dart';
import 'splash_Screen_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut(() => SplashController());
  }
}
