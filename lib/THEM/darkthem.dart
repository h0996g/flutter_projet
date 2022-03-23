import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

ThemeData dark_theme() => ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('#121212'),
          unselectedItemColor: Colors.white),
      textTheme: const TextTheme(
          headline4:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          headline6: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18)),
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.deepOrange,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('#121212'),
            statusBarIconBrightness: Brightness.light),
        elevation: 10,
        backgroundColor: HexColor('#121212'),
      ),
    );
