import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/utles.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylcyskdndklcdldcmsdc/addProduct/addProductHome.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'uiAuth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  String codePhone = "+352";
  String number;
  String catogSelext;
  String dropdownValue = "luxembourg";
  List<String> contry = [
    "luxembourg",
    "France",
    "Deutschland",
    "Portugal",
    "Belgique"
  ];
  @override
  Widget build(BuildContext context) {
    print(dropdownValue);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            uiAuth(context, _height, _width,
                "${AppLocale.of(context).getTranslated("auth")}"),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            ),
            text(
                Icons.person,
                "${AppLocale.of(context).getTranslated("Benutzername")}",
                nameTextEditingController),
            Container(
                margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
                alignment: Alignment.centerLeft,
                child: Text(
                  "${AppLocale.of(context).getTranslated("Choisir")} ::",
                  textAlign: TextAlign.start,
                  style: textStyle1,
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(5),
                  right: ScreenUtil().setWidth(8),
                  left: ScreenUtil().setWidth(8)),
              child: listGat(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(20),
                  right: ScreenUtil().setWidth(8),
                  left: ScreenUtil().setWidth(8)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0, top: 0),
                        child: Container(
                          height: ScreenUtil().setHeight(40),
                          width: ScreenUtil().setWidth(100),
                          alignment: Alignment.center,
                          child: CountryCodePicker(
                            countryFilter: [
                              'FR',
                              'BE',
                              'PT',
                              'DE',
                              'LU',
                            ],
                            onChanged: (code) {
                              setState(() {
                                print(code);
                                codePhone = code.toString();
                              });
                            },
                            initialSelection: 'LU',
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: true,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(200),
                      height: ScreenUtil().setHeight(50),
                      margin: EdgeInsets.only(
                        top: 0,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              "${AppLocale.of(context).getTranslated("Número de telefone")}",
                        ),
                        keyboardType: TextInputType.number,
                        controller: _controller,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(90),
            ),
            Container(
              margin: EdgeInsets.all(ScreenUtil().setWidth(9)),
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  setState(() {
                    number = "$codePhone" + "${_controller.text.trim()}";
                  });
                  print(number);
                  if (_controller.text.length >= 4 &&
                      nameTextEditingController.text.isNotEmpty) {
                    EcommerceApp.sharedPreferences.setString("phone", number);
                    EcommerceApp.sharedPreferences
                        .setString("cont", dropdownValue);
                    print(EcommerceApp.sharedPreferences.getString("cont"));
                    EcommerceApp.sharedPreferences
                        .setString("name", nameTextEditingController.text);
                    print(EcommerceApp.sharedPreferences.getString("name"));
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AddProductsHome()));
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            "${AppLocale.of(context).getTranslated("flutterTaost")}");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(200),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent),
                  child: Text(
                    "${AppLocale.of(context).getTranslated("Suivre")}",
                    style: textStyle3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  listGat() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
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
        onChanged: (newValue) {
          print(newValue);
          setState(() {
            dropdownValue = newValue;
            catogSelext = newValue;
          });
          print(dropdownValue);
        },
        items: contry.map<DropdownMenuItem<String>>((String value) {
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

  Widget text(IconData iconData, String text,
      TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
        child: TextFormField(
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          controller: textEditingController,
          obscureText: false,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              icon: Icon(
                iconData,
                size: 30,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}
