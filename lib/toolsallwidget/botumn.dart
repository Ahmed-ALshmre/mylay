import 'package:flutter/material.dart';
import 'package:mylcyskdndklcdldcmsdc/toolsallwidget/textstyle.dart';

class ButIn extends StatelessWidget {
  final String textButIn;
  final Function butIn;

  const ButIn({Key key, this.textButIn, this.butIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: butIn,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          textButIn, style: textStyle2,
        ),
      ),
    );
  }
}
