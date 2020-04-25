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
              _item("Stevens Computer Science Club ", Icons.favorite,
                  Colors.blue, true),
              _item("CS545 Discussion", Icons.restaurant, Colors.red, true),
              _item("Library Chat", Icons.event, Colors.amber, true),
              SizedBox(height: 10),
              _item("Xi Zhang", Icons.more_horiz,
                  Colors.green, false),
            ],
          ),
        ]));
  }

  Widget _item(String label, IconData icon, Color color, bool isGroup) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 5.0,
                      )
                    ]),
              ),
              SizedBox(width: 5),
              Text(label, style: scrollCarItemTextStyle),
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
