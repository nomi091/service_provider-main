import 'dart:io';
import 'package:service_provider/apis/apis.dart';
import 'package:service_provider/data/network/NetworkApiService.dart';

class ProfileRepository {
  // Update profile Image11
  Future<dynamic> updateProfileImageRepo(File? imageFile) async {
    try {
      var response = await NetworkApiService()
          .putImageMultipart(Apis.uploadImg, '', imageFile);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // Update PDF
  Future<dynamic> updatePdfRepo(File? imageFile) async {
    try {
      var response = await NetworkApiService()
          .putImageMultipart(Apis.uploadImg, '', imageFile);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
