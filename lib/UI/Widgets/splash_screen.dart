import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main_ui.dart';
class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  AnimationController animationController;
  Animation<double> animation;
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, chackInt);
  }

  void chackInt() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("mobile");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainUI()));
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("wifi");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainUI()));
    }else{
      Fluttertoast.showToast(msg: "No internet connection");
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/iconapp/icon.png"),
      ),
    );
  }
}
