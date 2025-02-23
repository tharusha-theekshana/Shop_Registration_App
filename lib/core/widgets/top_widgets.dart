import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class TopWidgets extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: _deviceWidth,
      child: Column(
        children: [
          Text(
            "MyShop",
            textAlign: TextAlign.center,
            style: AppStyles.titleTextStyle(_deviceHeight),
          ),
          SizedBox(
            height: _deviceHeight * 0.05,
          ),
          const Text(
              "Set up your own shop effortlessly! Register your store and start selling in just a few taps.",
              style: TextStyle(
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center),
          SizedBox(
            height: _deviceHeight * 0.05,
          ),
        ],
      ),
    );;
  }
}
