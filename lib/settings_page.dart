import 'package:Beezy/global.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

enum SettingsItemType {
  Toggle,
  TextInput,
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key key,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<String, bool> _permissionSettings = {
    "location_share_stranger": true,
    "notification_stranger": true,
    "notification_friend": true,
    "notification_friend_nearby": false,
  };

  Widget _settingsCategory(String str) {
    return Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: Row(
        
        children: [SizedBox(width: 15,),
          Text(str,
          style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
  
  Widget _settingsItem(String str, SettingsItemType type, String key) {
    switch (type) {
      case SettingsItemType.Toggle:
        return SwitchListTile(
          value: _permissionSettings[key],
          title: Text(str),
          onChanged: (value) {
            setState(() {
              _permissionSettings[key] = value;
            });
          },
        );
      case SettingsItemType.TextInput:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 25.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                radius: 38,
                backgroundImage: AssetImage(g_currentUser.avatarPath),
              ),
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 20.0,
                )
              ]),
            ),
            SizedBox(height: 15),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text(g_currentUser.name, style: scrollCardItemTextStyle)])
          ],
        ),
        SizedBox(height: 20),
        _settingsCategory("Permissions"),
        _settingsItem("share location to stranger", SettingsItemType.Toggle,
            "location_share_stranger"),
                    _settingsCategory("Notifications"),

        _settingsItem("stranger message notification", SettingsItemType.Toggle,
            "notification_stranger"),
        _settingsItem("friend message notification", SettingsItemType.Toggle,
            "notification_friend"),
        _settingsItem("friend nearby notification", SettingsItemType.Toggle,
            "notification_friend_nearby"),
      ],
    );
  }
}
