import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/time.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';

class DeleatDoc extends StatefulWidget {
  final ItemModel model;
  final int index;
  DeleatDoc({
    this.model,
    this.index,
  });
  @override
  _DeleatDocState createState() => _DeleatDocState();
}

class _DeleatDocState extends State<DeleatDoc> {
  double _width;
  double _height;
  double _aspectRatio;
  String formattedDate;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              width: _width / 3.2,
              height: _height / 6,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orange[50],
              ),
              child: widget.model.images.length != 0
                  ? Image.network(
                      "${widget.model.images[0]}",
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/not.png",
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Container(
                  height: 40,
                  width: 220,
                  child: AutoSizeText(
                    "${widget.model.title}",
                    style: textStyle2,
                overflow: TextOverflow.ellipsis,
                  ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                width: _width / 2.10,
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        "${widget.model.price}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(2),
                        color: Colors.grey[200],
                        child: Text(
                          "${widget.model.cato}",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                width: _width / 1.70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: delete,
                          child: Icon(
                            Icons.delete,
                            size: _height / 25,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 100,
                          child: Text(
                            "${widget.model.address}",
                            style: TextStyle(fontSize: _height / 50),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                            TimeAgo.timeAgoSinceDate(widget.model.dateTime)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> delete() async {
    print(widget.model.documnetID);
    await Firestore.instance
        .collection('all')
        .document(widget.model.documnetID)
        .delete()
        .then((value) async {
      await Firestore.instance
          .collection(widget.model.cato)
          .document(widget.model.documnetID)
          .delete();
    }).catchError((e) {
      print(e.toString());
      print("error");
    });
  }
}
