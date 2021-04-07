import 'package:flutter/material.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/utles.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';
import 'homeDelet.dart';

class LightDrawerPage extends StatefulWidget {
  static final String path = "lib/src/pages/navigation/drawer2.dart";
  @override
  _LightDrawerPageState createState() => _LightDrawerPageState();
}

class _LightDrawerPageState extends State<LightDrawerPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
            color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.power_settings_new,
                      color: active,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.deepOrange])),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/iconapp/icon.png"),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  EcommerceApp.sharedPreferences.getString("name") != null
                      ? "${EcommerceApp.sharedPreferences.getString("name")}"
                      : "MY Luxbazr",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  EcommerceApp.sharedPreferences.getString("name") != null
                      ? "@${EcommerceApp.sharedPreferences.getString("name")}"
                      : "@MY Luxbazr",
                  style: TextStyle(color: active, fontSize: 16.0),
                ),
                SizedBox(height: 30.0),
                _buildRow(Icons.home,
                    "${AppLocale.of(context).getTranslated("page principale")}",
                    () {
                  Navigator.pop(context);
                }, false),
                _buildDivider(),
                _buildRow(Icons.bookmark_border,
                    "${AppLocale.of(context).getTranslated("Mes spectacles")}",
                    () {
                  EcommerceApp.sharedPreferences.getString("phone") != null
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DeletHome()))
                      : Fluttertoast.showToast(
                          msg:
                              "${AppLocale.of(context).getTranslated("login_first")}");
                }, false),
                _buildDivider(),
                _buildRow(Icons.eighteen_mp,
                    "${AppLocale.of(context).getTranslated("línguas")}", () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: InkWell(
                                child: Text(
                                  "français",
                                  style: textStyle1,
                                ),
                                onTap: () {
                                  EcommerceApp.sharedPreferences
                                      .setString("lan", "fr");
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MyApp()));
                                },
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: InkWell(
                                child: Text(
                                  "Deutsche",
                                  style: textStyle1,
                                ),
                                onTap: () {
                                  EcommerceApp.sharedPreferences
                                      .setString("lan", "de");
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MyApp()));
                                },
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: InkWell(
                                child: Text(
                                  "Lëtzebuergesch",
                                  style: textStyle1,
                                ),
                                onTap: () {
                                  EcommerceApp.sharedPreferences
                                      .setString("lan", "en");
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MyApp()));
                                },
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: InkWell(
                                child: Text(
                                  "Português",
                                  style: textStyle1,
                                ),
                                onTap: () {
                                  EcommerceApp.sharedPreferences
                                      .setString("lan", "pt");
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MyApp()));
                                },
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                    enableDrag: false,
                  );
                }, true),
                _buildDivider(),
                _buildRow(Icons.email,
                    "${AppLocale.of(context).getTranslated("Contact us")}",
                    () async {
                  launchUrl("mailto:Myluxxbazar@gmail.com");
                }, false),
                _buildDivider(),
                _buildRow(Icons.info_outline,
                    "${AppLocale.of(context).getTranslated("Help")}", () {
                  launchUrl("mailto:Myluxxbazar@gmail.com");
                }, false),
                _buildDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch("$url");
    } else {
      throw "Could not launch $url";
    }
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title, Function function, bool image,
      {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: [
          image
              ? Image.asset(
                  "assets/icon/lang.png",
                  width: 30,
                )
              : Icon(
                  icon,
                  color: active,
                ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
          Spacer(),
          if (showBadge)
            Material(
              color: Colors.deepOrange,
              elevation: 5.0,
              shadowColor: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  "10+",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
        ]),
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
