import 'package:flutter/foundation.dart';
import 'package:service_provider/apis/apis.dart';
import 'package:service_provider/data/network/NetworkApiService.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  // loginWithEmail user will login through email
   var check;
  Future<dynamic> loginWithEmailRepo(
    dynamic data,
  ) async {
    debugPrint(data.toString());
    try {
      var response = await NetworkApiService()
          .getPutApiResponse(Apis.loginWithEmail, data);
      if (response['status'] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await SessionController.saveUserInPreference(response);
        await SessionController.getUserFromPreference();
        prefs.setString('token', SessionController().user.data!.token ?? "");
        // prefs.setString('userId',data['id']);
        // prefs.setString('shopName',data['shops'][0]['name']);
        // SessionController().token = prefs.getString('token');

      //  check=  prefs.getString('userId');
      // var name2=  prefs.getString('shopName');
      //           print("userId$check");
      //           print(name2);

      }
      
      return  response;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      throw e.toString();
    }
  }

  // sendOTPOnEmail
  Future<dynamic> sendOTPOnEmail(
    dynamic data,
  ) async {
    debugPrint(data.toString());
    try {
      var response = await NetworkApiService()
          .getPutApiResponse(Apis.forgotPassword, data);
      debugPrint(response.toString());
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      throw e.toString();
    }
  }

  //verify pincode
  Future<dynamic> verifyPincodeRepo(dynamic data) async {
    try {
      debugPrint('Request for verify Pin: $data');
      var response = await NetworkApiService()
          .getPutApiResponse(Apis.verifyOtpForgetPassword, data);
      if (kDebugMode) {
        print(data);
      }
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // Reset Password
  Future<dynamic> resetPasswordRepo(dynamic data) async {
    try {
      var response = await NetworkApiService()
          .getPutApiResponse(Apis.resetForgetedPassword, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // Reset Password
  Future<dynamic> resetPasswordCurrentRepo(dynamic data) async {
    try {
      var response = await NetworkApiService()
          .getPutApiResponseWithToken(Apis.resetPassword, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // SignUp
  Future<dynamic> signUpFuncRepo(Map<dynamic, dynamic> data) async {
    try {
      var response = await NetworkApiService().getPostApiResponse(
        Apis.signup,
        data,
      );
      debugPrint(response['status'].toString());
      // if (response['status'] == true) {
      //   await SessionController.saveUserInPreference(response);
      //   await SessionController.getUserFromPreference();
      //   debugPrint("Data Saved");
      // }
      return response;
    } catch (e) {
      debugPrint("Error in Update profile : $e");
      throw e.toString();
    }
  }

  // update ...
  Future<dynamic> updateProfileRepo(Map<dynamic, dynamic> data) async {
    try {
      var response = await NetworkApiService().getPutApiResponseWithToken(
        Apis.updateProfile,
        data,
      );
      debugPrint(response['status'].toString());
      return response;
    } catch (e) {
      debugPrint("Error in Update profile : $e");
      throw e.toString();
    }
  }

  // update
  Future<dynamic> deleteProfileRepo(Map<dynamic, bool> data) async {
    try {
      var response = await NetworkApiService().getPutApiResponseWithToken(
        Apis.updateProfile,
        data,
      );
      debugPrint(response['status'].toString());
      if (response['status'] == true) {
        // await SessionController.saveUserInPreference(response);
        // await SessionController.getUserFromPreference();
        debugPrint("Data updated");
      }
      return response;
    } catch (e) {
      debugPrint("Error in Update profile : $e");
      throw e.toString();
    }
  }
}
