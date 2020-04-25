import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class ScrollSheet extends StatefulWidget {
  @override
  State createState() => new ScrollSheetState();
}

class ScrollSheetState extends State<ScrollSheet>
    with TickerProviderStateMixin {
      
  Widget cardsWidget(itemIndex) => Container(
        margin: EdgeInsets.all(24),
      );

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.8,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              color: Colors.white,
            ),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 2),
                controller: scrollController,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return cardsWidget(index);
                }),
          );
        });
  }
}
