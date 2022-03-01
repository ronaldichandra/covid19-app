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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 36.0,
                  color: Color(0xff001E2E),
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff001E2E),
                  fontWeight: FontWeight.normal)),
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xffACC7FF),
            onPrimary: Color(0xff001E2E),
            primaryContainer: Color(0xffFFDCC3),
            onPrimaryContainer: Color(0xff944B00),
            secondary: Color(0xffFFDAD3),
            onSecondary: Color(0xffC10000),
            secondaryContainer: Color(0xff97F7B8),
            onSecondaryContainer: Color(0xff006D3C),
            error: Color(0xffFFDAD3),
            onError: Color(0xffC10000),
            background: Color(0xff21323E),
            onBackground: Color(0xffffffff),
            surface: Color(0xff21323E),
            onSurface: Color(0xffffffff),
          ),
          brightness: Brightness.light,
          primaryColor: Color(0xffACC7FF),
          fontFamily: 'Product Sans'),
      darkTheme: ThemeData(
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 36.0,
                  color: Color(0xffC5E7FF),
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xffC5E7FF),
                  fontWeight: FontWeight.normal)),
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xff004C6D),
            onPrimary: Color(0xffC5E7FF),
            primaryContainer: Color(0xff4E2600),
            onPrimaryContainer: Color(0xffFFB77A),
            secondary: Color(0xff690000),
            onSecondary: Color(0xffFFB4A6),
            secondaryContainer: Color(0xff003918),
            onSecondaryContainer: Color(0xff00E475),
            error: Color(0xff690000),
            onError: Color(0xffFFB4A6),
            background: Color(0xff21323E),
            onBackground: Color(0xffffffff),
            surface: Color(0xff21323E),
            onSurface: Color(0xffffffff),
          ),
          primaryColor: Color(0xff004C6D),
          scaffoldBackgroundColor: Color(0xff21323E),
          fontFamily: 'Product Sans'),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: FirstScreen(),
        title: new Text(
          'Info CovID',
          style: TextStyle(
              color: Color(0xffACC7FF),
              fontFamily: 'Product Sans',
              fontSize: 50.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff21323E),
        loaderColor: Color(0xffACC7FF),
        loadingText: Text(
          'Stay safe everyone!',
          style: TextStyle(color: Color(0xffACC7FF), fontSize: 20.0),
        ),
      ),
    );
  }
}
