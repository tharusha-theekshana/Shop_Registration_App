import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DropDownField extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final double deviceHeight;
  final bool isRequired;
  final Function(String) setValue;

  DropDownField(
      {required this.labelText,
      required this.items,
      required this.isRequired,
      required this.deviceHeight,
      required this.setValue
      });

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: widget.labelText,
              style: TextStyle(
                  fontSize: widget.deviceHeight * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).dividerColor),
              children: [
                TextSpan(
                  text: widget.isRequired ? " *" : "",
                  style: TextStyle(
                    fontSize: widget.deviceHeight * 0.02,
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
          value: widget.items.first,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.greyColor,
              ),
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          autofocus: false,
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item,
                  style: TextStyle(
                      fontSize: widget.deviceHeight * 0.018,
                      fontWeight: FontWeight.w400)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            widget.setValue(newValue ?? widget.items.first); // Call the passed function
          },
        )
      ],
    );
  }
}
