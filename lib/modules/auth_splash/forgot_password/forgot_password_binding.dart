// ignore_for_file: file_names

import 'package:get/get.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
