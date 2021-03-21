import 'package:flutter/material.dart';

Widget bottomNavBar() {
  return BottomAppBar(
    notchMargin: 4,
    shape: AutomaticNotchedShape(RoundedRectangleBorder(),
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    child: Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}