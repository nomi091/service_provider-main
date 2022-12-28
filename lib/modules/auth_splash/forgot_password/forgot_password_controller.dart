// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/repositories/auth_repository.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/auth_splash/login/login_Screen_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/utils/constant/contant.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxString emailError = ''.obs;
  RxString errorOTP = ''.obs;
  RxString pinCode = ''.obs;
  TextEditingController passwordController = TextEditingController();
  RxString passwordError = ''.obs;
  RxBool isObSecurePassword = true.obs;
  TextEditingController passwordConfirmController = TextEditingController();
  RxString passwordConfirmError = ''.obs;
  RxBool isObSecureConfirmPassword = true.obs;
  String screenName = '';

  // apply for forgot password
  Future sendOTPOnEmail(String email) async {
    Constant.showDialog();
    dynamic data = {
      'email': email,
    };
    await AuthRepository().sendOTPOnEmail(data).then((value) async {
      if (value['status'] == true) {
        Get.back();
        Constant.showSnackBar(
            'Email Sent Successfully', 'Code sent on your email');
        Get.toNamed(AppRoutes.forgotVerifyPinScreen);
      } else {
        Get.back();
        Constant.showSnackBar('Error', value['message'].toString());
      }
    }).onError((error, stackTrace) {
      Get.back();
      Constant.showSnackBar('Error', error.toString());
    });
  }

  // Verify Pincode
  Future verifyPincode() async {
    try {
      Constant.showDialog();
      dynamic data = {
        'email': emailController.text.trim().toString(),
        'otp': pinCode.value,
      };
      await AuthRepository().verifyPincodeRepo(data).then((value) async {
        Get.back();
        if (value['status'] == true) {
          Get.offAndToNamed(AppRoutes.forgotSetPasswordScreen);
        } else {
          Constant.showSnackBar('Failed', '${value['message']}');
        }
      }).onError((error, stackTrace) {
        Get.back();
        Constant.showSnackBar('Error', error.toString());
      });
    } catch (e) {
      Get.back();
      debugPrint(e.toString());
    }
  }

  Future verifyPincodeForAccountVerify(BuildContext context) async {
    try {
      Constant.showDialog();
      dynamic data = {
        'email': SessionController().emailForVerifyAccount,
        'otp': pinCode.value,
      };
      await AuthRepository().verifyPincodeRepo(data).then((value) async {
        Get.back();
        if (value['status'] == true) {
          // Get.offAndToNamed(AppRoutes.bottomNavigationBar);
          Constant.showSnackBar('Account verified',
              'Your account is verified successfully');
          LoginController controller = Get.find();
          controller.loginwithEmail(SessionController().emailForVerifyAccount!,SessionController().passwordForVerifyAccount!,context);
        } else {
          Constant.showSnackBar('Failed', '${value['message']}');
        }
      }).onError((error, stackTrace) {
        Get.back();
        Constant.showSnackBar('Error', error.toString());
      });
    } catch (e) {
      Get.back();
      debugPrint(e.toString());
    }
  }

  // Reset Password
  Future resetPassword() async {
    try {
      Constant.showDialog();
      dynamic data = {
        "otp": pinCode.value,
        "email": emailController.text.trim().toString(),
        "password": passwordController.text.trim().toString()
      };
      debugPrint(data.toString());
      await AuthRepository().resetPasswordRepo(data).then((value) {
        Get.back();
        if (value['status'] == true) {
          Constant.showSnackBar(
              '${value['message']}', 'Your password updated successfully');
          Get.offAllNamed(AppRoutes.loginScreen);
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
