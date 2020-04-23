import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FriendMap extends StatefulWidget {
  @override
  State createState() => new FriendMapState();
}

class FriendMapState extends State<FriendMap> with TickerProviderStateMixin {
  Location _locationService = new Location();
  LocationData _startLocation;
  LocationData _currentLocation;

  GoogleMap _googleMap;
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
        _locationService.onLocationChanged
        .listen((LocationData result) async {
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
    });
  }

  @override
  void initState() {
    super.initState();
    _initMapState();
  }

  @override
  Widget build(BuildContext context) {
    _googleMap = new GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      initialCameraPosition: _initialCamera,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );

    return _googleMap;
  }
}
