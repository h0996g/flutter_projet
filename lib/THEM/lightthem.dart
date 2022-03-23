import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData light_theme() => ThemeData(
      textTheme: const TextTheme(
          headline4:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          bodyText2: TextStyle(
            color: Colors.black,
          ),
          headline6: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18)),
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.deepOrange,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        elevation: 10,
        backgroundColor: Colors.white,
      ),
    );
