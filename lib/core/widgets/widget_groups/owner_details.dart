import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/providers/shop_register_provider.dart';

import '../../utils/app_colors.dart';
import '../custom_button.dart';
import '../form_field.dart';
import '../sub_title_widget.dart';

class OwnerDetails extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();

  late double _deviceHeight, _deviceWidth;

  final mobileRegExp = RegExp(r'^(?:\+94|0)7[01245678]\d{7}$');
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final nameReg = RegExp(r'^[a-zA-Z ]+$');
  final nicReg = RegExp(
      '^(([5,6,7,8,9]{1})([0-9]{1})([0,1,2,3,5,6,7,8]{1})([0-9]{6})([v|V|x|X]))|(([1,2]{1})([0,9]{1})([0-9]{2})([0,1,2,3,5,6,7,8]{1})([0-9]{7}))');


  final _ownerDetailsFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    _deviceWidth = MediaQuery
        .of(context)
        .size
        .width;

    final provider = Provider.of<ShopRegisterProvider>(context);

    return Form(
      key: _ownerDetailsFormKey,
      child: Column(
        children: [
          SubTitleWidget(text: "Owner Details"),
          SizedBox(
            height: _deviceHeight * 0.025,
          ),
          AppFormField(
              labelText: "Name",
              hintText: "Jhon snovy",
              controller: _nameController,
              textInputType: TextInputType.name,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Name is required";
                } else if (!nameReg.hasMatch(value)) {
                  return "Invalid name";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.012,
          ),
          AppFormField(
              labelText: "Email",
              hintText: "example@gmail.com",
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email is required";
                } else if (!emailRegex.hasMatch(value)) {
                  return "Invalid email";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.012,
          ),
          AppFormField(
              labelText: "Mobile",
              hintText: "011 xxxxxxx",
              controller: _mobileController,
              textInputType: TextInputType.number,
              isRequired: true,
              maxLength: 10,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Mobile number is required";
                } else if (!mobileRegExp.hasMatch(value)) {
                  return "Invalid mobile number";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.012,
          ),
          AppFormField(
              labelText: "NIC",
              hintText: "895556237V",
              controller: _nicController,
              isRequired: true,
              maxLength: 12,
              validator: (value) {
                if (value!.isEmpty) {
                  return "NIC is required";
                } else if (!nicReg.hasMatch(value)) {
                  return "Invalid NIC number";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.03,
          ),
          CustomButton(
            buttonText: "Next",
            height: _deviceHeight * 0.06,
            width: _deviceWidth,
            color: AppColors.greenColor,
            borderRadius: 25,
            fontSize: _deviceHeight * 0.02,
            onPressed: () {
              if (_ownerDetailsFormKey.currentState!.validate()) {
                provider.saveOwnerDetails(name: _nameController.text,
                    email: _emailController.text,
                    mobile: _mobileController.text,
                    nic: _nicController.text);
                provider.nextStep();
              } else {
                print("Form is not validate");
              }
            },
          )
        ],
      ),
    );
  }
}
