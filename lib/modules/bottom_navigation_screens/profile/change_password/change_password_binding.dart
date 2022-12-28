// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/change_password/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
