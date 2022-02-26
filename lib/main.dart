// @dart=2.9

import 'package:infocovid/screens/first.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Product Sans'),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: FirstScreen(),
        title: new Text(
          'Info CovID',
          style: TextStyle(
              fontFamily: 'Product Sans',
              fontSize: 50.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffFDFBFF),
        loaderColor: Color(0xff001A43),
        loadingText: Text(
          'Stay safe everyone!',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
