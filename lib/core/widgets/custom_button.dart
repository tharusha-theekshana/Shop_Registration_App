import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double height;
  final double? width;
  final Color? color;
  final VoidCallback onPressed;
  final double? fontSize;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? borderWidth;
  final Color? borderColor;
  final Gradient? gradient;

  const CustomButton(
      {required this.buttonText,
        required this.height,
        this.width,
        required this.onPressed,
        this.color,
        this.fontSize,
        this.borderRadius,
        this.fontWeight,
        this.textColor,
        this.borderWidth,
        this.borderColor,
        this.gradient
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          color: color ?? AppColors.redColor,
          gradient: gradient
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            side: BorderSide(
              width: borderWidth ?? 1.0,
              color: borderColor ?? Colors.transparent,
            )),
        onPressed: onPressed,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor ?? AppColors.whiteColor,
              fontSize: fontSize ?? 15.0,
              fontWeight: fontWeight ?? FontWeight.w500),
        ),
      ),
    );
  }
}
