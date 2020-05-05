import 'package:Beezy/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScrollSheet extends StatelessWidget {
  final ScrollController scrollController;

  const ScrollSheet({
    @required this.scrollController,
  }) : super();

  Widget cardsWidget(itemIndex) => Container(
        margin: EdgeInsets.all(24),
      );

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(controller: scrollController, children: <Widget>[
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
              _item("Library Chat", "images/group_library.jpg", true),
              SizedBox(height: 10),
              _item("Stevens Computer Science Club ","images/group_scsc.jpg", true),
              _item("CS545 Discussion", "images/group_hci.jpg", true),
              
              _item("Xi Zhang", "images/people_xi.png", false),
            ],
          ),
        ]));
  }

  Widget _item(String label, String avatar, bool isGroup) {
    return Row(
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
                  backgroundImage: AssetImage(avatar),
                ),
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    blurRadius: 10.0,
                  )
                ]),
              ),
              SizedBox(width: 5),
              Text(label, style: scrollCardItemTextStyle),
            ],
          ),
          Row(children: <Widget>[
            SizedBox(width: 10),
            Icon(
              isGroup ? Icons.group : Icons.person,
              color: Colors.black87,
            ),
            SizedBox(width: 16),
          ]),
        ]);
  }
}
