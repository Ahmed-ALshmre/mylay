import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:mylcyskdndklcdldcmsdc/addProduct/addProductHome.dart';
import 'package:mylcyskdndklcdldcmsdc/tools/utles.dart';
import 'package:mylcyskdndklcdldcmsdc/UI/main_ui.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify-${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) async {
                  final code = pin.trim();
                  AuthCredential credential = PhoneAuthProvider.getCredential(
                      verificationId: _verificationCode, smsCode: code);
                  AuthResult result =
                      await _auth.signInWithCredential(credential);
                  FirebaseUser user = result.user;
                  if (user != null) {
                    EcommerceApp.sharedPreferences.setString("uid", user.uid);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainUI()));
                  } else {
                    print("Error");
                  }
                }),
          ),
        ],
      ),
    );
  }

  _verifyPhone() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: widget.phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          AuthResult result = await _auth.signInWithCredential(credential);
          FirebaseUser user = result.user;
          if (user != null) {
            EcommerceApp.sharedPreferences.setString("uid", user.uid);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainUI()));
          } else {
            print("Error");
          }
          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          setState(() {
            _verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
