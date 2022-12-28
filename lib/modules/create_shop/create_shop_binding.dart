// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:service_provider/modules/create_shop/create_shop_controller.dart';

class CreateShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateShopController());
  }
}
