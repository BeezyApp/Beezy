import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

ThemeData getPlatformTheme() {
  return defaultTargetPlatform == TargetPlatform.iOS
      ? kIOSTheme
      : kDefaultTheme;
}

double getAppBarElevation(BuildContext context) {
  return Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0;
}

TextStyle appBarTitleStyle = TextStyle(color: Colors.black87);
TextStyle scrollCarTitleStyle = TextStyle(
    fontWeight: FontWeight.normal, fontSize: 24.0, color: Colors.black54);
TextStyle scrollCarItemTextStyle = TextStyle(
    fontWeight: FontWeight.normal, fontSize: 16.0, color: Colors.black);


BorderRadiusGeometry scrollCardBorder = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);
