// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  final LatLng latLng;
  const GoogleMapWidget({
    required this.latLng,
  });

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  // LatLng _initialPos = const LatLng(33.626057, 73.071442);

  final Completer<GoogleMapController> mapCmpleter = Completer();
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      zoomGesturesEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: false,
      rotateGesturesEnabled: false,
      mapType: MapType.normal,
      onLongPress: null,
      onTap: null,
      mapToolbarEnabled: false,
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        _onMapCreated(controller);
      },
      initialCameraPosition: CameraPosition(
        target: widget.latLng,
        zoom: 3.0,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapCmpleter.complete(controller);
    _setMarkers();
  }

  void _setMarkers() {
    LatLngBounds bound;
    try {
      bound = LatLngBounds(southwest: widget.latLng, northeast: widget.latLng);
    } catch (e) {
      bound = LatLngBounds(southwest: widget.latLng, northeast: widget.latLng);
    }

    setState(() {
      markers.clear();
      _addMarker(widget.latLng);
    });

    CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
    mapController!.animateCamera(u2).then((void v) {
      _check(u2, mapController!);
    });
  }

  void _addMarker(LatLng mLatLng) {
    markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId((mLatLng.toString()).toString()),
      position: mLatLng,
      infoWindow: const InfoWindow(
        title: '',
        snippet: '',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  void _check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    mapController!.animateCamera(u);
    //11122
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      _check(u, c);
    }
  }
}
