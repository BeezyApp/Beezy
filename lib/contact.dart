import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Message {

Message({this.text, this.fromMe});


  final String text;
  final fromMe;
}

class Contact {
  Contact(Key key, String name, bool isGroup, String avatarPath, LatLng _location) {
    this._key = key;
    this._name = name;
    this._isGroup = isGroup;
    this._avatarPath = avatarPath;
    this._location = location;
    if (avatarPath.isEmpty) {
      _bitmapDesctiptor = null;
    } else {
      BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(50, 50)), avatarPath)
          .then((value) => this._bitmapDesctiptor = value);
    }
  }

  Key get key => _key;
  String get name => _name;
  bool get isGroup => _isGroup;
  String get avatarPath => _avatarPath;
  LatLng get location => _location;
  BitmapDescriptor get bitmapDesctiptor => _bitmapDesctiptor;
  List<Message> get messages => _messages;

  Key _key;
  String _name;
  bool _isGroup;
  String _avatarPath;
  LatLng _location;
  BitmapDescriptor _bitmapDesctiptor;
  List<Message> _messages = [
        Message(fromMe:true, text:"Yes?"),
            Message(fromMe:false, text:"You there?"),

    Message(fromMe:false, text:"Hello?"),

  ];

}
