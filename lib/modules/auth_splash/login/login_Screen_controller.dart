// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/repositories/auth_repository.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/data/response/shared_preference.dart';
import 'package:service_provider/modules/auth_splash/forgot_password/forgot_password_controller.dart';
import 'package:service_provider/modules/create_shop/create_shop_controller.dart';
import 'package:service_provider/routes/app_routes.dart';
import 'package:service_provider/utils/constant/alert.dart';
import 'package:service_provider/utils/constant/contant.dart';

class LoginController extends GetxController {
  RxBool isEnglishLanguage = true.obs;
  RxBool isArabiicLanguage = false.obs;
  TextEditingController emailController = TextEditingController();
  RxString emailError = ''.obs;
  TextEditingController passwordController = TextEditingController();
  RxString passwordError = ''.obs;
  RxBool isObSecurePassword = true.obs;
  Future loginwithEmail(
      String email, String password, BuildContext context) async {
    Constant.showDialog();
    dynamic data = {
      'email': email,
      'password': password,
    };
    try {
      await AuthRepository().loginWithEmailRepo(data).then((value) async {
        Get.back();
        if (value['status'] == true) {
          if (SessionController()
                  .user
                  .data!
                  .shops![0]
                  .coreActivities!
                  .isEmpty ||
              SessionController().user.data!.shops![0].services!.isEmpty) {
            debugPrint("Image Url: ${SessionController().user.data!.imageUrl}");
            CreateShopController controller = Get.put(CreateShopController());
            controller.screnName = 'Login';
            Get.offAllNamed(AppRoutes.createShop);
          } else {
            SharedPreferenceClass.setValueBoolen('isLogin', true);
            Get.offAllNamed(AppRoutes.bottomNavigationBar);
          }
        } else {
          if (value['message']
              .toString()
              .contains('Your Account is not verified')) {
            ForgotPasswordController controller =
                Get.put(ForgotPasswordController());
            SessionController().emailForVerifyAccount =
                emailController.text.trim().toString();
            SessionController().passwordForVerifyAccount =
                passwordController.text.trim().toString();
            // Constant.showSnackBar('Account not verified',
            //     'Please verify your email for account verify');
            CustomALertDialog.flutterAlertError(
                'Please verify your email for account verify', context);
            debugPrint(SessionController().emailForVerifyAccount);
            controller.sendOTPOnEmail(emailController.text.trim().toString());
          } else {
            if (value['message']
                .toString()
                .contains('user not exist against mail')) {
              CustomALertDialog.flutterAlertError(
                  'user not exist against mail', context);
              // Constant.showSnackBar(
              //     'Error', 'User Does not exist , please signup');
            } else {
              // Constant.showSnackBar('Error', value['message'].toString());
              CustomALertDialog.flutterAlertError(
                  value['message'].toString(), context);
            }
          }
        }
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
        Get.back();
        CustomALertDialog.flutterAlertError(error.toString(), context);
        // Constant.showSnackBar('Error', error.toString());
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
