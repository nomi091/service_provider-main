import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/home_controller.dart';

class MyRequestBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => HomeController());
  }
  
}