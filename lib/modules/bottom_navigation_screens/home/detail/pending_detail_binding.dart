// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/detail/pending_detail_controller.dart';

class PendingDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PendingDetailController());
  }
}
