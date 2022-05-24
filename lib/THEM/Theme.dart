import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

ThemeData light_theme() => ThemeData(
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      textTheme: const TextTheme(
          headline4:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          headline6: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18)),
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        elevation: 10,
        backgroundColor: Colors.white,
      ),
    );

ThemeData dark_theme() => ThemeData(
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('#121212'),
          unselectedItemColor: Colors.white),
      textTheme: const TextTheme(
          headline4:
              TextStyle(color: Color(0xffb3b2b2), fontWeight: FontWeight.bold),
          bodyText2: TextStyle(
            color: Color(0xffb3b2b2),
          ),
          headline6: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18)),
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.blueGrey,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('#121212'),
            statusBarIconBrightness: Brightness.light),
        elevation: 10,
        backgroundColor: HexColor('#121212'),
      ),
    );
