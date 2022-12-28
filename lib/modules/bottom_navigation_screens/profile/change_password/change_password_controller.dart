// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/repositories/auth_repository.dart';
import 'package:service_provider/utils/constant/contant.dart';

class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  RxString currentPasswordError = ''.obs;
  TextEditingController newPasswordController = TextEditingController();
  RxString newPasswordError = ''.obs;
  TextEditingController confirmPasswordController = TextEditingController();
  RxString confirmPasswordError = ''.obs;
  RxBool isObSecurePassword = true.obs;
  RxBool isObSecureNewPassword = true.obs;
  RxBool isObSecureConfirmPassword = true.obs;
  // Reset Password
  Future resetPassword(Map data) async {
    try {
      Constant.showDialog();
      debugPrint(data.toString());
      await AuthRepository().resetPasswordCurrentRepo(data).then((value) {
        Get.back();
        Get.back();
        if (value['status'] == true) {
          Constant.showSnackBar(
              'Change Password', 'Password changed successfully.');
        } else {
          Constant.showSnackBar('Failed', '${value['message']}');
        }
      }).onError((error, stackTrace) {
        debugPrint('Errorrrr: $error');
        Get.back();
        Constant.showSnackBar('Failed', error.toString());
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.back();
    }
  }
}
