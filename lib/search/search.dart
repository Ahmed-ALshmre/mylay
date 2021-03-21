import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/UI/Widgets/mainui_customcard.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';
import 'package:mylcyskdndklcdldcmsdc/reddata/reid.dart';
import 'package:mylcyskdndklcdldcmsdc/search/serchAppBar.dart';


class SearchProduct extends StatefulWidget {
  @override
  _SearchProductState createState() => new _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  Future<QuerySnapshot> listQuery;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          bottom: PreferredSize(
            child: serachWid(context),
            preferredSize: Size(56.0, 56.0),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: listQuery,
          builder: (context, snapShout) {
            return snapShout.hasData
                ? ListView.builder(
                    itemCount: snapShout.data.documents.length,
                    itemBuilder: (context, index) {
                      ItemModel model = ItemModel.fromJson(
                          snapShout.data.documents[index].data);
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                               MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        model: model,
                                      )));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 160,
                              child: CustomCard(
                                index: index,
                                model: model,
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : Center(
                    child: Text(
                        "${AppLocale.of(context).getTranslated("Il n'y a pas de données")}"),
                  );
          },
        ),
      ),
    );
  }

  Widget serachWid(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {});
          startSearch(value);
        },
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(
            //     horizontal:0 ,
            //     vertical:0,
            // ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText:
                "${AppLocale.of(context).getTranslated("Il n'y a pas de données")}",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget sizedWidth() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.lightGreenAccent,
              Colors.pink,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 40.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.search,
                color: Colors.blueGrey,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextField(
                  onChanged: (value) {},
                  decoration:
                      InputDecoration.collapsed(hintText: "Search here"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ignore: missing_return
  Future startSearch(String query) async {
    listQuery = Firestore.instance
        .collection('all')
        .where('cato', isGreaterThanOrEqualTo: query)
        .getDocuments();
  }
}
