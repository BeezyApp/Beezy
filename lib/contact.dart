import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Contact> g_people = [
  Contact("Aaron_B", "Aaron B", false, "images/people_aaron.png"),
  Contact("Berry_E", "Berry E", false, "images/people_berry.png"),
  Contact("Chris_E", "Chris E", false, "images/people_chris.png"),
  Contact("Dana_Z", "Dana Z", false, "images/people_dana.png"),
  Contact("Evan_Y", "Evan Y", false, "images/people_evan.png"),
  Contact("Grace_Be", "Grace Be", false, "images/people_grace.png"),
  Contact("Tim_Zheng", "Tim Zheng", false, "images/people_tim.png"),
  Contact("Rebecca_Zhang", "Rebecca Zhang", false, "images/people_rebecca.png"),
  Contact("Python_CWI", "Python CWI", false, "images/people_python.png"),
  Contact("Flutter_Google", "Flutter Google", false, "images/people_flutter.png"),
];

class Contact {
  Contact(String key, String name, bool isGroup, String avatarPath) {
    this._key = key;
    this._name = name;
    this._isGroup = isGroup;
    this._avatarPath = avatarPath;
    if (avatarPath.isEmpty) {
      _bitmapDesctiptor = null;
    } else {
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(50, 50)), avatarPath)
          .then((value) => this._bitmapDesctiptor = value);
    }
  }

  String get key => _key;
  String get name => _name;
  bool get isGroup => _isGroup;
  String get avatarPath => _avatarPath;
  BitmapDescriptor get bitmapDesctiptor => _bitmapDesctiptor;

  String _key;
  String _name;
  bool _isGroup;
  String _avatarPath;
  BitmapDescriptor _bitmapDesctiptor;
}
