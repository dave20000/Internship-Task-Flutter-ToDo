import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    accentColor: Color.fromRGBO(255, 218, 2, 1),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(255, 218, 2, 1),
      foregroundColor: Colors.white,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(fontSize: 16.0, color: Colors.black54),
      headline4: TextStyle(fontSize: 16.0, color: Colors.white),
      subtitle1: TextStyle(fontSize: 16.0, color: Colors.black45),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: TextStyle(
          fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline3: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline5: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
      button: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      subtitle1: TextStyle(fontSize: 12.0, color: Colors.black),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    accentColor: Color.fromRGBO(255, 218, 2, 1),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(255, 218, 2, 1),
      foregroundColor: Colors.black,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(fontSize: 16.0, color: Colors.white),
      headline4: TextStyle(fontSize: 16.0, color: Colors.black),
      subtitle1: TextStyle(fontSize: 16.0, color: Colors.white54),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(
          fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline3: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline5: TextStyle(
          fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
      button: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      subtitle1: TextStyle(fontSize: 12.0, color: Colors.white),
    ),
  );
}
