import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'tools/utles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UI/Widgets/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'lang/app_locale.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EcommerceApp.sharedPreferences = await SharedPreferences.getInstance();
  EcommerceApp.firestore = Firestore.instance;
  runApp(MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      allowFontScaling: false,
      builder: () => MaterialApp(
        // Add the locale here
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale(
              EcommerceApp.sharedPreferences.getString("lan") == null
                  ? "en"
                  : EcommerceApp.sharedPreferences.getString("lan"),
              ''),
        ],
        debugShowCheckedModeBanner: false,
        title: 'MY Luxbazr',
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: AnimatedSplashScreen(),
      ),
    );
  }
}
