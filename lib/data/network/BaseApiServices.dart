// ignore_for_file: file_names

import 'dart:io';

abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> putApiResponse(
    String uid,
    String url,
    Map<dynamic, dynamic> body,
  );

  Future<dynamic> putImageMultipart(String url, String uid, File? data);

  Future<dynamic> putMiltipleMultipart(
      String url, String uid, List<File> imageList);
}
