import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'theme.dart';
import 'friend_map.dart';
import 'message_composer.dart';
import 'chat_message.dart';
import 'scroll_sheet.dart';

void main() {
  runApp(new BeesApp());
}

class BeesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Beezy",
      theme: getPlatformTheme(),
      home: new MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State createState() => new MainScreenState();
}

class MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  // void _sendTextMessage(String text) {
  //   ChatMessage message = new ChatMessage(
  //     text: text,
  //     animationController: new AnimationController(
  //       duration: new Duration(milliseconds: 300),
  //       vsync: this,
  //     ),
  //   );
  //   message.animationController.forward();
  //   setState(() {
  //     _messages.insert(0, message);
  //   });
  // }

  Widget build(BuildContext context) {
    var googleMapContainer = new Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new FriendMap(),
    );

    var scrollSheet = new ScrollSheet();

    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Beezy", style: TextStyle(color: Colors.black87)),
            backgroundColor: Colors.white,
            elevation:
                Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0),
        body: Stack(children: <Widget>[
          googleMapContainer,
          scrollSheet,
          // Container(
          //   child: new Column(children: <Widget>[
          //     googleMapContainer,
          //     new Flexible(
          //       child: new ListView.builder(
          //         padding: new EdgeInsets.all(8.0),
          //         reverse: true,
          //         itemBuilder: (_, int index) => _messages[index],
          //         itemCount: _messages.length,
          //       ),
          //     ),
          //     new Divider(height: 1.0),
          //     new Container(
          //       decoration:
          //           new BoxDecoration(color: Theme.of(context).cardColor),
          //       child: new MessageComposer(
          //         onTextMessage: _sendTextMessage,
          //         onVoiceMessage: _sendVoiceMessage,
          //       ),
          //     ),
          //   ]),
          //   decoration: Theme.of(context).platform == TargetPlatform.iOS
          //       ? new BoxDecoration(
          //           border: new Border(
          //             top: new BorderSide(color: Colors.grey[200]),
          //           ),
          //         )
          //       : null,
          // ),
        ]));
  }
}
