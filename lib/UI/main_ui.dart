import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/categoryModel.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/productModel.dart';
import 'package:mylcyskdndklcdldcmsdc/addProduct/addProductHome.dart';
import 'package:mylcyskdndklcdldcmsdc/catogeyApp/camion.dart';
import 'package:mylcyskdndklcdldcmsdc/catogeyApp/catogre.dart';
import 'package:mylcyskdndklcdldcmsdc/catogeyApp/catogreElect.dart';
import 'package:mylcyskdndklcdldcmsdc/catogeyApp/quad.dart';
import 'package:mylcyskdndklcdldcmsdc/catogeyApp/work.dart';
import 'package:mylcyskdndklcdldcmsdc/drioer/drioer.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/reddata/reid.dart';
import 'package:mylcyskdndklcdldcmsdc/search/search.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/dielog.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/siez.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/time.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/utles.dart';

import '../allCatogre.dart';
import '../main.dart';

class MainUI extends StatefulWidget {
  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isExpanded = false;
  List<Category> categoryItems;
  List<Product> trendingListItems;
  List<Product> recommendListItems;
  List<Product> dealsListItems;
  double _height;
  double _width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(EcommerceApp.sharedPreferences.getString("phone"));
  }

  List<String> imageList = [
    'assets/icons/cars1.png',
    'assets/icons/m121.png',
    'assets/home/home.png',
    'assets/home/truck.png',
    'assets/icons/portfolio.png',
    'assets/home/quad.png',
    'assets/images/job.png',
    'assets/home/smartphone.png',
    'assets/images/sofa.png',
    'assets/images/bike.png',
    'assets/images/truck.png',
    'assets/images/clothing.png',
    'assets/images/smartphone.png',
  ];
  List<Widget> _widget = [
    Wark(),
    Falter(),
    FalterElectr(),
    Trick(),
    Wark(),
    Quad(),
  ];
  String sso;
  List<String> _widgetText = [
    'nam',
    'Voitures',
    'Maisons',
    'Camions',
    'action',
    'Quads'
  ];
  void ifImage() {
    if (EcommerceApp.sharedPreferences.getString('lan') == "fr") {
      setState(() {
        sso = "assets/cont/m3.png";
      });
    } else if (EcommerceApp.sharedPreferences.getString('lan') == "en") {
      setState(() {
        sso = "assets/cont/m2.png";
      });
    } else if (EcommerceApp.sharedPreferences.getString('lan') == "pt") {
      setState(() {
        sso = "assets/cont/m4.png";
      });
    } else if (EcommerceApp.sharedPreferences.getString('lan') == "de") {
      setState(() {
        sso = "assets/cont/m1.png";
      });
    } else {
      setState(() {
        sso = "assets/cont/m2.png";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ifImage();
    SizeConfig().init(context);
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocale.of(context).getTranslated("homeSc")}"),
        actions: [
          InkWell(
            onTap: () {
              botumShat();
            },
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
              child: Container(
                height: (10),
                width: ScreenUtil().setWidth(60),
                child: Image.asset(sso),
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.search,
                size: ScreenUtil().setSp(30),
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchProduct()));
              }),
        ],
      ),
      drawer: LightDrawerPage(),
      backgroundColor: Colors.grey[50],
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${AppLocale.of(context).getTranslated("new")}",
                        style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                      )),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(10)),
                    height: SizeConfig.screenHeight * 0.35,
                    child: _drawProducts(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8.0)),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                container(
                                    index: 1,
                                    textApp:
                                        "${AppLocale.of(context).getTranslated("Voitures")}"),
                                SizedBox(
                                  width: ScreenUtil().setWidth(10),
                                ),
                                container(
                                    index: 2,
                                    textApp:
                                        "${AppLocale.of(context).getTranslated("en Haus")}"),
                                SizedBox(
                                  width: ScreenUtil().setWidth(10),
                                ),
                                container(
                                    index: 3,
                                    textApp:
                                        "${AppLocale.of(context).getTranslated("Camion")}"),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(120),
                                ),
                                container(
                                    index: 4,
                                    textApp:
                                        "${AppLocale.of(context).getTranslated("Emplois")}"),
                                SizedBox(
                                  width: ScreenUtil().setWidth(10),
                                ),
                                container(
                                    index: 5,
                                    textApp:
                                        "${AppLocale.of(context).getTranslated("quad")}"),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllCato()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: ScreenUtil().setHeight(40),
                                width: SizeConfig.screenWidth * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.blueAccent),
                                child: Text(
                                  "${AppLocale.of(context).getTranslated("view")}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(18)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: ScreenUtil().screenHeight * 0.74,
                left: ScreenUtil().setWidth(10),
                child: InkWell(
                  onTap: () {
                 EcommerceApp.sharedPreferences.getString('phone') ==null ?
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LoadingAlertDialog();
                      },
                    ):
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductsHome()));
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setWidth(50),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: ScreenUtil().setSp(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _drawProducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('all')
          .orderBy('bool', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                ItemModel model =
                    ItemModel.fromJson(snapshot.data.documents[index].data);
                print(model.images);
                return Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            model: model,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      child: Container(
                        width: SizeConfig.screenWidth * 0.47,
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.18,
                              width: SizeConfig.screenWidth * 0.47,
                              child: Stack(
                                children: [
                                  Container(
                                    height: SizeConfig.screenHeight * 0.2,
                                    width: SizeConfig.screenWidth * 0.47,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: model.images.length != 0
                                        ? CachedNetworkImage(
                                            imageUrl: "${model.images[0]}",
                                            placeholder: (context, url) =>
                                                Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 5,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          )
                                        : Image.asset(
                                            "assets/images/not.png",
                                            fit: BoxFit.cover,
                                            width: ScreenUtil().setWidth(30),
                                            height: ScreenUtil().setHeight(30),
                                          ),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: ScreenUtil().setHeight(20),
                                        width: ScreenUtil().setWidth(80),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(5)),
                                          color: Colors.black,
                                        ),
                                        child: AutoSizeText(
                                          "${TimeAgo.timeAgoSinceDate(model.dateTime)}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Card(
                              elevation: 0,
                              child: Container(
                                height: ScreenUtil().setHeight(90),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: ScreenUtil().setHeight(0),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: ScreenUtil().setWidth(160),
                                          child: Text(
                                            "  ${model.title}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    ScreenUtil().setSp(18),
                                                letterSpacing: .5),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(5),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.teal,
                                          size: ScreenUtil().setSp(25),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(6),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setWidth(8)),
                                          child: AutoSizeText(
                                            "${model.address}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(12)),
                                            overflow: TextOverflow.clip,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(10),
                                    ),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: ScreenUtil().setWidth(70),
                                            child: Text(
                                              "  € ${model.price}",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            width:
                                                SizeConfig.screenWidth * 0.03,
                                          ),
                                          Flexible(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.black45),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    ScreenUtil().setWidth(1)),
                                                child: AutoSizeText(
                                                  "${model.cato}",
                                                  style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(12),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }

  Widget container({int index, String textApp}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => _widget[index]));
          },
          child: Container(
            height: SizeConfig.screenHeight * 0.12,
            width: SizeConfig.screenWidth * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(),
            ),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(18)),
              child: Image.asset(
                imageList[index],
                height: ScreenUtil().setHeight(50),
                width: ScreenUtil().setWidth(50),
              ),
            ),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(5),
        ),
        Container(
          width: ScreenUtil().setWidth(100),
          child: Center(
            child: Text(
              "$textApp",
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  void botumShat() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {
                  EcommerceApp.sharedPreferences.setString("lan", "fr");
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
                title: Text("français"),
                leading: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 30,
                    width: 50,
                    child: Image.asset(
                      "assets/cont/m3.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  EcommerceApp.sharedPreferences.setString("lan", "de");
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
                title: Text("Deutsche"),
                leading: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 30,
                    width: 50,
                    child: Image.asset(
                      "assets/cont/m1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  EcommerceApp.sharedPreferences.setString("lan", "en");
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
                title: Text("Lëtzebuergesch"),
                leading: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 30,
                    width: 50,
                    child: Image.asset(
                      "assets/cont/m2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  EcommerceApp.sharedPreferences.setString("lan", "pt");
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
                title: Text("Português"),
                leading: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 30,
                    width: 50,
                    child: Image.asset(
                      "assets/cont/m4.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      enableDrag: false,
    );
  }
}
