// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/models/activity_services_model.dart';
import 'package:service_provider/data/models/shop_detail_model.dart';
import 'package:service_provider/data/repositories/shop_repository.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/utils/constant/contant.dart';

class ShopDetailController extends GetxController {
  RxString locationError = ''.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  RxBool isMapSHow = false.obs;
  RxString imgError = ''.obs;
  RxString workedAndTimesError = ''.obs;
  RxString bioError = ''.obs;
  TextEditingController bioController = TextEditingController();
  // Core Activity
  RxBool isActivityCore = false.obs;
  RxString activityCoreError = ''.obs;
  ActivityServicesModel activitCoreList = ActivityServicesModel();

  RxBool isSelectedActivitCoreList = false.obs;
  // RxList selectedActivitCoreList=[].obs;
  List<Service1> selectedActivitCoreList = [];
  List<String> selectedActivitCoreIDList = [];
  // Your Service
  List<ActivityServicesModel> yourServiceList1 = [];
  List<Service1> yourServiceList = [];
  List<String> yourSearchServiceList = [];
  TextEditingController searchController = TextEditingController();
  RxBool isSearch = false.obs;
  RxBool isYourService = false.obs;
  RxString yourServiceError = ''.obs;
  // Add New Service
  TextEditingController serviceNameController = TextEditingController();
  RxString serviceNameError = ''.obs;
  TextEditingController priceController = TextEditingController();
  RxString priceError = ''.obs;
  RxString chooseServiceType = 'Shop Service'.obs;
  RxBool isYourAddedService = false.obs;
  List<Service> addedService = [];
  List<String> addedServiceForColor = [];

  Rx<ShopDetail> shopDetailModel = ShopDetail().obs;
  TextEditingController imageController = TextEditingController();
  RxBool isLoading = false.obs;
  // get Activity Core
  Future getShopDetail() async {
    isLoading.value = true;
    try {
      await ShopRepository()
          .getShopDetail(SessionController().user.data!.shops![0].sId ?? "")
          .then((value) async {
        if (value['status'] == true) {
          var response = ShopDetail.fromJson(value);
          shopDetailModel.value = response;
          bioController.text = shopDetailModel.value.data!.bio ?? "";
          isLoading.value = false;
        } else {
          Constant.showSnackBar('Failed', '${value['message']}');
          isLoading.value = false;
        }
      }).onError((error, stackTrace) {
        isLoading.value = false;
        Constant.showSnackBar('Error', error.toString());
      });
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}

class Service {
  final String servicename;
  final String subName;
  final String serviceType;
  Service(this.servicename, this.subName, this.serviceType);
}

class Service1 {
  final String servicename;
  final String id;
  Service1(
    this.servicename,
    this.id,
  );
}
