// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_provider/data/repositories/auth_repository.dart';
import 'package:service_provider/data/repositories/profile_repository.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalProfileController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  RxString userNameError = ''.obs;
  TextEditingController emailController = TextEditingController();
  RxString emailError = ''.obs;
  TextEditingController phoneNumberController = TextEditingController();
  RxString phoneNumberError = ''.obs;
  TextEditingController otherPhoneNumberController = TextEditingController();
  RxString otherPhoneNumberError = ''.obs;
  TextEditingController pdfFileController = TextEditingController();
  RxString pdfFileError = ''.obs;
  XFile? imageFile;
  RxString imageFilePath = ''.obs;
  RxList imageFilePathList = [].obs;
  RxString countryCode = ''.obs;
  RxString otherCountryCode = ''.obs;
  XFile? pdf;
  String imgUrl = '';
  String pdfUrl = '';

  @override
  void onInit() {
    super.onInit();
    if (imageFilePath.value == '') {
      getProfile();
    }
    userNameController.text = SessionController().user.data!.userName ?? '';
    emailController.text = SessionController().user.data!.email ?? '';
    phoneNumberController.text = SessionController().user.data!.phone ?? '';
    otherPhoneNumberController.text =
        SessionController().user.data!.otherPhone ?? '';
    pdfFileController.text = SessionController().user.data!.licenceUrl == ''
        ? 'Not Uploaded'
        : SessionController().user.data!.licenceUrl ?? "";
  }

  getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    imageFilePath.value = prefs.getString('ProfileImg').toString();
  }

  // Update profile Image11
  Future updateProfileImage(BuildContext context) async {
    Constant.showDialog();
    File file = File(imageFile!.path);
    await ProfileRepository().updateProfileImageRepo(file).then((value) {
      Get.back();
      imgUrl = value['data']['url'];
      imageFilePath.value = imgUrl;
      (context as Element).markNeedsBuild();
      Constant.showSnackBar('Image Uploaded', 'Image Uploaded Successfully');
    }).onError((error, stackTrace) {
      Get.back();
    });
  }
  // Update Cover Image11
  Future updateCoverImageImage(BuildContext context) async {
    Constant.showDialog();
    File file = File(imageFile!.path);
    await ProfileRepository().updateProfileImageRepo(file).then((value) {
      Get.back();
      imgUrl = value['data']['url'];
      imageFilePathList.add(imgUrl);
      (context as Element).markNeedsBuild();
      Constant.showSnackBar('Image Uploaded', 'Image Uploaded Successfully');
    }).onError((error, stackTrace) {
      Get.back();
    });
  }

  // Update profile Image
  Future updatePdf(String? filePath) async {
    Constant.showDialog();
    File file = File(filePath!);
    await ProfileRepository().updatePdfRepo(file).then((value) {
      pdfUrl = value['data']['url'];
      Get.back();
      Constant.showSnackBar(
          'Personal Profile', 'Commercial licence uploaded successfully');
    }).onError((error, stackTrace) {
      Get.back();
    });
  }

  // update profle
  Future updateUserProfile(BuildContext context) async {
    try {
      Constant.showDialog();
      Map data = {
        "userName": userNameController.text.trim(),
        "email": emailController.text.trim(),
        "phone": phoneNumberController.text.trim(),
        "otherPhone": otherPhoneNumberController.text.trim(),
        "licenceUrl": pdfUrl,
        "file": imgUrl
      };
      debugPrint('Request Body : $data');
      await AuthRepository().updateProfileRepo(data).then((value) async {
        if (value['status'] == true) {
          Get.back();
          Get.back();
          SessionController().token =
              SessionController().user.data!.token ?? "";
          await SessionController.saveUserInPreference(value);
          await SessionController.getUserFromPreference();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('ProfileImg', imgUrl);
          (context as Element).markNeedsBuild();
          Constant.showSnackBar(
              'Updated successfully.', 'Profile updated successfully');
        } else {
          Get.back();
          Get.back();
          Constant.showSnackBar(
            'Update Failed.',
            'Profile updated failed',
          );
        }
      }).onError((error, stackTrace) {
        Get.back();
        Constant.showSnackBar('Error', '$error');
      });
    } catch (e) {
      Get.back();
      debugPrint("Erorrrrrrrr: ${e.toString()}");
    }
  }

  Future deleteUser(BuildContext context) async {
    try {
      Constant.showDialog();
      Map data = {"isDeleted": "true"};
      debugPrint('Request Body : $data');
      await AuthRepository().updateProfileRepo(data).then((value) async {
        if (value['status'] == true) {
          Get.back();
          await SessionController.removeUserFromPreferences();
          (context as Element).markNeedsBuild();
          Constant.showSnackBar(
              'Deleted successfully.', 'Profile deleted successfully');
          Get.offAllNamed(AppRoutes.loginScreen);
        } else {
          Get.back();
          Get.back();
          Constant.showSnackBar(
            'Deleted Failed.',
            'Profile deleted failed',
          );
        }
      }).onError((error, stackTrace) {
        Get.back();
        Constant.showSnackBar('Error', '$error');
      });
    } catch (e) {
      Get.back();
      debugPrint("Erorrrrrrrr: ${e.toString()}");
    }
  }
}
