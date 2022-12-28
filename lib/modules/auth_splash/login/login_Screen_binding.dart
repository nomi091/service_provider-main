// ignore_for_file: file_names

import 'package:get/get.dart';
import 'login_Screen_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
