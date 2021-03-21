import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final PreferredSizeWidget bottom;
  MyAppBar({this.bottom});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      bottom: bottom,
      actions: [],
    );
  }

  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
}
