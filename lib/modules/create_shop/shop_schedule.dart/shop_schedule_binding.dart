// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:service_provider/modules/create_shop/shop_schedule.dart/shop_schedule_controller.dart';

class CreateShopScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateShopScheduleControllerN());
  }
}
