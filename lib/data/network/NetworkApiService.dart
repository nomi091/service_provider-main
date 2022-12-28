// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:service_provider/data/exceptions/app_exceptions.dart';
import 'package:service_provider/data/network/BaseApiServices.dart';
import 'package:service_provider/data/response/session_controller.dart';

class NetworkApiService extends BaseApiServices {
  dynamic headers = {
    "Content-Type": "application/x-www-form-urlencoded",
    'Accept': 'application/json',
  };
  static Future<dynamic> get(String url) async {
    debugPrint('url: $url');
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          //'Authorization': 'Bearer ${SessionController().getToken()}',
        },
      ).timeout(const Duration(seconds: 30));
      debugPrint('got response: ${response.statusCode}');
      debugPrint(response.body);
      return _getResponse(response, url);
    } on SocketException {
      debugPrint('socket exception');
      return 'No internet connection';
    } on TimeoutException {
      debugPrint('timeout');
      return 'Connection timed out';
    }
  }

  static dynamic _getResponse(http.Response response, String url) {
    debugPrint('Status Code: ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        return response;
      default:
        return '${response.statusCode}: Something Went Wrong';
    }
  }

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      debugPrint('Url : $url');
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future putApiResponse(
    // ignore: avoid_renaming_method_parameters
    String url,
    // ignore: avoid_renaming_method_parameters
    String uid,
    Map<dynamic, dynamic> body,
  ) async {
    dynamic responseJson;
    // try {
    http.Response response = await http.put(
      Uri.parse('$url$uid'),
      body: jsonEncode(body),
      // encoding: Encoding.getByName('utf-8'),
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 20));
    debugPrint("APi Url: ${response.request!.url}");
    responseJson = returnResponse(response);
    debugPrint("API RESPONSE : $responseJson");
    // } on SocketException {
    //   throw FetchDataException('No Internet Connection');
    // }
    return responseJson;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  // actually this is post funtion
  Future putImageMultipart(String url, String uid, File? imageFile) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest(
        "Post",
        Uri.parse(
          url,
        ),
      );
      request.headers.addAll(headers);
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        imageFile!.readAsBytesSync(),
        filename: "test.${imageFile.path.split(".").last}",
        contentType: MediaType("image", imageFile.path.split(".").last),
      ));

      var response = await request.send();
      responseJson = response;
      responseJson = returnMultipartResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      debugPrint("catch in network");
      debugPrint(":::::::::::::::::::::");

      debugPrint(e.toString());
      debugPrint(e.toString());
    }

    return responseJson;
  }

  @override
  Future putMiltipleMultipart(
      String url, String uid, List<File> imageList) async {
    dynamic responseJson;
    try {
      List<http.MultipartFile> newMultiPartList = [];
      var request = http.MultipartRequest(
        "PUT",
        Uri.parse(
          url + uid,
        ),
      );
      request.headers.addAll(headers);
      for (int i = 0; i < imageList.length; i++) {
        int randomNumber = Random().nextInt(10000);
        var multipart = http.MultipartFile.fromBytes(
          'images',
          imageList[i].readAsBytesSync(),
          filename: "image$randomNumber.${imageList[i].path.split(".").last}",
          contentType: MediaType("image", imageList[i].path.split(".").last),
        );
        newMultiPartList.add(multipart);
      }
      request.files.addAll(newMultiPartList);
      var response = await request.send();
      responseJson = response;
      responseJson = returnMultipartResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 20));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }













  Future getPostApiResponseWithToken(String url, dynamic data) async {
    dynamic responseJson;

    debugPrint(SessionController().user.data!.token.toString());
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "access-token": SessionController().token ?? ""
        },
      ).timeout(const Duration(seconds: 20));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  // updated
  Future getPutApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http.put(
        Uri.parse(url),
        body: data,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "access-token": SessionController().token ?? ""
        },
      ).timeout(const Duration(seconds: 20));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("APi Url: ${response.request!}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future getPutApiResponseWithJsonEncodeBody(String url, Map data) async {
    dynamic responseJson;
    try {
      debugPrint(data.toString());
      http.Response response = await http
          .put(
            Uri.parse(url),
            body: data,
            // body:jsonEncode(data),
          )
          .timeout(const Duration(seconds: 20));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future getPutApiResponseWithToken(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http.put(
        Uri.parse(url),
        body: data,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "access-token": SessionController().token ?? "",
        },
        // encoding: Encoding.getByName('utf-8'),
      ).timeout(const Duration(seconds: 20));
      debugPrint("Data Body : $data");
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("APi Url: ${response.request}");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future getPostApiResponseWithRaw(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 20));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future getPostApiResponseForLinkBankCard(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: 20));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponseForLinkBankCard(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  // Response exceptions
  dynamic returnResponseForLinkBankCard(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      // throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            // ignore: prefer_adjacent_string_concatenation
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            // ignore: prefer_adjacent_string_concatenation
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }

  // Response exception for images
  dynamic returnMultipartResponse(http.StreamedResponse response) async {
    final responseBody = await response.stream.bytesToString();
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(responseBody);
        return responseJson;
      case 400:
        throw BadRequestException(responseBody);
      case 500:
      case 404:
        throw UnauthorisedException(responseBody);
      default:
        throw FetchDataException(
            // ignore: prefer_adjacent_string_concatenation
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
