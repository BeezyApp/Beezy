import 'package:Beezy/chat_page.dart';
import 'package:Beezy/global.dart';
import 'package:Beezy/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ScrollSheet extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollSheet({
    @required this.scrollController,
  }) : super();

  @override
  _ScrollSheetState createState() => _ScrollSheetState();
}

class _ScrollSheetState extends State<ScrollSheet> {
  Widget cardsWidget(itemIndex) => Container(
        margin: EdgeInsets.all(24),
      );

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        controller: widget.scrollController,
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Explore Around",
                style: scrollCarTitleStyle,
              ),
            ],
          ),
          SizedBox(
            height: 38.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _item(Key("Berry_E")),
              _item(Key("Chris_E")),
              _item(Key("Rebecca_Zhang")),
              
              SizedBox(height: 10),
              _item(Key("Library_Chat")),
              _item(Key("SCSC")),
              _item(Key("CS545")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item(Key key) {
    return FlatButton(
      color: Colors.white10,
      // padding: EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Container(
                margin: const EdgeInsets.all(10),
                // padding: const EdgeInsets.all(12.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(g_people[key].avatarPath),
                ),
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    blurRadius: 10.0,
                  )
                ]),
              ),
              SizedBox(width: 5),
              Text(g_people[key].name, style: scrollCardItemTextStyle),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Icon(
                g_people[key].isGroup ? Icons.group : Icons.person,
                color: Colors.black87,
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
              builder: (context) => ChatPage(key: key),
            ));
      },
    );
  }
}
