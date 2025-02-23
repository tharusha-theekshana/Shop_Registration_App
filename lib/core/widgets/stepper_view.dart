import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_colors.dart';

class StepperView extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;
  final int step;
  final int allSteps;

  StepperView({required this.step,required this.allSteps});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: _deviceWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(allSteps, (index) {
          final isActive = index + 1 == step;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: isActive ? 14 : 9,
            height: isActive ? 14 : 9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? AppColors.greenColor : AppColors.greyColor,
            ),
          );
        }),
      ),
    );
  }
}
