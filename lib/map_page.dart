import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'theme.dart';
import 'scroll_sheet.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  State createState() => new MapPageState();
}

class MapPageState extends State<MapPage>
    with
        // TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<MapPage> {
  Location _locationService = new Location();
  LocationData _startLocation;
  LocationData _currentLocation;
  LatLng _currentLatLng;

  CameraPosition _currentCameraPosition;
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(0, 0),
    zoom: 4,
  );

  void _initMapState() async {
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.high, interval: 1000);
    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        location = await _locationService.getLocation();
        _locationService.onLocationChanged.listen((LocationData result) async {
          _currentCameraPosition = CameraPosition(
              target: LatLng(result.latitude, result.longitude), zoom: 16);

          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(
              CameraUpdate.newCameraPosition(_currentCameraPosition));
          if (mounted) {
            setState(() {
              _currentLocation = result;
            });
          }
        });
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          _initMapState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      location = null;
    }

    setState(() {
      _startLocation = location;
      _currentLatLng =
          LatLng(_startLocation.latitude, _startLocation.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    _initMapState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      key: PageStorageKey('map'),
      parallaxEnabled: true,
      parallaxOffset: .5,
      minHeight: 85,
      borderRadius: scrollCardBorder,
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: _initialCamera,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      panelBuilder: (sc) => ScrollSheet(scrollController: sc),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
