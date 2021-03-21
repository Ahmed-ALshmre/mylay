import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'catogeyApp/camion.dart';
import 'catogeyApp/catogre.dart';
import 'catogeyApp/catogreElect.dart';
import 'catogeyApp/clothes.dart';
import 'catogeyApp/empiois.dart';
import 'catogeyApp/happy.dart';
import 'catogeyApp/ps.dart';
import 'catogeyApp/quad.dart';
import 'catogeyApp/velos.dart';
import 'catogeyApp/work.dart';
import 'lang/app_locale.dart';

class AllCato extends StatefulWidget {
  @override
  _AllCatoState createState() => _AllCatoState();
}

class _AllCatoState extends State<AllCato> {
  List<String> icon = [
    'assets/icons/home.svg',
    'assets/icons/bike.svg',
    'assets/icons/car.svg',
    'assets/icons/clothes-hanger.svg',
    'assets/icons/mobile-phone-and-computer-screen.svg',
    'assets/icons/painter-tool.svg',
    'assets/icons/portfolio.svg',
    'assets/icons/washing-machine.svg',
    'assets/icons/truck.svg',
    'assets/icons/quad.svg',
    'assets/icons/m1.svg',
  ];
  TextStyle _style =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${AppLocale.of(context).getTranslated('Catégorie')}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FalterElectr()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[0],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('Propriétés')}",
                        style: _style),
                  ),
                  Divider(),
                  ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Falter(
                                      isPostef: true,
                                      isHome: false,
                                    )));
                      },
                      leading: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(
                          icon[2],
                          width: 40,
                          alignment: Alignment.centerLeft,
                          color: Colors.teal,
                        ),
                      ),
                      title: Text(
                          "${AppLocale.of(context).getTranslated('Voitures')}",
                          style: _style)),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FalterEmpiois()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[7],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('Articles ménagers')}",
                        style: _style),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Happy()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[1],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('happy')}",
                        style: _style),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Pc()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[4],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('Électronique')}",
                        style: _style),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Wark()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[6],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('Emplois')}",
                        style: _style),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClothesApp()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[3],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('Vêtements')}",
                        style: _style),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Trick()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[8],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('Camion')}",
                        style: _style),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Quad()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[9],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('quad')}",
                        style: _style),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FalterVelos()));
                    },
                    leading: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        icon[10],
                        width: 40,
                        alignment: Alignment.centerLeft,
                        color: Colors.teal,
                      ),
                    ),
                    title: Text(
                        "${AppLocale.of(context).getTranslated('moto')}",
                        style: _style),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
