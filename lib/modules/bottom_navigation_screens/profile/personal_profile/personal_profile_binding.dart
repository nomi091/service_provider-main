// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/profile/personal_profile/personal_profile_controller.dart';

class PersonalProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalProfileController());
  }
}
