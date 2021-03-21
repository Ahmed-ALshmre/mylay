import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylcyskdndklcdldcmsdc/UI/main_ui.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/botumn.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/utles.dart';
import 'dart:math';
import 'package:flutter_screenutil/screen_util.dart';

class UrlWhat extends StatefulWidget {
  final List<Asset> images;
  final String isHom;
  final String catogSelcat;
  final String title;
  final String price;
  final String dic;
  final String cato;
  final String newProduct;
  final String categoryCar;
  final String categoryCarGas;
  final String address;
  final String cont;
  const UrlWhat(
      {Key key,
      this.images,
      this.catogSelcat,
      this.title,
      this.price,
      this.dic,
      this.cato,
      this.newProduct,
      this.categoryCar,
      this.address,
      this.categoryCarGas,
      this.isHom,
      this.cont})
      : super(key: key);
  @override
  _UrlWhatState createState() => _UrlWhatState();
}

class _UrlWhatState extends State<UrlWhat> {
  List<String> imageUrls = <String>[];
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.images.length);
    textEditingController.text =
        EcommerceApp.sharedPreferences.getString("phone");
    prise();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  String priceMain;
  void prise() {
    if (widget.price.length <= 2) {
      setState(() {
        priceMain = "100";
      });
    } else if (widget.price.length <= 3) {
      setState(() {
        priceMain = "1000";
      });
    } else if (widget.price.length <= 4) {
      setState(() {
        priceMain = "10000";
      });
    } else if (widget.price.length >= 5) {
      setState(() {
        priceMain = "100000";
      });
    }
    print(priceMain);
  }

  String colegshen;
  void chackCol() {
    if (widget.cato == "immobilier" ||
        widget.cato == "ein Haus" ||
        widget.cato == "en Haus" ||
        widget.cato == "uma casa") {
      setState(() {
        colegshen = "une maison";
      });
    } else if (widget.cato == "PC") {
      setState(() {
        colegshen = "PC";
      });
    } else if (widget.cato == "Auto") {
      setState(() {
        colegshen = "Auto";
      });
    } else if (widget.cato == "Articles ménagers" ||
        widget.cato == "Haushaltsgegenstände" ||
        widget.cato == "Haushaltsartikelen" ||
        widget.cato == "Coisas de casa") {
      setState(() {
        colegshen = "Articles ménagers";
      });
    } else if (widget.cato == "moto" ||
        widget.cato == "Motorrad" ||
        widget.cato == "Motorrad" ||
        widget.cato == "motocicleta") {
      setState(() {
        colegshen = "moto";
      });
    } else if (widget.cato == "Mobile" ||
        widget.cato == "Mobiltelefon" ||
        widget.cato == "Mobile" ||
        widget.cato == "Móvel") {
      setState(() {
        colegshen = "Moble";
      });
    } else if (widget.cato == "Emplois" ||
        widget.cato == "Aarbechtsplazen" ||
        widget.cato == "Empregos" ||
        widget.cato == "Arbeitsplätze") {
      setState(() {
        colegshen = "Emplois";
      });
    } else if (widget.cato == "Camion" ||
        widget.cato == "Lastwagen" ||
        widget.cato == "Camion" ||
        widget.cato == "Caminhão") {
      setState(() {
        colegshen = "Camion";
      });
    } else if (widget.cato == "Vêtements" ||
        widget.cato == "Kleidung" ||
        widget.cato == "Roupas" ||
        widget.cato == "Kleedung") {
      setState(() {
        colegshen = "clothes";
      });
    } else if (widget.cato == "Divertissement" ||
        widget.cato == "Unterhaltung" ||
        widget.cato == "Ënnerhalung" ||
        widget.cato == "Entretenimento") {
      setState(() {
        colegshen = "happy";
      });
    } else if (widget.cato == "Quad") {
      setState(() {
        colegshen = "quad";
      });
    } else {
      colegshen = "else";
      print(colegshen);
    }
  }

  bool isUplode = false;
  String formattedDate;
  @override
  Widget build(BuildContext context) {
    chackCol();
    var now = new DateTime.now();
    var formatter = new DateFormat("dd-MM-yyyy h:mma");
    formattedDate = formatter.format(now);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
            "${AppLocale.of(context).getTranslated("Complétez la demande")}"),
        centerTitle: true,
      ),
      body:
          isUplode ? Center(child: CircularProgressIndicator()) : bodyUploade(),
    );
  }

  Widget bodyUploade() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
            child: Container(
              alignment: Alignment.center,
              child: AutoSizeText(
                "${AppLocale.of(context).getTranslated("besoin_de_certaines")}",
                style: textStyle2,
                maxLines: 1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(4)),
            child: Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "${AppLocale.of(context).getTranslated("clients_puissent")}",
                  style: textStyle2,
                  maxLines: 1,
                )),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(60),
          ),
          textFieldNumber2(
            context,
            controller: textEditingController,
            hint: "${AppLocale.of(context).getTranslated("phone")}",
            title: "${AppLocale.of(context).getTranslated("phone")}",
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          ButIn(
            butIn: () {
              setState(() {
                isUplode = true;
              });
              if (widget.images.length == 0) {
                String documnetID =
                    DateTime.now().millisecondsSinceEpoch.toString();
                String id = Random().nextInt(100000).toString() + '#';
                Firestore.instance
                    .collection(colegshen)
                    .document(documnetID)
                    .setData({
                  "bool": true,
                  "title": widget.title,
                  "isHomeCatogrie": widget.isHom,
                  "price": widget.price,
                  "man": priceMain,
                  "categoryCar": widget.categoryCar,
                  "cato": widget.cato,
                  "dic": widget.dic,
                  "categoryCarGas": widget.categoryCarGas,
                  "address": widget.address,
                  "newProduct": widget.newProduct,
                  "phone": textEditingController.text,
                  "dateTime": formattedDate.toString(),
                  "documnetID": documnetID,
                  "uid": EcommerceApp.sharedPreferences.getString("uid"),
                  "id": id.toString(),
                  "cont": widget.cont,
                  "urls": [],
                }).then((_) {
                  Firestore.instance
                      .collection('all')
                      .document(documnetID)
                      .setData({
                    "title": widget.title,
                    "urls": [],
                    "cont": widget.cont,
                    "isHomeCatogrie": widget.isHom,
                    "bool": true,
                    "documnetID": documnetID,
                    "man": priceMain,
                    "uid": EcommerceApp.sharedPreferences.getString("uid"),
                    "id": id.toString(),
                    "price": widget.price,
                    "categoryCar": widget.categoryCar,
                    "cato": widget.cato,
                    "dic": widget.dic,
                    "categoryCarGas": widget.categoryCarGas,
                    "address": widget.address,
                    "newProduct": widget.newProduct,
                    "phone": textEditingController.text,
                    "dateTime": formattedDate.toString(),
                  }).then((_) {
                    setState(() {
                      isUplode = false;
                      imageUrls = [];
                      widget.images.clear();
                    });
                  });
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (co) => MainUI()));
                  Fluttertoast.showToast(msg: "Votre offre a été ajoutée");
                });
              }
              uploadImages();
            },
            textButIn: "${AppLocale.of(context).getTranslated("Se propager")}",
          ),
        ],
      ),
    );
  }

  Widget textFieldNumber2(context,
      {String title,
      hint,
      double h,
      w,
      int max,
      TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: textStyle1,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            height: h,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[50]),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                cursorColor: Colors.black,
                cursorRadius: Radius.circular(12),
                cursorHeight: 30,
                keyboardType: TextInputType.phone,
                autofocus: true,
                maxLines: max,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontSize: 16, color: Colors.teal.withOpacity(0.5)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void uploadImages() {
    for (var imageFile in widget.images) {
      postImage(imageFile).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
        if (imageUrls.length == widget.images.length) {
          String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
          String id = Random().nextInt(100000).toString() + '#';
          Firestore.instance
              .collection(colegshen)
              .document(documnetID)
              .setData({
            "title": widget.title,
            "bool": true,
            "cont": widget.cont,
            "price": widget.price,
            "isHomeCatogrie": widget.isHom,
            "documnetID": documnetID,
            "uid": EcommerceApp.sharedPreferences.getString("uid"),
            "categoryCar": widget.categoryCar,
            "cato": widget.cato,
            "dic": widget.dic,
            "categoryCarGas": widget.categoryCarGas,
            "address": widget.address,
            "newProduct": widget.newProduct,
            "phone": textEditingController.text,
            "dateTime": formattedDate.toString(),
            "id": id.toString(),
            "man": priceMain,
            'urls': imageUrls
          }).then((_) {
            Firestore.instance.collection('all').document(documnetID).setData({
              "title": widget.title,
              "bool": true,
              "isHomeCatogrie": widget.isHom,
              "id": id.toString(),
              "cont": widget.cont,
              "price": widget.price,
              "man": priceMain,
              "categoryCar": widget.categoryCar,
              "cato": widget.cato,
              "dic": widget.dic,
              "documnetID": documnetID,
              "uid": EcommerceApp.sharedPreferences.getString("uid"),
              "categoryCarGas": widget.categoryCarGas,
              "address": widget.address,
              "newProduct": widget.newProduct,
              "phone": textEditingController.text,
              "dateTime": formattedDate.toString(),
              'urls': imageUrls
            }).then((_) {
              setState(() {
                isUplode = false;
                imageUrls = [];
                widget.images.clear();
              });
            });
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (co) => MainUI()));
            Fluttertoast.showToast(msg: "Votre offre a été ajoutée");
          });
        }
      }).catchError((err) {
        print("we have e");
        print(err);
      });
    }
  }

  Future<dynamic> postImage(Asset imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask =
        reference.putData((await imageFile.getByteData()).buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }
}
