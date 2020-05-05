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
  bool _permissionShareLocation = true;

  Widget _settingsItem(String str, SettingsItemType type) {
    switch (type) {
      case SettingsItemType.Toggle:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(str, style: scrollCardItemTextStyle),
            Switch(
              value: _permissionShareLocation,
              onChanged: (value) {
                setState(() {
                  _permissionShareLocation = value;
                });
              },
              activeTrackColor: Colors.amberAccent,
              activeColor: Colors.amber,
            ),
          ],
        );
      case SettingsItemType.TextInput:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
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
                backgroundImage: AssetImage("images/avatar.jpg"),
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
              children: [Text("Han Zheng", style: scrollCardItemTextStyle)],
            )
          ],
        ),
        SizedBox(height: 20),
        _settingsItem("share location to stranger", SettingsItemType.Toggle),
      ],
    );
  }
}
