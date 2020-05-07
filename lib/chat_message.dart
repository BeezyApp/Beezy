import 'package:Beezy/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.key, this.animationController, this.fromMe});
  // final String avatarPath;
  final String text;
  final Key key;
  final bool fromMe;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    var avatar = CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(g_people[key].avatarPath),
                  );

    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment:
            fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          fromMe
              ? SizedBox(
                  width: 0,
                )
              : avatar,
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment:
                fromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              new Text(g_people[key].name, style: Theme.of(context).textTheme.subtitle1),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          fromMe
              ? avatar
              : SizedBox(
                  width: 0,
                ),
        ],
      ),
    );
  }
}
