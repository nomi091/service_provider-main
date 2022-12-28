import 'package:flutter/foundation.dart';
import 'package:service_provider/apis/apis.dart';
import 'package:service_provider/data/network/NetworkApiService.dart';

class ShopRepository {
  // update Shop
  Future<dynamic> createShopRepo(Map data) async {
    try {
      debugPrint("Updated Shop Dta::::: ${data.toString()}");
      var response = await NetworkApiService()
          .getPostApiResponse(Apis.createShop, data);
      debugPrint("Updated Shop Response::::: $response");
      return response;
    } catch (e) {
      throw e.toString();
    }
  }


  Future<dynamic> updateShopRepo(Map data, String id) async {
    try {
      debugPrint("Updated Shop Dta::::: $data");
      var response = await NetworkApiService()
          .getPutApiResponse('${Apis.updateShop}$id', data);
      debugPrint("Updated Shop Response::::: $response");
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // add service
  Future<dynamic> addNewServiceRepo(Map<dynamic, dynamic> data) async {
    try {
      var response = await NetworkApiService().getPostApiResponseWithToken(
        Apis.addNew,
        data,
      );
      debugPrint(response['status'].toString());
      if (response['status'] == true) {
        debugPrint("Data Saved");
      }
      return response;
    } catch (e) {
      debugPrint("Error in Update profile : $e");
      throw e.toString();
    }
  }
  // update service
  Future<dynamic> updateServiceRepo(Map<dynamic, dynamic> data,String id) async {
    try {
      if (kDebugMode) {
        print(Apis.updateService+id);
      }
      var response = await NetworkApiService().getPutApiResponse(
        Apis.updateService+id,
        data,
      );
      debugPrint(response['status'].toString());
      if (response['status'] == true) {
        debugPrint("Data Saved");
      }
      return response;
    } catch (e) {
      debugPrint("Error in Update profile : $e");
      throw e.toString();
    }
  }

  // get core activity
  Future<dynamic> getCoreActivities() async {
    try {
      debugPrint(
          'helo inside Core Activity repo for url......... ${Apis.coreActivities}');
      var response =
          await NetworkApiService().getGetApiResponse(Apis.coreActivities);
      debugPrint("Get Core Activities Response::::: $response");
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // get services
  Future<dynamic> getServices(String coreActivityID) async {
    try {
      debugPrint('helo inside Core IDDD  repo for ID......... $coreActivityID');
      debugPrint(
          'helo inside Service  repo for url......... ${Apis.service}$coreActivityID');
      var response = await NetworkApiService()
          .getGetApiResponse('${Apis.service}$coreActivityID');
      debugPrint("Get Core Activities Response::::: $response");
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // get Shop Detail
  Future<dynamic> getShopDetail(String shopID) async {
    try {
      debugPrint('helo inside Shop Detail  repo for ID......... $shopID');
      debugPrint(
          'helo inside Shop Detail for url......... ${Apis.getShopDetail}$shopID');
      var response = await NetworkApiService()
          .getGetApiResponse('${Apis.getShopDetail}$shopID');
      debugPrint("Get Shop Detail Response::::: $response");
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
