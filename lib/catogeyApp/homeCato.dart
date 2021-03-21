import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/screen_util.dart';

import 'package:mylcyskdndklcdldcmsdc/tools/time.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';

class CustomCardog extends StatefulWidget {
  final ItemModel model;
  final int index;
  CustomCardog({
    this.model,
    this.index,
  });
  @override
  _CustomCardogState createState() => _CustomCardogState();
}

class _CustomCardogState extends State<CustomCardog> {
  double _width;
  double _height;
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
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
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
                width: ScreenUtil().screenWidth*0.6,
                  child: Text(
                "${widget.model.title}",
                style: textStyle2,
                overflow: TextOverflow.ellipsis,
              )),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                width: _width / 1.60,
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(100),
                      child: Text(
                        "\€ ${widget.model.price}",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(2),
                        color: Colors.grey[200],
                        child: Text(
                          widget.model.isHomeCatogrie !=null?
                        "${widget.model.isHomeCatogrie}":"",
                          softWrap: true,
                          style: TextStyle(fontSize: ScreenUtil().setSp(12)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: ScreenUtil().setSp(25),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Text(
                            "${widget.model.address}",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                            TimeAgo.timeAgoSinceDate(widget.model.dateTime),overflow: TextOverflow.ellipsis,),
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
