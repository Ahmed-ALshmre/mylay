import 'package:flutter/material.dart';
import 'package:mylcyskdndklcdldcmsdc/Model/model.dart';
import 'package:mylcyskdndklcdldcmsdc/reddata/reid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auto.dart';
import 'package:mylcyskdndklcdldcmsdc/lang/app_locale.dart';

class Pc extends StatefulWidget {
  @override
  _PcState createState() => _PcState();
}

class _PcState extends State<Pc> {
  bool colorSelct = false;
  List<String> priceList = [
    "De 10 à 100",
    "De 100 à 1000",
    "De 1000 à 10 000",
    "Plus de 10 000",
  ];

  List<String> contryList = ["luxembourg", "France","Belgique", "Deutschland", "Portugal"];
  int _selectedIndex;
  int _selectedIndexPrice;
  String cato;
  String priceCat;
  String man;
  List<String> selectedUserList = [];
  Future<Null> _futureRef() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Pc())).then((value) {
      setState(() {});
    });
  }

  void chack() async {
    if (priceCat == "De 10 à 100") {
      setState(() {
        man = "100";
      });
    } else if (priceCat == "De 100 à 1000") {
      setState(() {
        man = "1000";
      });
    } else if (priceCat == "De 1000 à 10 000") {
      setState(() {
        man = "10000";
      });
    } else if (priceCat == "Plus de 10 000") {
      setState(() {
        man = "100000";
      });
    }
    print("sssssssssssssss$man");
  }

  @override
  Widget build(BuildContext context) {
    chack();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocale.of(context).getTranslated('Électronique')}"),
      ),
      body: RefreshIndicator(
        onRefresh: _futureRef,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[100],
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          textFeild(_height, _width),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(height: 45, child: qouireContry()),
                    SizedBox(
                      height: 6,
                    ),
                    Container(height: 45, child: qouirePrice()),
                    getData(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  textFeild(double _height, _width) {
    return Container(
      width: _width * 0.8,
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        elevation: 8,
        child: Container(
          child: TextFormField(
            cursorColor: Colors.orange[200],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              prefixIcon:
                  Icon(Icons.search, color: Colors.orange[200], size: 30),
              hintText: "cherche ici",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  _onSelectedPrice(int index) {
    setState(() => _selectedIndexPrice = index);
  }

  Widget qouireContry() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: contryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _onSelected(index);
                cato = contryList[index].toString();
                print(cato);
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                decoration: BoxDecoration(
                  color: _selectedIndex != null && _selectedIndex == index
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
                child: Text(
                  contryList[index],
                  style: TextStyle(
                      color: _selectedIndex != null && _selectedIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        });
  }

  Widget qouirePrice() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: priceList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _onSelectedPrice(index);
                priceCat = priceList[index].toString();
                print(priceCat);
              },
              child: Container(
                alignment: Alignment.center,
                width: 160,
                decoration: BoxDecoration(
                  color: _selectedIndexPrice != null &&
                      _selectedIndexPrice == index
                      ? Color(0xff03045e)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
                child: Text(
                  priceList[index],
                  style: TextStyle(
                      color: _selectedIndexPrice != null &&
                          _selectedIndexPrice == index
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        });
  }

  getData() {
    if (priceCat == null && cato == null && selectedUserList.length == 0) {
      print("1111111111$cato");
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("${AppLocale.of(context).getTranslated('Pc')}")
            .orderBy('bool', descending: true)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.documents[index].data);
                    print(model.images);
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
                            child: Auto(
                              index: index,
                              model: model,
                              sel: model.cato,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
          }
        },
      );
    } else if (priceCat != null &&
        cato == null &&
        selectedUserList.length == 0) {
      print("222222222222222");
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("${AppLocale.of(context).getTranslated('Pc')}")
            .orderBy('bool', descending: true)
            .where("man", isEqualTo: man)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.documents[index].data);
                    print(model.images);
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
                            child: Auto(
                              index: index,
                              model: model,
                              sel: model.cato,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
          }
        },
      );
    } else if (priceCat == null &&
        cato != null &&
        selectedUserList.length == 0) {
      print("333333333333333");
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("${AppLocale.of(context).getTranslated('Pc')}")
            .orderBy('bool', descending: true)
            .where("cont", isEqualTo: cato)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.documents[index].data);
                    print(model.images);
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
                            child: Auto(
                              index: index,
                              model: model,
                              sel: model.cato,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
          }
        },
      );
    } else if (priceCat != null &&
        cato != null &&
        selectedUserList.length == 0) {
      print("444444444444");
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("${AppLocale.of(context).getTranslated('Pc')}")
            .orderBy('bool', descending: true)
            .where("cont", isEqualTo: cato)
            .where("man", isEqualTo: man)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.documents[index].data);
                    print(model.images);
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
                            child: Auto(
                              index: index,
                              model: model,
                              sel: model.cato,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
          }
        },
      );
    } else if (priceCat == null &&
        cato == null &&
        selectedUserList.length != 0) {
      print("55555555555555555555");
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("${AppLocale.of(context).getTranslated('Pc')}")
            .orderBy('bool', descending: true)
            .where("categoryCar", whereIn: selectedUserList)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.documents[index].data);
                    print(model.images);
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
                            child: Auto(
                              index: index,
                              model: model,
                              sel: model.cato,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
          }
        },
      );
    } else if (priceCat != null &&
        cato != null &&
        selectedUserList.length != 0) {
      print("66666666666");
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("${AppLocale.of(context).getTranslated('Pc')}")
            .orderBy('bool', descending: true)
            .where("cont", isEqualTo: cato)
            .where("man", isEqualTo: man)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.documents[index].data);
                    print(model.images);
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
                            child: Auto(
                              index: index,
                              model: model,
                              sel: model.cato,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
          }
        },
      );
    } else if (priceCat == null &&
        cato != null &&
        selectedUserList.length != 0) {
      print("7777777777777777777");
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("${AppLocale.of(context).getTranslated('Pc')}")
            .orderBy('bool', descending: true)
            .where("cont", isEqualTo: cato)
            .where("man", isEqualTo: man)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.documents[index].data);
                    print(model.images);
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
                            child: Auto(
                              index: index,
                              model: model,
                              sel: model.cato,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
          }
        },
      );
    } else if (priceCat != null &&
        cato == null &&
        selectedUserList.length != 0) {
      print("888888888888888");
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("${AppLocale.of(context).getTranslated('Pc')}")
            .orderBy('bool', descending: true)
            .where("cont", isEqualTo: cato)
            .where("man", isEqualTo: man)
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    ItemModel model =
                        ItemModel.fromJson(snapshot.data.documents[index].data);
                    print(model.images);
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
                            child: Auto(
                              index: index,
                              model: model,
                              sel: model.cato,
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
}
