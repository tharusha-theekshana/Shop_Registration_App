import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_styles.dart';

class SubTitleWidget extends StatelessWidget {
  final String text;
  late double _deviceHeight,_deviceWidth;

  SubTitleWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.012),
      width: _deviceWidth,
      child: Text("-------- $text --------",
        textAlign: TextAlign.center,
        style: AppStyles.subTextStyle(_deviceHeight),
      ),
    );
  }
}
