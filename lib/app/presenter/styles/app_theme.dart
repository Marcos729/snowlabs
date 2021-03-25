import 'package:flutter/material.dart';

final ThemeData AppThemeData = ThemeData(
    primarySwatch: Colors.yellow,
    iconTheme: IconThemeData(color: Color(0xff10159A)),
    primaryColor: Color(0xff10159A),
    buttonColor: Colors.yellow[700],
    brightness: Brightness.light,
    accentColor: Colors.yellow[600],
    appBarTheme: AppBarTheme(
      color: Color(0xff10159A),
      iconTheme: IconThemeData(
        color: Colors.white,

      ),
    ),
    platform: TargetPlatform.iOS
);