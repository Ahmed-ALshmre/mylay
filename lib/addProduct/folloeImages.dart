import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mylcyskdndklcdldcmsdc/addProduct/urlWath.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/botumn.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:mylcyskdndklcdldcmsdc/addProduct/toolsUplode/listCat.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/utles.dart';
import 'package:flutter_screenutil/screen_util.dart';

class SingleImageUpload extends StatefulWidget {
  final String catogSelcat;
  final String title;
  final String price;
  final String dic;
  final String cato;
  final String newProduct;
  const SingleImageUpload(
      {Key key,
      this.catogSelcat,
      this.title,
      this.price,
      this.dic,
      this.cato,
      this.newProduct})
      : super(key: key);
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<SingleImageUpload> {
  List<Asset> images = List<Asset>();
  List<String> imageUrls = <String>[];
  String _error = 'No Error Dectected';
  bool imageBool = false;
  List<String> gesList;
  bool isUploading = false;
  List<String> selctList;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController contTextEditingController = TextEditingController();
  List<File> imagedjs = [];
  String selctCarCat;
  String isHomeCatogrie;
  String selcetGasCar;
  bool isHomeCat = false;
  @override
  void initState() {
    super.initState();
    valueList();
    selsctList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
    contTextEditingController.dispose();
  }

  String dropdownValue;
  String dropdownValue2;
  bool isLast = false;
  void valueList() {
    if (EcommerceApp.sharedPreferences.getString("lan") == "fr") {
      setState(() {
        dropdownValue = "Choisir";
        dropdownValue2 = "Choisir";
        gesList = gesListFr;
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "de") {
      setState(() {
        dropdownValue = "Wählen";
        dropdownValue2 = "Wählen";
        gesList = gesListDe;
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "en") {
      setState(() {
        dropdownValue = "Raussichen";
        dropdownValue2 = "Raussichen";
        gesList = gesListEn;
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "pt") {
      setState(() {
        gesList = gesListPt;
        dropdownValue = "Escolher";
        dropdownValue2 = "Escolher";
      });
    } else {
      setState(() {
        dropdownValue = "Raussichen";
        dropdownValue2 = "Raussichen";
      });
    }
  }

  void selsGes() {}
  void selsctList() {
    if (widget.catogSelcat == "Auto") {
      setState(() {
        selctList = catogreCar;
      });
    } else if (widget.catogSelcat == "ein Haus") {
      setState(() {
        isHomeCat = true;
        selctList = homeListDe;
      });
    } else if (widget.catogSelcat == "en Haus") {
      setState(() {
        isHomeCat = true;
        selctList = homeListEn;
      });
    } else if (widget.catogSelcat == "immobilier") {
      setState(() {
        isHomeCat = true;
        selctList = homeListFr;
      });
    } else if (widget.catogSelcat == "Haustier") {
      setState(() {
        isHomeCat = true;
        selctList = tricDe;
      });
    } else if (widget.catogSelcat == "Caminhão") {
      setState(() {
        isHomeCat = true;
        selctList = tricPt;
      });
    } else if (widget.catogSelcat == "Camion" &&
        EcommerceApp.sharedPreferences.getString("lan") == "fr") {
      setState(() {
        isHomeCat = true;
        selctList = tricFr;
      });
    } else if (widget.catogSelcat == "Camion" &&
        EcommerceApp.sharedPreferences.getString("lan") == "en") {
      setState(() {
        isHomeCat = true;
        selctList = tricEn;
      });
    } else if (widget.catogSelcat == "moto") {
      setState(() {
        isHomeCat = true;
        selctList = motoFr;
      });
    } else if (widget.catogSelcat == "Motorrad") {
      setState(() {
        isHomeCat = true;
        selctList = motoDe;
      });
    } else if (widget.catogSelcat == "Motorrad") {
      setState(() {
        isHomeCat = true;
        selctList = motoEn;
      });
    } else if (widget.catogSelcat == "motocicleta") {
      setState(() {
        isHomeCat = true;
        selctList = motoPt;
      });
    } else if (widget.catogSelcat == "uma casa") {
      setState(() {
        isHomeCat = true;
        selctList = homeListPt;
      });
    } else {
      setState(() {
        isLast = true;
        isHomeCat = true;
        selctList = sel;
      });
    }
    print(selctList);
  }

  Widget buildGridView() {
    return Container(
      height: 200,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            height: 200,
            width: 200,
            asset: asset,
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    contTextEditingController.text =
        EcommerceApp.sharedPreferences.getString("cont");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          actions: [],
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded),
          ),
          centerTitle: true,
          title: Text(
              "${AppLocale.of(context).getTranslated("Médecine complète")}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              imageBool
                  ? Container(width: 400, height: 200, child: buildGridView())
                  : InkWell(
                      onTap: () {
                        loadAssets();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().setWidth(320),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(),
                            color: Colors.teal),
                        child: Text(
                          "${AppLocale.of(context).getTranslated("Choisissez des photos")}",
                          style: textStyle3,
                        ),
                      ),
                    ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                child: Column(
                  children: [
                    isLast ? Container() : listGat(),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    isHomeCat ? Container() : listGat2(),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    textField2(
                      context,
                      controller: textEditingController,
                      hint: "${AppLocale.of(context).getTranslated("País")}",
                      title: "${AppLocale.of(context).getTranslated("País")} :",
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    textField2(
                      context,
                      controller: contTextEditingController,
                      hint: "${AppLocale.of(context).getTranslated("Stadt")}",
                      title:
                          "${AppLocale.of(context).getTranslated("Stadt")} :",
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    ButIn(
                      textButIn:
                          "${AppLocale.of(context).getTranslated("Continuez")}",
                      butIn: () {
                        if (textEditingController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "the Address is empty");
                        } else {
                          print(dropdownValue);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UrlWhat(
                                        images: images,
                                        title: widget.title,
                                        price: widget.price,
                                        dic: widget.dic,
                                        cato: widget.catogSelcat,
                                        categoryCar: dropdownValue,
                                        categoryCarGas: selcetGasCar,
                                        isHom: isHomeCatogrie,
                                        cont: contTextEditingController.text,
                                        address: textEditingController.text,
                                        newProduct: widget.newProduct,
                                      )));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listGat() {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      height: ScreenUtil().setHeight(60),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          print(newValue);
          if (selctList == selctList) {
            setState(() {
              dropdownValue = newValue;
              isHomeCatogrie = newValue;
            });
          } else {
            setState(() {
              dropdownValue = newValue;
              selctCarCat = newValue;
            });
          }
        },
        items: selctList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: textStyle2,
            ),
          );
        }).toList(),
      ),
    );
  }

  listGat2() {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
      height: ScreenUtil().setHeight(60),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue2,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          print(newValue);
          setState(() {
            dropdownValue2 = newValue;
            selcetGasCar = newValue;
          });
        },
        items: gesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: textStyle2,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget textField2(context,
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
                keyboardType: TextInputType.text,
                autofocus: true,
                maxLines: max,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  icon: Icon(Icons.location_pin),
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

  // Future<void> loadAssets() async {
  //   List<Asset> resultList = List<Asset>();
  //   String error = 'No Error Dectected';
  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 20,
  //       enableCamera: true,
  //       selectedAssets: images,
  //       cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
  //       materialOptions: MaterialOptions(
  //         actionBarColor: "#abcdef",
  //         actionBarTitle: "Upload Image",
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //       ),
  //     );
  //     setState(() {
  //
  //     });
  //     print(resultList.length);
  //     print((await resultList[0].getThumbByteData(122, 100)));
  //     print((await resultList[0].getByteData()));
  //     print((await resultList[0].metadata));
  //   } on Exception catch (e) {
  //     error = e.toString();
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     images = resultList;
  //     _error = error;
  //   });
  // }
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: false,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "MY Luxbazr",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      imageBool = true;
      _error = error;
    });
  }
}
