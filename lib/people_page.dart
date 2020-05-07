import 'dart:core';
import 'package:Beezy/chat_message.dart';
import 'package:Beezy/chat_page.dart';
import 'package:Beezy/contact.dart';
import 'package:flutter/material.dart';

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
                margin: EdgeInsets.only(left: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      child: Text(
                        '${contact.name}',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'About me: place holder',
                        style: TextStyle(color: Colors.black87),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                    //   peerId: document.documentID,
                    //   peerAvatar: document['photoUrl'],
                    // ))
                    ),
              ));
        },
      ),
    );
  }

  @override
  void initState() {
    for (var contact in g_people) {
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
