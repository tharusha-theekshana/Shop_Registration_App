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

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        String dashes = '-' * (screenWidth ~/ 35); // Adjust the divisor for length

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$dashes $text $dashes",
              style: AppStyles.subTextStyle(_deviceHeight),
            ),
          ],
        );
      },
    );
  }
}
