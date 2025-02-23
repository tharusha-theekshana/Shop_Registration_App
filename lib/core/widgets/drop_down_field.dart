import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DropDownField extends StatelessWidget {
  String? selectedValue;

  final String labelText;
  final List<String> items;
  final double deviceHeight;
  final bool isRequired;

  DropDownField(
      {required this.labelText,
      required this.items,
      required this.isRequired,
      required this.deviceHeight});

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
                  color: Theme.of(context).dividerColor),
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
        DropdownButtonFormField<String>(
          value: items.first,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                width: 2.0,
                color: AppColors.greyColor,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item,
                  style: TextStyle(
                      fontSize: deviceHeight * 0.018,
                      fontWeight: FontWeight.w400)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            selectedValue = newValue;
          },
        )
      ],
    );
  }
}
