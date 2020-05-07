import 'dart:core';
import 'package:Beezy/chat_message.dart';
import 'package:Beezy/chat_page.dart';
import 'package:Beezy/contact.dart';
import 'package:flutter/material.dart';
import 'global.dart';

import 'theme.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({
    Key key,
  }) : super(key: key);

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  List<Widget> _contactWidgets = [];

  Widget createContactItem(Contact contact) {
    return Container(
      child: FlatButton(
        color: Colors.white10,
        padding: EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 8.0),
        child: Row(
          children: <Widget>[
            contact.avatarPath.isEmpty
                ? Material(
                    child: Icon(
                      Icons.account_circle,
                      size: 48,
                      color: Colors.grey,
                    ),
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  )
                : CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(contact.avatarPath),
                  ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 20.0,),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '${contact.name}',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // : EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      children: [ Icon(Icons.record_voice_over, size:14,color: Colors.grey,), SizedBox(width: 5,), Text(
                        'Online',
                        style: TextStyle(color: Colors.grey),
                      ),]
                    )
                  ],
                ),
              ),
            ),Row(
            children: <Widget>[
              SizedBox(width: 10),
              Icon(
                contact.isGroup ? Icons.group : Icons.person,
                color: Colors.grey,
                size: 20,
              ),
              SizedBox(width: 16),
            ],
          ),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(key: contact.key),
              ));
        },
      ),
    );
  }

  @override
  void initState() {
    for (var contact in g_people.values) {
      if(contact.key == g_currentUser.key) continue;
      _contactWidgets.add(createContactItem(contact));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _contactWidgets,
      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
    );
  }
}
