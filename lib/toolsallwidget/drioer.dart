// import 'package:flutter/material.dart';
//
// Widget _drawer() {
//   return Drawer(
//     child: Column(
//       children: <Widget>[
//         Opacity(
//           opacity: 0.75,
//           child: Container(
//             height: _height / 6,
//             padding: EdgeInsets.only(top: _height / 20),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.orange[200], Colors.pinkAccent],
//               ),
//             ),
//             child: ListTile(
//               leading: CircleAvatar(
//                 child: Icon(
//                   Icons.person,
//                   size: 40,
//                   color: Colors.black,
//                 ),
//                 radius: 30,
//                 backgroundColor: Colors.white,
//               ),
//               title: Text("FlutterDevs"),
//               subtitle: Text(
//                 "flutterDevs@aeologic.com",
//                 style: TextStyle(fontSize: 13),
//               ),
//               trailing: Icon(
//                 Icons.arrow_forward_ios,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//         ListTile(
//           leading: Icon(Icons.payment),
//           title: Text("Orders & Payments"),
//         ),
//       ],
//     ),
//   );
// }