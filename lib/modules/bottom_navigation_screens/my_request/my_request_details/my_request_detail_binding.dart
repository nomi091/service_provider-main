// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/my_request/my_request_details/my_request_controller.dart';

class MyRequestDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyRequestDetailController());
  }
}
