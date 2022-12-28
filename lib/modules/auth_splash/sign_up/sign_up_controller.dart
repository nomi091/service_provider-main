// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/repositories/auth_repository.dart';
import 'package:service_provider/data/repositories/profile_repository.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/utils/constant/contant.dart';

class SignUpController extends GetxController {
  // signUp FormKey
  final signUpFormKey = GlobalKey<FormState>();
  // TextEditingController
  TextEditingController usernameController = TextEditingController();
  RxString userNameError = ''.obs;
  TextEditingController shopNameController = TextEditingController();
  RxString shopNameError = ''.obs;
  TextEditingController emailController = TextEditingController();
  RxString emailError = ''.obs;
  TextEditingController passwordController = TextEditingController();
  RxString passwordError = ''.obs;
  RxBool isObSecurePassword = true.obs;
  RxBool isObSecureConfirmPassword = true.obs;
  TextEditingController confirmPasswordController = TextEditingController();
  RxString confirmPasswordError = ''.obs;
  TextEditingController phoneNumberController = TextEditingController();
  RxString countryCode = ''.obs;
  RxString otherCountryCode = ''.obs;
  RxString phoneNumberError = ''.obs;
  TextEditingController otherPhoneNumberController = TextEditingController();
  RxString otherPhoneNumberError = ''.obs;
  TextEditingController licnenceController = TextEditingController();
  RxString licenceError = ''.obs;
  RxBool isChecked = false.obs;
  RxString errorOTP = ''.obs;
  RxString pinCode = ''.obs;
  String email = '';
  String pdfUrl = '';
  @override
  void onInit() async {
    await SessionController.getUserFromPreference().then((value) {
      if (SessionController().isLogin!) {
        // Get.offNamed(AppRoutes.bottomNavigationBar);
      } else {
        Future.delayed(const Duration(seconds: 3)).then((value) {
          // Get.offNamed(AppRoutes.loginScreen);
        });
      }
    });
    super.onInit();
  }



  Future sendOTPOnEmail(String email) async {
    Constant.showDialog();
    dynamic data = {
      'email': email,
    };
    await AuthRepository().sendOTPOnEmail(data).then((value) async {
      Get.back();
      Constant.showSnackBar(
          'Email Sent Successfully', 'OTP Sent on ${emailController.text}');
      Get.toNamed(AppRoutes.signUpVerifyPinScreen);
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
        'email': emailController.text.trim(),
        'otp': pinCode.value,
      };
      debugPrint(data.toString());
      await AuthRepository().verifyPincodeRepo(data).then((value) async {
        Get.back();
        if (value['status'] == true) {
          Constant.showSnackBar(
              'Email verified', 'Email verified Successfully');
          Get.offAllNamed(AppRoutes.loginScreen);
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

  // Update profile Image
  Future updatePdf(String? filePath) async {
    Constant.showDialog();
    File file = File(filePath!);
    await ProfileRepository().updatePdfRepo(file).then((value) {
      Get.back();
      if (value['status'] == true) {
        licenceError.value = '';
        pdfUrl = value['data']['url'];
        Constant.showSnackBar('Licence .', 'Licence uploaded successfully');
      } else {
        Constant.showSnackBar(
          'Licence',
          'Licence uploaded Failed',
        );
      }
    }).onError((error, stackTrace) {
      Get.back();
    });
  }

  // signUpFunc
  Future signUpFunc() async {
    try {
      Constant.showDialog();
      Map data = {
        "userName": usernameController.text.trim(),
        "shopName": shopNameController.text.trim(),
        "phone": countryCode + phoneNumberController.text.trim(),
        "otherPhone": otherCountryCode + otherPhoneNumberController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "licenceUrl": pdfUrl,
      };
      debugPrint('Request Body : $data');
      await AuthRepository().signUpFuncRepo(data).then((value) async {
        if (value['status'] == true) {
          Get.back();
          Constant.showSnackBar('SignUp successfully.', '${value['message']}');
          sendOTPOnEmail(emailController.text);
        } else {
          Get.back();
          Constant.showSnackBar(
            'SignUp Failed.',
            '${value['message']}',
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
