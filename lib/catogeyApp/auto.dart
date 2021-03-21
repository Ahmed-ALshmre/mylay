import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/time.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';


class Auto extends StatefulWidget {
  final ItemModel model;
  final int index;
  final String sel;
  Auto({
    this.model,
    this.index,
    this.sel,
  });
  @override
  _AutoState createState() => _AutoState();
}

class _AutoState extends State<Auto> {
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
              width: ScreenUtil().screenWidth * 0.32,
              height: ScreenUtil().screenHeight * 0.2,
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
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                  width: ScreenUtil().setWidth(210),
                  child: Text(
                    "${widget.model.title}",
                    style: textStyle2,
                    overflow: TextOverflow.ellipsis,
                  )),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                width: _width / 2.10,
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: AutoSizeText(
                        " \$${widget.model.price}",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(ScreenUtil().setSp(2)),
                        color: Colors.grey[200],
                        child: AutoSizeText(
                          "${widget.sel}",
                          softWrap: true,
                          style: TextStyle(fontSize: ScreenUtil().setSp(14)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20),
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
                        Icon(
                          Icons.location_on,
                          size: ScreenUtil().setSp(25),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "${widget.model.address}",
                            style: TextStyle(fontSize: ScreenUtil().setSp(14)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            TimeAgo.timeAgoSinceDate(widget.model.dateTime),
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                            overflow: TextOverflow.clip,
                          ),
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
