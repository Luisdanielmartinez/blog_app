import 'package:blog_app/src/screens/home_page.dart';
import 'package:blog_app/src/screens/photo_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.red, accentColor: Colors.redAccent),
        home: Home(),
        initialRoute: '/home',
        getPages: [
          //Simple GetPage
          GetPage(name: '/home', page: () => Home()),
          GetPage(name: '/upload', page: () => PhotoUpload()),
        ]);
  }
}
