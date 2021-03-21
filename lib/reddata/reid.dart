import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/reddata/redBody.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  final ItemModel model;

  const DetailsScreen({Key key, this.model}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool cato = false;
  bool isHomeCatogrie = false;
  @override
  void initState() {
    super.initState();
    isAppHome();
  }

  void isAppHome() {
    if (widget.model.catoCar == "une maison") {
      setState(() {
        isHomeCatogrie = true;
      });
    } else if (widget.model.catoCar == "Auto") {
      setState(() {
        cato = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchUrl("tel:${widget.model.number}");
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.call),
      ),
      backgroundColor: Colors.white,
      body: ReadData(
        model: widget.model,
        isHomeCatogrie: isHomeCatogrie,
        cato: cato,
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
