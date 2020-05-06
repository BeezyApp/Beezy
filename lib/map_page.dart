import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tuple/tuple.dart';

import 'theme.dart';
import 'scroll_sheet.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  State createState() => new MapPageState();
}

class MapPageState extends State<MapPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MapPage> {
  Location _locationService = new Location();
  LocationData _startLocation;
  LocationData _currentLocation;
  LatLng _currentLatLng;

  List<Marker> _markers = [];
  List<Tuple2<String, LatLng>> _markerInfo = [
    Tuple2("xi_zhang", LatLng(40.744392, -74.025579)),
    Tuple2("han_zheng", LatLng(40.746213, -74.025424)),
    Tuple2("a", LatLng(40.745238, -74.026067)),
    Tuple2("b", LatLng(40.744710, -74.025802)),
    Tuple2("c", LatLng(40.744669, -74.028667)),
    Tuple2("d", LatLng(40.745457, -74.028302)),
    Tuple2("e", LatLng(40.746353, -74.026999)),
    Tuple2("f", LatLng(40.744134, -74.027707)),
    Tuple2("g", LatLng(40.744841, -74.025754)),
    Tuple2("h", LatLng(40.744345, -74.025615)),
  ];

  CameraPosition _currentCameraPosition;
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(40.745091, -74.024319),
    zoom: 16,
  );

  void _initMapState() async {
    BitmapDescriptor dsc = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), "images/map_marker.png");

    for (var tuple in _markerInfo) {
      _markers.add(
      Marker(
          markerId: MarkerId(tuple.item1),
          draggable: false,
          position: tuple.item2,
          icon: dsc,
          onTap: () =>
            print("tapped" + tuple.item1),
          ),
    );
    }
    

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
              target: LatLng(result.latitude, result.longitude), zoom: 17);

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
        markers: Set.from(_markers),
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
