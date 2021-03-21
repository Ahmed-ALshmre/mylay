import 'package:flutter/material.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';
Widget textFieldNum(context, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          "${AppLocale.of(context).getTranslated("le prix_add")} :",
          style: textStyle1,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          alignment: Alignment.center,
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[50]),
          child: TextField(
            controller: controller,
            cursorColor: Colors.black,
            cursorRadius: Radius.circular(12),
            cursorHeight: 30,
            keyboardType: TextInputType.number,
            autofocus: true,
            textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintText: "\€ 0.0",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}


Widget textField(context,
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