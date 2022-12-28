import 'dart:async';
// import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:service_provider/data/models/place_Search_model.dart';
import 'package:service_provider/data/network/NetworkApiService.dart';
import 'package:service_provider/data/response/session_controller.dart';
import 'package:service_provider/modules/create_shop/create_shop_controller.dart';
import 'package:service_provider/modules/shop_detail.dart/shop_detail.dart';
import 'package:service_provider/theme/Ktheme.dart';
import 'package:service_provider/utils/constant/contant.dart';
import 'package:service_provider/utils/methods/get_user_location.dart';
import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
import 'package:service_provider/utils/widget/custom_appbar.dart';
import 'package:service_provider/utils/widget/search_textdield.dart';
import 'package:sizer/sizer.dart';

class GoogleMapClassN extends StatefulWidget {
  final String screenName;
  const GoogleMapClassN({
    Key? key,
    required this.screenName,
  }) : super(key: key);
  @override
  _GoogleMapClassNState createState() => _GoogleMapClassNState();
}

class _GoogleMapClassNState extends State<GoogleMapClassN> {
  // GoogleMapControllerN _googleMapController = Get.put(GoogleMapControllerN());
  TextEditingController addresstxt = TextEditingController();
  TextEditingController searchText = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  String key = 'AIzaSyDORAiwsJBUe0hBl6ViXWmf97aVT3VnYqg';
  List<PlaceSearch> searchResults = [];
  bool clear = false;
  String locationError = '';
  MapType mapType = MapType.normal;
  final Set<Marker> _markers = {};
  bool loadingInd = false;
  bool gettingCurrentLocation = false;
  bool gettingDistance = false;
  bool gettingPlaceName = false;
  bool confirm = false;

  bool searching = false;

  LatLng _center = const LatLng(33.6295, 73.1170);
  var selectedPlaceName = "";
  @override
  void initState() {
    _setInitPosition();
    super.initState();
  }

  void _setInitPosition() async {
    if (SessionController().lat == 0.0 && SessionController().lon == 0.0) {
      gettingCurrentLocation = true;
      await _getCurrentLocation();
      setState(() {
        gettingCurrentLocation = false;
      });
    } else {
      _center = LatLng(SessionController().lat, SessionController().lon);
      moveCamera(_center);
    }
  }

  //for current Location
  Future<void> _getCurrentLocation() async {
    debugPrint("CurrentLocation");
    Position position = await UserCurrentLocation.determinePosition();
    _center = LatLng(position.latitude, position.longitude);
    moveCamera(_center);
  }

  Future<String> addressFromCorrdinates() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(_center.latitude, _center.longitude);
    debugPrint('on camera move end');
    (placemarks);
    Placemark place = placemarks[0];
    var address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      addresstxt.text = address;
      SessionController().selectedLocation = addresstxt.text;
      SessionController().lat = _center.latitude;
      SessionController().lon = _center.longitude;
    });
    setState(() {});
    setState(() {});
    debugPrint('on camera move end');
    (address);
    return address;
  }

  Future<void> moveCamera(LatLng center) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: center,
      zoom: 14.0,
    )));
  }

  void _onCameraMoveEnd() async {
    debugPrint('on camera move end');
    await addressFromCorrdinates();
    setState(() {
      loadingInd = false;
      gettingPlaceName = false;
    });
    if (confirm) {
      debugPrint('confirm');
      // _confirm();
    }
  }

  void _onCameraMove(CameraPosition position) {
    debugPrint('on camera move');
    _center = position.target;
    setState(() {
      loadingInd = true;
    });
  }

  void _onCameraMoveStarted() {
    debugPrint('on camera move started');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: false);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  title: '',
                  navBar: SearchField(
                    controller: searchText,
                    onPressed: () {
                      search(searchText.text);
                    },
                    enabled: true,
                    key: null,
                    onChanged: (val) {
                      if (val.length > 2) {
                        search(searchText.text);
                      }
                      if (val.length < 2) {
                        setState(() {
                          searchResults.clear();
                        });
                      }
                    },
                  ),
                  onBackPressed: null,
                  key: null,
                ),
                gettingCurrentLocation
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : locationError != ''
                        ? Text(
                            locationError,
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14.sp,
                                fontFamily: "NexaLight"),
                          )
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            child: SingleChildScrollView(
                              child: SizedBox(
                                height: 85.h,
                                child: Stack(
                                  children: [
                                    GoogleMap(
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        _controller.complete(controller);
                                      },
                                      zoomControlsEnabled: false,
                                      myLocationButtonEnabled: false,
                                      myLocationEnabled: true,
                                      markers: _markers,
                                      zoomGesturesEnabled: false,
                                      mapToolbarEnabled: true,
                                      onCameraMove: _onCameraMove,
                                      onCameraIdle: _onCameraMoveEnd,
                                      onCameraMoveStarted: _onCameraMoveStarted,
                                      initialCameraPosition: CameraPosition(
                                        target: _center,
                                        zoom: 17.0,
                                      ),
                                      mapType: mapType,
                                      onTap: (center) {},
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 3.h),
                                            child: Image.asset(
                                                Constant.locationMarker,
                                                height: 15.h,
                                                fit: BoxFit.contain),
                                          )),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 9.0.h,
                                        margin: EdgeInsets.only(
                                            bottom: 17.0.h,
                                            left: 8.0.w,
                                            right: 8.0.w),
                                        padding: EdgeInsets.only(
                                            bottom: 0.0.h,
                                            left: 1.0.w,
                                            right: 1.0.w),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: loadingInd == true
                                            ? Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 0.0.h,
                                                    left: 1.0.w,
                                                    right: 1.0.w),
                                                height: 6.0.h,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                              )
                                            : TextField(
                                                controller: addresstxt,
                                                enabled: false,
                                                maxLines: null,
                                                decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.0.w, bottom: 2.0.h),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.back(result: false);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 0.0.h),
                                                height: 5.0.h,
                                                width: 35.0.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.red.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                    child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0.sp),
                                                )),
                                              ),
                                            ),
                                            gettingDistance || gettingPlaceName
                                                ? Container(
                                                    width: 35.w,
                                                    height: 5.h,
                                                    margin: EdgeInsets.only(
                                                        left: 5.w),
                                                    alignment: Alignment.center,
                                                    child: Wrap(
                                                      children: const [
                                                        CircularProgressIndicator(),
                                                      ],
                                                    ))
                                                : InkWell(
                                                    onTap: () async {
                                                      if (addresstxt.text != '') {
                                                        setState(() {
                                                          SessionController()
                                                                  .selectedLocation =
                                                              addresstxt.text;
                                                        });
                                                        debugPrint(
                                                            SessionController()
                                                                .selectedLocation);
                                                        debugPrint(
                                                            '************');
                                                        debugPrint(
                                                            addresstxt.text);
                                                        if (widget.screenName ==
                                                            'shopDetail') {
                                                          CreateShopController createShopController = Get.find();
                                                          createShopController.isFromMap.value = true;
                                                          Get.off(() =>
                                                              const ShopDetailPage());
                                                          Get.back();
                                                        } else {
                                                          Get.back();
                                                        }
                                                      } else {
                                                        Constant.showSnackBar(
                                                            'Error',
                                                            'Please select location..');
                                                      }
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 0.0.h,
                                                          left: 5.0.w),
                                                      height: 5.0.h,
                                                      width: 35.0.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10)),
                                                      child: Center(
                                                          child: Text(
                                                        "Confirm",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.0.sp),
                                                      )),
                                                    ),
                                                  ),
                                            const Spacer(),
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    color: Colors.white),
                                                child: IconButton(
                                                    onPressed: () {
                                                      _getCurrentLocation();
                                                    },
                                                    icon: const Icon(
                                                        Icons.my_location))),
                                            const Spacer()
                                          ],
                                        ),
                                      ),
                                    ),
                                 
                                    searching
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            width: double.infinity,
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Wrap(
                                                  children: const [
                                                    CircularProgressIndicator(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : searchResults.isEmpty
                                            ? const SizedBox()
                                            : Container(
                                                color: Colors.white,
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        searchResults.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          gotoPlace(searchResults[
                                                                      index]
                                                                  .description ??
                                                              "");
                                                        },
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 30),
                                                              child: Text(
                                                                searchResults[
                                                                            index]
                                                                        .description ??
                                                                    "",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline6!
                                                                    .copyWith(
                                                                      fontFamily:
                                                                          Constant
                                                                              .montserratRegular,
                                                                      height: Get
                                                                              .height *
                                                                          0.002,
                                                                      color: CustomTheme
                                                                          .blackColor,
                                                                    ),
                                                              ),
                                                            ),
                                                            const Divider()
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                  ],
                                ),
                              ),
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void search(String search) {
    if (search.isEmpty) {
      clear = true;
      setState(() {
        searchResults.clear();
      });
    } else {
      clear = false;
      getAutocomplete(search);
    }
  }

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$key';
    setState(() {
      searching = true;
    });
    var response = await NetworkApiService.get(url);
    setState(() {
      searching = false;
    });
    // if (clear) return null;
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    debugPrint(jsonResults.toString());
    var searchRes = jsonResults.map((place) {
      return PlaceSearch.fromJson(place);
    }).toList();

    setState(() {
      searchResults = searchRes;
    });
    debugPrint(searchResults.toString());
    return searchResults;
  }

  void gotoPlace(String placeName) async {
    Constant.showDialog();
    clear = true;
    setState(() {
      searchResults.clear();
    });
    List<Location> locations = await locationFromAddress(placeName);
    var center;
    setState(() {
      center = LatLng(locations[0].latitude, locations[0].longitude);
      SessionController().lat = locations[0].latitude;
      SessionController().lon = locations[0].longitude;
    });
    moveCamera(center);
    setState(() {
      searchText.clear();
    });
    Get.back();
  }
}
