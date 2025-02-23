import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_colors.dart';

class AppStyles {
  static TextStyle titleTextStyle(double deviceHeight) {
    return TextStyle(
        fontSize: deviceHeight * 0.06,
        fontWeight: FontWeight.bold,
        color: AppColors.greenColor);
  }

  static TextStyle subTextStyle(double deviceHeight) {
    return TextStyle(
        fontSize: deviceHeight * 0.025,
        fontWeight: FontWeight.w500,
        color: AppColors.greyColor);
  }

  static TextStyle inputLabelTextStyle(
      BuildContext context, double deviceHeight) {
    return TextStyle(
        fontFamily: "Quicksand",
        fontSize: deviceHeight * 0.017,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).dividerColor);
  }
}
