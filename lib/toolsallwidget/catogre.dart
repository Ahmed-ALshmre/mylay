// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:testapp/catogeyApp/catogre.dart';
// import 'package:testapp/catogeyApp/mobiles.dart';
// import 'package:testapp/catogeyApp/catogreElect.dart';
// import 'package:testapp/catogeyApp/velos.dart';
// import 'package:testapp/catogeyApp/empiois.dart';
// import 'package:testapp/lang/app_locale.dart';
// import 'package:testapp/catogeyApp/work.dart';
// import 'package:testapp/catogeyApp/camion.dart';
// import 'package:testapp/catogeyApp/ps.dart';
// Widget expandList(double _height, _width, bool isExpanded, context) {
//   return Container(
//     margin: EdgeInsets.only(left: 10, right: 10),
//     child: AnimatedCrossFade(
//       firstChild: GridView.count(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         crossAxisCount: 4,
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Pc()));
//                   print('1Routing to Electronics item list');
//                 },
//                 child: Image.asset(
//                   'assets/images/gadget.png',
//                   height: _height / 12,
//                   width: _width / 12,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "${AppLocale.of(context).getTranslated('Électronique')}",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => FalterElectr(
//
//                                 )));
//                     //Navigator.of(context).pushNamed(PROPERTIES_ITEM_LIST);
//                     print('Routing to Properties item list');
//                   },
//                   child: Image.asset(
//                     'assets/images/house.png',
//                     height: _height / 12,
//                     width: _width / 12,
//                   )),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "${AppLocale.of(context).getTranslated('Propriétés')}",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Wark()));
//                     //Navigator.of(context).pushNamed(JOBS_ITEM_LIST);
//                     print('Routing to Jobs item list');
//                   },
//                   child: Image.asset(
//                     'assets/images/job.png',
//                     height: _height / 12,
//                     width: _width / 12,
//                   )),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "${AppLocale.of(context).getTranslated('Emplois')}",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => FalterEmpiois()));
//                     //Navigator.of(context).pushNamed(FURNITURE_ITEM_LIST);
//                     print('Routing to Furniture item list');
//                   },
//                   child: Image.asset(
//                     'assets/images/sofa.png',
//                     height: _height / 12,
//                     width: _width / 12,
//                   )),
//               SizedBox(
//                 height: 5,
//               ),
//               SizedBox(
//                 height: 20,
//                 width: 70,
//                 child: Text(
//                   "${AppLocale.of(context).getTranslated('Articles ménagers')}",
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Falter(
//                                 isPostef: true,
//                                 isHome: false,
//                               )));
//                   //Navigator.of(context).pushNamed(CARS_ITEM_LIST);
//                   print('Routing to Cars item list');
//                 },
//                 child: Image.asset(
//                   'assets/images/car.png',
//                   height: _height / 12,
//                   width: _width / 12,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "${AppLocale.of(context).getTranslated('Voitures')}",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => FalterVelos()));
//                   //Navigator.of(context).pushNamed(BIKES_ITEM_LIST);
//                   print('Routing to Bikes item list');
//                 },
//                 child: Image.asset(
//                   'assets/images/bike.png',
//                   height: _height / 12,
//                   width: _width / 12,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "${AppLocale.of(context).getTranslated('moto')}",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => FalterMobiles()));
//                     //Navigator.of(context).pushNamed(MOBILES_ITEM_LIST);
//                     print('Routing to Mobiles item list');
//                   },
//                   child: Image.asset(
//                     'assets/images/smartphone.png',
//                     height: _height / 12,
//                     width: _width / 12,
//                   )),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "${AppLocale.of(context).getTranslated('Mobiles')}",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Trick()));
//                   //Navigator.of(context).pushNamed(PETS_ITEM_LIST);
//                   print('Routing to Pets item list');
//                 },
//                 child: Image.asset(
//                   'assets/icon/tric.png',
//                   height: _height / 11,
//                   width: _width / 11,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "${AppLocale.of(context).getTranslated('Camion')}",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       secondChild: GridView.count(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         crossAxisCount: 4,
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Falter(
//                                 isPostef: false,
//                                 isHome: false,
//                               )));
//                   //Navigator.of(context).pushNamed(ELECTRONICS_ITEM_LIST);
//                   print('Routing to Electronics item list');
//                 },
//                 child: Image.asset(
//                   'assets/images/gadget.png',
//                   height: _height / 12,
//                   width: _width / 12,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "Électronique",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Falter(
//                                   isPostef: true,
//                                   isHome: true,
//                                 )));
//                     //Navigator.of(context).pushNamed(PROPERTIES_ITEM_LIST);
//                     print('Routing to Properties item list');
//                   },
//                   child: Image.asset(
//                     'assets/images/house.png',
//                     height: _height / 12,
//                     width: _width / 12,
//                   )),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "Propriétés",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Wark()));
//                     //Navigator.of(context).pushNamed(JOBS_ITEM_LIST);
//                     print('Routing to Jobs item list');
//                   },
//                   child: Image.asset(
//                     'assets/images/job.png',
//                     height: _height / 12,
//                     width: _width / 12,
//                   )),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "Emplois",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Falter(
//                                   isPostef: false,
//                                   isHome: false,
//                                 )));
//                     //Navigator.of(context).pushNamed(FURNITURE_ITEM_LIST);
//                     print('Routing to Furniture item list');
//                   },
//                   child: Image.asset(
//                     'assets/images/sofa.png',
//                     height: _height / 12,
//                     width: _width / 12,
//                   )),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "Meubles",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Falter(
//                                 isPostef: true,
//                                 isHome: false,
//                               )));
//                   //Navigator.of(context).pushNamed(CARS_ITEM_LIST);
//                   print('Routing to Cars item list');
//                 },
//                 child: Image.asset(
//                   'assets/images/car.png',
//                   height: _height / 12,
//                   width: _width / 12,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "Voitures",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Falter(
//                                 isPostef: false,
//                                 isHome: false,
//                               )));
//                   //Navigator.of(context).pushNamed(BIKES_ITEM_LIST);
//                   print('Routing to Bikes item list');
//                 },
//                 child: Image.asset(
//                   'assets/images/bike.png',
//                   height: _height / 12,
//                   width: _width / 12,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "vélos",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Falter(
//                                   isPostef: false,
//                                   isHome: false,
//                                 )));
//                     //Navigator.of(context).pushNamed(MOBILES_ITEM_LIST);
//                     print('Routing to Mobiles item list');
//                   },
//                   child: Image.asset(
//                     'assets/images/smartphone.png',
//                     height: _height / 12,
//                     width: _width / 12,
//                   )),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "Mobiles",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Falter(
//                                 isPostef: false,
//                                 isHome: false,
//                               )));
//                   //Navigator.of(context).pushNamed(PETS_ITEM_LIST);
//                   print('Routing to Pets item list');
//                 },
//                 child: Image.asset(
//                   'assets/images/pet.png',
//                   height: _height / 12,
//                   width: _width / 12,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "Pets",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Falter(
//                                 isPostef: false,
//                                 isHome: false,
//                               )));
//                   //Navigator.of(context).pushNamed(FASHION_ITEM_LIST);
//                   print('Routing to Fashion item list');
//                 },
//                 child: Image.asset(
//                   'assets/images/dress.png',
//                   height: _height / 12,
//                   width: _width / 12,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Flexible(
//                 child: Text(
//                   "Fashion",
//                   style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       crossFadeState:
//           isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
//       duration: kThemeAnimationDuration,
//     ),
//   );
// }
