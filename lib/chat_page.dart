import 'dart:core';
import 'package:Beezy/contact.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

class ChatPage extends StatefulWidget {
  Contact _contact;

  ChatPage({
    Contact contact,
    Key key,
  }) : super(key: key) {
    _contact = contact;
  }

  @override
  _ChatPageState createState() => _ChatPageState(_contact);
}

class _ChatPageState extends State<ChatPage> {
  Contact _contact;

  _ChatPageState(Contact contact) {
    _contact = contact;
  }

  Future<bool> onBackPressed() {
    Navigator.pop(context);
    return Future.value(false);
  }

  // ChatMessage
  Widget _buildMessageList() {
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildMessageList(),
              // buildInput(),
            ],
          ),
        ],
      ),
      onWillPop: onBackPressed,
    );
  }
}
