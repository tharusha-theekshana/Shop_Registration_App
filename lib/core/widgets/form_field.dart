import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_colors.dart';

class AppFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool? isObscureText;
  final TextInputType? textInputType;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final String? imageUrl;
  final String? prefixText;
  final bool? autoFocus;
  final IconButton? suffixIcon;
  final double deviceHeight;
  final bool isRequired;

  const AppFormField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.deviceHeight,
    required this.isRequired,
    this.onChange,
    this.isObscureText,
    this.textInputType,
    this.maxLength,
    this.imageUrl,
    this.prefixText,
    this.autoFocus,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: labelText,
              style: TextStyle(
                fontSize: deviceHeight * 0.018,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).dividerColor
              ),
              children: [
                TextSpan(
                  text: isRequired ? " *" : "",
                  style: TextStyle(
                    fontSize: deviceHeight * 0.02,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redColor, // Ensure color is set
                  ),
                ),
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          keyboardType: textInputType ?? TextInputType.text,
          obscureText: isObscureText ?? false,
          maxLength: maxLength ?? 50,
          validator: validator,
          autofocus: autoFocus ?? false,
          onChanged: onChange,
          cursorColor: AppColors.greyColor,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: imageUrl == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        imageUrl.toString(),
                        width: 24,
                        height: 24,
                      ),
                    ),
              prefix: prefixText == null
                  ? null
                  : Text(
                      prefixText!,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
              counterText: '',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: AppColors.greyColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  width: 2.0,
                  color: AppColors.greyColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide:
                    const BorderSide(width: 1.0, color: AppColors.redColor),
              ),
              errorStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: deviceHeight * 0.015),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: deviceHeight * 0.018,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
