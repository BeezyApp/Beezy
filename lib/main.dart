import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'theme.dart';
import 'map_page.dart';
import 'settings_page.dart';
import 'people_page.dart';
import 'message_composer.dart';
import 'chat_message.dart';

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
  int _currentIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();
  final List<Widget> _children = [
    MapPage(key: PageStorageKey('map_page')),
    PeoplePage(),
    SettingsPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    var appBar = AppBar(
        title: Text("Beezy", style: appBarTitleStyle),
        backgroundColor: Colors.white,
        elevation: getAppBarElevation(context));

    var navBar = BottomNavigationBar(
      selectedItemColor: Colors.amber[800],
      onTap: onTabTapped, // new
      currentIndex: _currentIndex, // new
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          title: Text('Map'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          title: Text('People'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Settings')),
      ],
    );

    var bodyPages = PageStorage(
      child: _children[_currentIndex],
      bucket: _bucket,
    );

    return Scaffold(
      appBar: appBar,
      body: bodyPages,
      bottomNavigationBar: navBar,
    );
  }
}


//! Draggable scrollable sheet
// DraggableScrollableSheet(
//         key: PageStorageKey('test2'),
//         initialChildSize: 0.3,
//         minChildSize: 0.1,
//         maxChildSize: 0.8,
//         builder: (BuildContext context, myscrollController) {
//           return Container(
//             color: Colors.tealAccent[200],
//             child: ListView.builder(
//               controller: myscrollController,
//               itemCount: 25,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                     title: Text(
//                   'Dish $index',
//                   style: TextStyle(color: Colors.black54),
//                 ));
//               },
//             ),
//           );
//         });


//! Chat

// final List<ChatMessage> _messages = <ChatMessage>[];
// final TextEditingController _textController = new TextEditingController();

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

// ScrollSheet(),
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
