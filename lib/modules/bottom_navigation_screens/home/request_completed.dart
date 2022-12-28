import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/modules/bottom_navigation_screens/home/detail/pending_details.dart';
import 'package:service_provider/modules/bottom_navigation_screens/my_request/my_request_main_controller.dart';
// import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/my_request_widget.dart';

class RequestCompletedPage extends GetWidget<MyRequestController> {
  const RequestCompletedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomTheme.whiteColor.withOpacity(0.9),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(
          top: 20,
          left: Constant.pagePadding - Get.width * 0.05,
          right: Constant.pagePadding - Get.width * 0.05,
        ),
        child: ListView.builder(
          itemCount: 1,
          padding: EdgeInsets.zero,
          itemBuilder: (context, element) {
            return InkWell(
                onTap: () {
                  Get.to(() => const PendingDetailView(
                        screenName: 'Completed',
                      ));
                },
                child: MyRequestWidget(
                    controller: controller, status: 'Completed'));
          },
        ),
      ),
    );
  }
}
