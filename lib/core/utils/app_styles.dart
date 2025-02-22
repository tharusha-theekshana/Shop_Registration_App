import 'package:flutter/material.dart';

class AppStyles{

  static TextStyle titleTextStyle(double deviceHeight) {
    return TextStyle(
        fontSize: deviceHeight * 0.05,
        fontWeight: FontWeight.bold,
    );
  }

  static TextStyle subTextStyle(double deviceHeight) {
    return TextStyle(
      fontSize: deviceHeight * 0.03,
      fontWeight: FontWeight.bold,
    );
  }

}