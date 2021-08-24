import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.normal,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.accent,
    ),
  );
}
