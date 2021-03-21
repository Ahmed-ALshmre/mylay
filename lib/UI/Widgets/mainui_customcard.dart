import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/siez.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/time.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';


class CustomCard extends StatefulWidget {
  final ItemModel model;
  final int index;
  CustomCard({
    this.model,
    this.index,
  });
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  double _width;
  double _height;
  double _aspectRatio;
  String formattedDate;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Container(
      color: (widget.index % 2 == 0) ? Colors.white : Colors.grey[100],
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
                  ? CachedNetworkImage(
                      imageUrl: "${widget.model.images[0]}",
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : Image.asset(
                      "assets/images/not.png",
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(50),
                      height: getProportionateScreenHeight(50),
                    ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              Container(
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(220),
                  child: AutoSizeText(
                    "${widget.model.title}",
                    style: textStyle2,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: _width / 2.10,
                padding: EdgeInsets.only(top: getProportionateScreenHeight(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        "€ ${widget.model.price}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(2)),
                        color: Colors.grey[200],
                        child: Text(
                          "${widget.model.cato}",
                          softWrap: true,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: _width / 1.70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        Icon(
                          Icons.location_on,
                          size: _height / 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(7)),
                          alignment: Alignment.centerLeft,
                          height: getProportionateScreenHeight(40),
                          width: getProportionateScreenWidth(100),
                          child: Text(
                            "${widget.model.address}",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          height: 15,
                          width: 110,
                          child: AutoSizeText(
                              TimeAgo.timeAgoSinceDate(widget.model.dateTime)),
                        ),
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
}
