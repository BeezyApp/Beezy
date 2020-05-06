import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Contact> g_people = [
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
  Contact("xi_zhang", "Xi Zhang", false, "images/people_xi.png"),
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
