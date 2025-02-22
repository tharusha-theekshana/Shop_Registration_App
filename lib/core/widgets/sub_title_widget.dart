import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_colors.dart';
import 'package:shop_registration/core/utils/app_styles.dart';

class SubTitleWidget extends StatelessWidget {
  final String text;
  late double _deviceHeight,_deviceWidth;

  SubTitleWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: AppStyles.subTextStyle(_deviceHeight),),
        const Divider(
          color: AppColors.dividerColor,
          thickness: 1,
        )
      ],
    );
  }
}
