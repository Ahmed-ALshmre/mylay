import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:mylcyskdndklcdldcmsdc/auth/home.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';


class LoadingAlertDialog extends StatelessWidget {
  final String message;
  const LoadingAlertDialog({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Text(
            "Vous devez d'abord vous connecter",
            style: textStyle1,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().screenHeight * 0.05,
                  width: ScreenUtil().screenWidth * 0.28,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Connexion",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(20),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(32),
                  width: ScreenUtil().screenWidth * 0.26,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Annulation",
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(12)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
