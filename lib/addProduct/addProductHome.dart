import 'package:flutter/material.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/botumn.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';
import 'folloeImages.dart';
import 'package:mylcyskdndklcdldcmsdc/addProduct/toolsUplode/textFeild.dart';
import 'package:mylcyskdndklcdldcmsdc/addProduct/toolsUplode/listCat.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/utles.dart';
import 'package:flutter_screenutil/screen_util.dart';
class AddProductsHome extends StatefulWidget {
  @override
  _AddProductsHomeState createState() => _AddProductsHomeState();
}

class _AddProductsHomeState extends State<AddProductsHome> {
  String dropdownValue;
  String dropdownValue2;
  String catogSelext;
  String catogSelext2;
  List<String> sel;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController decTextEditingController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleTextEditingController.dispose();
    decTextEditingController.dispose();
    priceTextEditingController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valueList();
  }

  void valueList() {
    if (EcommerceApp.sharedPreferences.getString("lan") == "fr") {
      setState(() {
        dropdownValue = "Choisir";
        dropdownValue2 = "Choisir";
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "de") {
      setState(() {
        dropdownValue = "Wählen";
        dropdownValue2 = "Wählen";
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "en") {
      setState(() {
        dropdownValue = "Raussichen";
        dropdownValue2 = "Raussichen";
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "pt") {
      setState(() {
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

  void selsctLang() {
    if (EcommerceApp.sharedPreferences.getString("lan") == "fr") {
      setState(() {
        sel = allCatoFr;
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "de") {
      setState(() {
        sel = allCatoBe;
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "en") {
      setState(() {
        sel = allCatoEn;
      });
    } else if (EcommerceApp.sharedPreferences.getString("lan") == "pt") {
      setState(() {
        sel = allCatoPt;
      });
    } else {
      setState(() {
        sel = allCatoEn;
      });
    }
  }

  Widget build(BuildContext context) {
    selsctLang();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "${AppLocale.of(context).getTranslated("Ajouter un produit")}",
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textField(context,
                controller: titleTextEditingController,
                title:
                    "${AppLocale.of(context).getTranslated("Ajouter un produit")} :",
                hint: "${AppLocale.of(context).getTranslated("titre")}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textFieldNum(context, priceTextEditingController),
            ),
            Padding(
              padding:  EdgeInsets.all( ScreenUtil().setWidth(8.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${AppLocale.of(context).getTranslated("CatégorieAdd")} :",
                    style: textStyle1,
                  ),
                  SizedBox(
                    height:  ScreenUtil().setHeight(8),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left: 8.0,right: 8),

                   child: listGat(),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(ScreenUtil().setWidth(8)),
            ),
            textField(context,
                controller: decTextEditingController,
                title:
                    "${AppLocale.of(context).getTranslated("Description du produit_add")} :",
                hint: "${AppLocale.of(context).getTranslated("description")}",
                max: 4),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            ButIn(
                textButIn: "${AppLocale.of(context).getTranslated("Suivre")}",
                butIn: () {
                  if (titleTextEditingController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "the title is empty");
                  } else if (priceTextEditingController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "the price is empty");
                  } else if (catogSelext == "Choisir") {
                    Fluttertoast.showToast(msg: "the Choisir is empty");
                  } else if (decTextEditingController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "the dic is empty");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SingleImageUpload(
                          title: titleTextEditingController.text,
                          price: priceTextEditingController.text,
                          dic: decTextEditingController.text,
                          newProduct: catogSelext2,
                          catogSelcat: catogSelext,
                        ),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

// catogorie
  listGat() {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      height: ScreenUtil().setHeight(50),
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
          setState(() {
            dropdownValue = newValue;
            print(dropdownValue);
            catogSelext = newValue;
          });
        },
        items: sel.map<DropdownMenuItem<String>>((String value) {
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

// catogorie2
// textFed

}

