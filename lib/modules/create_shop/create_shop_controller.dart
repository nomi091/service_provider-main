// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_provider/data/models/activity_services_model.dart';
import 'package:service_provider/data/repositories/profile_repository.dart';
import 'package:service_provider/data/repositories/shop_repository.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/widget/error_widget/string_widget.dart';
import 'package:service_provider/utils/widget/k_app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/shop_detail_model.dart' as shop_detail;
import '../../data/response/shared_preference.dart';
import '../../routes/app_routes.dart';

class CreateShopController extends GetxController {
  RxBool isFromMap = false.obs;
  RxBool isEditServide = false.obs;
  String serviceName = '';
  String servicePrice = '';
  String serviceType = '';
  String serviceID = '';

  String screnName = '';
  RxBool isLoading = false.obs;
  RxString locationError = ''.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  RxBool isMapSHow = false.obs;
  RxString imgError = ''.obs;
  RxString workedAndTimesError = ''.obs;
  RxString bioError = ''.obs;
  TextEditingController bioController = TextEditingController();
  TextEditingController imgController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // Core Activity
  RxBool isActivityCore = false.obs;
  RxString activityCoreError = ''.obs;
  ActivityServicesModel activitCoreList = ActivityServicesModel();
  RxBool isSelectedActivitCoreList = false.obs;
  List<Service1> selectedActivitCoreList = [];
  List<String> selectedActivitCoreNameList = [];
  List<String> selectedActivityServiceNameList = [];
  List<String> selectedActivitCoreIDList = [];

  // Your Servicep
  var yourServiceListModel = ActivityServicesModel().obs;
  // RxList<Data> serviceList = [Data()].obs;
  RxList<Data> yourSearchServiceListModel = [Data()].obs;
  // List<Service1> yourServiceList = [];
  List<String> yourSearchServiceList = [];
  TextEditingController searchController = TextEditingController();
  RxBool isSearch = false.obs;
  RxBool isYourService = false.obs;
  RxString yourServiceError = ''.obs;
  String addedServiceIed = '';
  // Add New Service
  TextEditingController serviceNameController = TextEditingController();
  RxString serviceNameError = ''.obs;
  TextEditingController priceController = TextEditingController();
  RxString priceError = ''.obs;
  RxBool homeService = false.obs;
  RxBool shopService = false.obs;
  RxString chooseServiceType = ''.obs;

  RxBool isAddServiceError = false.obs;
  RxBool isYourAddedService = false.obs;
  List<Service> addedService = [];
  List<String> addedServiceForColor = [];
  List<String> addedServiceSelected = [];
  bool show = false;
  XFile? imageFile;
  RxString imageFilePath = ''.obs;
  RxList<String> imageUrl = [''].obs;
  RxList<String> imageName = [''].obs;
  RxString imageFilePathForProfile = ''.obs;
  var UserID;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getProfile();

      if (imageUrl.contains('')) {
        imageUrl.clear();
      }
    });
  }

  getProfile() async {
    SharedPreferenceClass.setValueBoolen('isLogin', true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    imageFilePathForProfile.value = prefs.getString('ProfileImg').toString();
    UserID = prefs.getString("UserID");
  }

  Rx<shop_detail.ShopDetail> shopDetailModel = shop_detail.ShopDetail().obs;
  Future getShopDetail() async {
    isLoading.value = true;
    // try {
    await ShopRepository()
        .getShopDetail( UserID)
        .then((value) async {
      if (value['status'] == true) {
        var response = shop_detail.ShopDetail.fromJson(value);
        shopDetailModel.value = response;
        // for activity core
        for (int i = 0;
            i < shopDetailModel.value.data!.coreActivities!.length;
            i++) {
          selectedActivitCoreNameList
              .add(shopDetailModel.value.data!.coreActivities![i].name ?? "");

          selectedActivitCoreIDList
              .add(shopDetailModel.value.data!.coreActivities![i].id ?? "");
          selectedActivitCoreList.add(Service1(
              shopDetailModel.value.data!.coreActivities![i].name ?? "",
              shopDetailModel.value.data!.coreActivities![i].id ?? ""));
        }
        // for show the activity core list
        isSelectedActivitCoreList.value = true;
        ////////////////////////////////////////////////////////
        // for Your Services
        var id = '';
        selectedActivitCoreIDList.toSet().toList();
        id = selectedActivitCoreIDList
            .reduce((value, element) => '$value,$element');
        await getServicesByCoreID(id);
        // for added service
        for (int i = 0; i < shopDetailModel.value.data!.services!.length; i++) {
          addedService.add(Service(
            shopDetailModel.value.data!.services![i].serviceId!.name ?? '',
            shopDetailModel.value.data!.services![i].serviceId!.nameArabic ??'',
            shopDetailModel.value.data!.services![i].place.toString(),
            shopDetailModel.value.data!.services![i].price.toString(),
            // 'homeService',
            // shopDetailModel.value.data!.services!.,
            shopDetailModel.value.data!.services![i].serviceId!.id ?? '',
          ));
          addedServiceForColor.add(
              shopDetailModel.value.data!.services![i].serviceId!.name ?? '');
          addedServiceSelected.add(
              shopDetailModel.value.data!.services![i].serviceId!.id ?? '');
        }
        isYourAddedService.value = true;
        ///////////////////////////////////////////////////////
        /// for location
        if (shopDetailModel.value.data!.location == 'myLocation') {
          locationController.text = 'myLocation';
        } else {
          isMapSHow.value = true;
          SessionController().lat =
              double.parse(shopDetailModel.value.data!.location!.split(',')[0]);
          SessionController().lon =
              double.parse(shopDetailModel.value.data!.location!.split(',')[1]);
          List<Placemark> placemarks = await placemarkFromCoordinates(
              SessionController().lat, SessionController().lon);

          debugPrint('on camera move end');
          (placemarks);
          Placemark place = placemarks[0];
          var address =
              '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
          locationController.text = address;
          isMapSHow.value = true;
        }
        // isMapSHow.value = true;
        ///////////////////////////////////////////////////////
        // for Images
        imageUrl.value = shopDetailModel.value.data!.imageUrls ?? [];
        if (imageUrl.contains('')) {
          imageUrl.clear();
        }
        imageName.value = shopDetailModel.value.data!.imageUrls ?? [];
        if (imageName.contains('')) {
          imageName.clear();
        }
        bioController.text = shopDetailModel.value.data!.bio ?? "";
        isLoading.value = false;
      } else {
        Constant.showSnackBar('Failed', '${value['message']}');
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      print("=========== $error =============");
      isLoading.value = false;
      Constant.showSnackBar('Error', error.toString());
    });
    // } catch (e) {
    //   isLoading.value = false;
    //   debugPrint(e.toString());
    // }
  }

  Future<void> getActivityCoreData() async {
    await getAllCoreActivites();
  }

// add service
  Future addNewServiceFunc(BuildContext context) async {
    try {
      Constant.showDialog();
      Map data = {
        "name": serviceNameController.text.trim(),
        "price": priceController.text.trim(),
        "place": chooseServiceType.value,
      };
      debugPrint('Request Body : $data');
      await ShopRepository().addNewServiceRepo(data).then((value) async {
        if (value['status'] == true) {
          isAddServiceError.value = false;
          addedServiceIed = value['data']['id'];
          Get.back();
          Constant.showSnackBar('Service', 'Service added successfully');
        } else {
          Get.back();
          isAddServiceError.value = true;
          Constant.showSnackBar(
            'Service',
            'Service added failed',
          );
        }
      }).onError((error, stackTrace) {
        isAddServiceError.value = true;
        Get.back();
        Constant.showSnackBar('Error', '$error');
      });
    } catch (e) {
      isAddServiceError.value = true;
      Get.back();
      debugPrint("Erorrrrrrrr: ${e.toString()}");
    }
  }

// update service
  Future updateServiceFunc(BuildContext context, String id,ServiceId) async {
    try {
      Constant.showDialog();
      Map data = {
        "serviceId":ServiceId,
        "price":priceController.text.trim(),
        "place":chooseServiceType.value,
      };
      debugPrint('Request Body : $data');
      await ShopRepository().updateServiceRepo(data, id).then((value) async {
        if (value['status'] == true) {
          isAddServiceError.value = false;
          addedServiceIed = value['data']['id'];
          Get.back();
          Constant.showSnackBar('Service', 'Service added successfully');
        } else {
          Get.back();
          isAddServiceError.value = true;
          Constant.showSnackBar(
            'Service',
            'Service added failed',
          );
        }
      }).onError((error, stackTrace) {
        isAddServiceError.value = true;
        Get.back();
        Constant.showSnackBar('Error', '$error');
      });
    } catch (e) {
      isAddServiceError.value = true;
      Get.back();
      debugPrint("Erorrrrrrrr: ${e.toString()}");
    }
  }

  // get Activity Core
  Future getAllCoreActivites() async {
    try {
      isLoading.value = true;
      await ShopRepository().getCoreActivities().then((value) async {
        if (value['status'] == true) {
          var response = ActivityServicesModel.fromJson(value);
          activitCoreList = response;
        } else {
          Constant.showSnackBar('Failed', '${value['message']}');
        }
        isLoading.value = false;
      }).onError((error, stackTrace) {
        isLoading.value = false;
        Constant.showSnackBar('Error', error.toString());
      });
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  // get Services
  Future getServicesByCoreID(String id) async {
    Constant.showDialog();
    await ShopRepository().getServices(id).then((value) async {
      Get.back();
      if (value['status'] == true) {
        var response = ActivityServicesModel.fromJson(value);
        yourServiceListModel.value = response;
        // serviceList.value = response.data!;
        //  print(("______________${serviceList.length}______"));

        for (int i = 0; i < yourServiceListModel.value.data!.length; i++) {
          selectedActivityServiceNameList
              .add(yourServiceListModel.value.data![i].name ?? "");
        }
        // for (int i = 0; i < serviceList.length; i++) {
        //   selectedActivityServiceNameList.add(
        //     serviceList[i].name ?? '',
        //   );
        //   print(serviceList[i].name ?? "=====");
        // }
      } else {
        Constant.showSnackBar('Failed', '${value['message']}');
      }
    }).onError((error, stackTrace) {
      Get.back();
      Constant.showSnackBar('Error', error.toString());
      return;
    });
  }

  // Update profile Image11
  Future updateProfileImage() async {
    Constant.showDialog();
    File file = File(imageFile!.path);
    await ProfileRepository().updateProfileImageRepo(file).then((value) {
      Get.back();
      if (imageUrl.contains('')) {
        imageUrl.clear();
      }
      if (imageName.contains('')) {
        imageName.clear();
      }
      imageName.add(value['data']['url']);
      imageUrl.add(value['data']['url']);
      imageName.toSet().toList();
      imageUrl.toSet().toList();
      // debugPrint(imageUrl.toString());
      // debugPrint(imageName.toSet().toList().toString());
      // debugPrint(value['data']['url']);
      Constant.showSnackBar('Image Uploaded', 'Image Uploaded Successfully');
    }).onError((error, stackTrace) {
      Get.back();
    });
  }

  Future createShopController(Map data, BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Constant.showDialog();
    await ShopRepository()
        .createShopRepo(
      data,
    )
        .then((value) async {
      Get.back();
      if (value['status'] == true) {
        print("updated ${value['data']['id']}");

        pref.setString(
          "UserID",
          "${value['data']['id']}",
        );
        //  var UserID= pref.getString("UserID");
        //  print("UserID $UserID");
        SharedPreferenceClass.setValueBoolen('isLogin', true);
        Constant.showSnackBar('Shop', 'Shop Created Successfully');
        Get.offNamed(AppRoutes.bottomNavigationBar);
        // Get.offNamed(AppRoutes.bottomNavigationBar);
        // Constant.showSnackBar('Shop', 'Shop Created Successfully');
        //  Get.offNamed(AppRoutes.bottomNavigationBar);
        // if (screenName == 'ShopDetail') {
        //   Constant.showSnackBar('Shop', 'Shop Created Successfully');
        // } else {
        // Constant.showSnackBar('Shop',
        //     'Shop Updated Successfully,Please again login for update ..');
        // SharedPreferenceClass.setValueBoolen('isLogin', true);
        // }
        // if (screenName == 'ShopDetail') {
        //   Get.back();
        //   Navigator.of(context).pop();
        // } else {
        //   Get.offNamed(AppRoutes.loginScreen);
        // }
        // Get.offNamed(AppRoutes.bottomNavigationBar);
      } else {
        Constant.showSnackBar('Failed', '${value['message']}');
      }
    }).onError((error, stackTrace) {
      Get.back();
      if (error.toString().contains('server side error')) {
        Constant.showSnackBar('Error', 'Unauthorised request');
      } else {
        if (kDebugMode) {
          print(error);
        }
        Constant.showSnackBar('Error', error.toString());
      }
    });
  }

 // update shop
  // Future updateShop(
  //     Map data, String id, String screenName, BuildContext context) async 
  //     {
  //   Constant.showDialog();
  //   await ShopRepository().updateShopRepo(data, id).then((value) async {
  //     Get.back();
  //     if (value['status'] == true) {
  //       if (screenName == 'ShopDetail') {
  //         Constant.showSnackBar('Shop', 'Shop Updated Successfully');
  //       } else {
  //         Constant.showSnackBar('Shop',
  //             'Shop Updated Successfully,Please again login for update ..');
  //         SharedPreferenceClass.setValueBoolen('isLogin', true);
  //       }
  //       if (screenName == 'ShopDetail') {
  //         Get.back();
  //         Navigator.of(context).pop();
  //       } else {
  //         Get.offNamed(AppRoutes.loginScreen);
  //       }

  //       // Get.offNamed(AppRoutes.bottomNavigationBar);
  //     } else {
  //       Constant.showSnackBar('Failed', '${value['message']}');
  //     }
  //   }).onError((error, stackTrace) {
  //     Get.back();
  //     if (error.toString().contains('server side error')) {
  //       Constant.showSnackBar('Error', 'Unauthorised request');
  //     } else {
  //       if (kDebugMode) {
  //         print(error);
  //       }
  //       Constant.showSnackBar('Error', error.toString());
  //     }
  //   });}

}
_showDialog(BuildContext context, CreateShopController controller, String id,
    bool isAdd) {
  showDialog(
    context: context,
    builder: (BuildContext context1) {
      return AlertDialog(
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('Successfully Added',
                maxLines: null,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: Constant.montserratSemiBold,
                    fontSize: 23,
                    color: CustomTheme.color232F34)),
          ),
        )),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const StringWidget(
                title: 'You have Successfully added your service information',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            KAppButton(
              buttonText: 'Ok',
              buttonColor: CustomTheme.blackColor,
              onTap: () {
                controller.addedService.add(Service(
                    controller.serviceNameController.text,
                    controller.priceController.text,
                    controller.chooseServiceType.value,
                    id,
                    ''));
                controller.addedServiceForColor
                    .add(controller.serviceNameController.text);
                controller.addedServiceSelected.add(id);

                Navigator.of(context).pop();
                Navigator.of(context).pop();
                controller.isYourService.value = false;
                controller.isYourAddedService.value = true;
              },
              textColor: CustomTheme.whiteColor,
            )
          ],
        ),
      );
    },
  );
}

// searchService(String qry) {
//   for (int i = 0; i < serviceList.length; i++) {
//     print("+++++++++++++++++${serviceList[i].name!}++++++++++++++++++");
//     if (serviceList[i].name.contains(qry)) {
//       yourSearchServiceListModel.add(serviceList[i]);
//     }
//     print("----  $yourSearchServiceListModel ----");
//     serviceList.value = yourSearchServiceListModel;
//     isSearch.value = true;
//   }
//   if (yourSearchServiceList.isNotEmpty) {
//     isSearch.value = true;
//   } else {
//     isSearch.value = false;
//   }
// }
//}

class Service {
  final String servicename;
  final String subName;
  final String serviceType;
  final String id;
  final String price;
  Service(
      this.servicename, this.subName, this.serviceType, this.id, this.price);
}

class Service1 {
  final String servicename;
  final String id;
  Service1(
    this.servicename,
    this.id,
  );
}
