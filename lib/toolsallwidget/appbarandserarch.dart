import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylcyskdndklcdldcmsdc/UI/Widgets/custom_shape.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/search/search.dart';

Widget clipShape(context, double _height,_width ,Function onTap) {
  return Stack(
    children: <Widget>[
      Opacity(
        opacity: 0.75,
        child: ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: _height / 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange[200], Colors.pinkAccent],
              ),
            ),
          ),
        ),
      ),
      Opacity(
        opacity: 0.5,
        child: ClipPath(
          clipper: CustomShapeClipper2(),
          child: Container(
            height: _height / 3.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange[200], Colors.pinkAccent],
              ),
            ),
          ),
        ),
      ),
      Opacity(
        opacity: 0.25,
        child: ClipPath(
          clipper: CustomShapeClipper3(),
          child: Container(
            height: _height / 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange[200], Colors.pinkAccent],
              ),
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 40, right: 40, top: _height / 8.75),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 8,
          child: Container(
            child: TextFormField(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                        builder: (context) => SearchProduct(
                        )));

              },
              cursorColor: Colors.orange[200],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                prefixIcon:
                Icon(Icons.search, color: Colors.orange[200], size: 30),
                hintText: "${AppLocale.of(context).getTranslated("q_tucherches")}",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      ),
      Container(
        //color: Colors.blue,
          margin: EdgeInsets.only(left: 20, right: 20, top: _height / 35),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Opacity(
                opacity: 0.5,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                      onTap: onTap,
                      child: Image.asset(
                        'assets/images/menubutton.png',
                        height: _height / 40,
                      )),
                ),
              ),

              Opacity(
                opacity: 0.5,
                child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: _height / 30,
                    )),
              ),
            ],
          )),
    ],
  );
}