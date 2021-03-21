import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/utles.dart';

import 'deletdcoement.dart';


class DeletHome extends StatefulWidget {
  @override
  _DeletHomeState createState() => _DeletHomeState();
}

class _DeletHomeState extends State<DeletHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes spectacles"),
      ),
      body: _drawProducts(),
    );
  }

  Widget _drawProducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('all')
          .where("uid",
              isEqualTo: EcommerceApp.sharedPreferences.getString("uid"))
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  ItemModel model =
                      ItemModel.fromJson(snapshot.data.documents[index].data);
                  print(model.images);
                  return InkWell(
                    child: Column(
                      children: [
                        Container(
                          height: 160,
                          child: DeleatDoc(
                            index: index,
                            model: model,
                          ),
                        ),
                      ],
                    ),
                  );
                });
        }
      },
    );
  }
}
