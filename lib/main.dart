import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click button to back to Main Page'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Back to Main Page'),
              onPressed: () {
                // TODO
              },
            )
          ],
        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: Text('Lorem Ipsum'),
        subtitle: Text('$index'),
      );
    });
  }
}

class MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> _children = [
    SlidingUpPanel(
        key: PageStorageKey('map'),
        parallaxEnabled: true,
        parallaxOffset: .5,
        minHeight: 85,
        borderRadius: scrollCardBorder,
        body: FriendMap(),
        panelBuilder: (sc) => ScrollSheet(scrollController: sc)),
    FriendMap(
      key: PageStorageKey('test1'),
    ),
    DraggableScrollableSheet(
        key: PageStorageKey('test2'),
        initialChildSize: 0.3,
        minChildSize: 0.1,
        maxChildSize: 0.8,
        builder: (BuildContext context, myscrollController) {
          return Container(
            color: Colors.tealAccent[200],
            child: ListView.builder(
              controller: myscrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(
                  'Dish $index',
                  style: TextStyle(color: Colors.black54),
                ));
              },
            ),
          );
        }),
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
      onTap: onTabTapped, // new
      currentIndex: _currentIndex, // new
      items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          title: Text('Map'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.people),
          title: Text('People'),
        ),
        new BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Settings')),
      ],
    );

    return new Scaffold(
      appBar: appBar,
      body: PageStorage(child: _children[_currentIndex], bucket: _bucket),
      bottomNavigationBar: navBar,
    );
  }
}

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
