import 'dart:core';
import 'package:Beezy/contact.dart';
import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'global.dart';
import 'theme.dart';

class ChatPage extends StatefulWidget {
  Key _key;

  ChatPage({
    Key key,
  }) : super(key: key) {
    _key = key;
  }

  @override
  _ChatPageState createState() => _ChatPageState(_key);
}

class _ChatPageState extends State<ChatPage> {
  _ChatPageState(Key key) {
    _key = key;
  }

  Key _key;
  final List<Widget> _messages = <Widget>[];
  final TextEditingController _textController = new TextEditingController();

  Future<bool> onBackPressed() {
    Navigator.pop(context);
    return Future.value(false);
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Edit text
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 15.0),
              child: TextField(
                style: TextStyle(color: Colors.black87, fontSize: 15.0),
                controller: _textController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // focusNode: focusNode,
              ),
            ),
          ),

          // Button send message
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => {
                  setState(() {
                    g_people[_key].messages.insert(
                        0, Message(text: _textController.text, fromMe: true));
                    _messages.insert(
                        0,
                        ChatMessage(
                            key: g_currentUser.key,
                            text: _textController.text,
                            fromMe: true));
                    _textController.clear();
                  })
                },
                color: Colors.black87,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white54, width: 0.5)),
          color: Colors.white),
    );
  }

  void _buildMessageList() {
    for (var msg in g_people[_key].messages) {
      _messages.add(ChatMessage(
        key: msg.fromMe ? g_currentUser.key : _key,
        text: msg.text,
        fromMe: msg.fromMe,
      ));
      // _messages.add(Text(msg.text));

    }
  }

  @override
  void initState() {
    _buildMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Colors.yellow[800],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              buildInput(),
            ],
          ),
        ],
      ),
      // onWillPop: onBackPressed,
    );
  }
}
