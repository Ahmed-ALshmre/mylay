import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/imageFull/imageFull.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/siez.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/time.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';

import 'imageread.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ReadData extends StatefulWidget {
  final ItemModel model;
  final bool cato;
  final bool isHomeCatogrie;
  const ReadData({Key key, this.model, this.cato, this.isHomeCatogrie})
      : super(key: key);
  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  bool stet = false;
  bool textEdit = false;
  TextEditingController comTextEdit = TextEditingController();
  List<String> imageEss = [
    "assets/images/laptop.png",
    "assets/images/laptop.png",
    "assets/images/laptop.png",
  ];
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                widget.model.images.length != 0
                    ? ProductImages(imageList: widget.model.images)
                    : Container(
                        child: Text("Il n'y a pas de photos"),
                      ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageFull(
                                  imageFull: widget.model.images,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: ScreenUtil().setWidth(19)),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.filter,
                      size: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(5),
                        ),
                        infoProduct(
                          name: TimeAgo.timeAgoSinceDate(widget.model.dateTime),
                          qo: "${AppLocale.of(context).getTranslated("Cas de produits")}",
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        infoProduct(
                          name: "${widget.model.ctay}",
                          qo: "${AppLocale.of(context).getTranslated("Stadt")}",
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        infoProduct(
                          name: "\$ ${widget.model.price}",
                          qo: "${AppLocale.of(context).getTranslated("le prix")}",
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        infoProduct(
                          name: "${widget.model.cato}",
                          qo: "${AppLocale.of(context).getTranslated("Catégorie")}",
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        infoProduct(
                          name: "${widget.model.address}",
                          qo: "${AppLocale.of(context).getTranslated("Adresse")}",
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        infoProduct(
                          name: "${widget.model.id}",
                          qo: "${AppLocale.of(context).getTranslated("Id")}",
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        widget.model.isHomeCatogrie != null
                            ? infoProduct(
                                name: "${widget.model.isHomeCatogrie}",
                                qo: "${AppLocale.of(context).getTranslated("modle")}",
                              )
                            : Container(),
                        widget.isHomeCatogrie
                            ? Divider(
                                thickness: 2,
                              )
                            : Container(),
                        widget.model.catoCarGas != null
                            ? infoProduct(
                                name: "${widget.model.catoCarGas}",
                                qo: "${AppLocale.of(context).getTranslated("Le carburant")}",
                              )
                            : Container(),
                        widget.model.catoCar != null
                            ? Divider(
                                thickness: 2,
                              )
                            : Container(),
                        widget.model.catoCar != null
                            ? infoProduct(
                                name: "${widget.model.catoCar}",
                                qo: "${AppLocale.of(context).getTranslated("Type de voiture")}",
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8,),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${AppLocale.of(context).getTranslated('quatrerouesmotrices')} ::",
                      style: textStyle1,
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         border: Border.all()
                       ),
                       child: Column(
                         children: [
                           Container(
                             padding: EdgeInsets.all(8),
                             alignment: Alignment.centerLeft,
                             child: Text(
                               "${widget.model.title}",
                               style: textStyle2,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                    Divider(thickness: 2,),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      child: Text(
                        "${AppLocale.of(context).getTranslated("Type de voiture")}",
                        style: textStyle1,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(3)
                      ),
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "${widget.model.description}",
                          style: textStyle2,
                        )),
                    Divider(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoProduct({String qo, name}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            "$qo :",
          ),
          Container(
              padding: EdgeInsets.only(top: 4),
              alignment: Alignment.centerRight,
              child: Text(
                name,
                style:TextStyle(color: Colors.black,fontSize: ScreenUtil().setSp(16),) ,
                overflow: TextOverflow.fade,
              )),
        ],
      ),
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
