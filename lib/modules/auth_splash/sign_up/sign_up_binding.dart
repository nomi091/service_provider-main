// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:service_provider/modules/auth_splash/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
