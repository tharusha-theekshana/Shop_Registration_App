import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/screens/register_flow/shop_details_screen.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/form_field.dart';
import '../../core/widgets/sub_title_widget.dart';
import '../../providers/shop_register_provider.dart';

class OwnerDetailsScreen extends StatelessWidget {
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
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(child: _bodyArea(context)),
    );
  }

  Widget _bodyArea(BuildContext context) {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      padding: EdgeInsets.symmetric(
          vertical: _deviceHeight * 0.01, horizontal: _deviceWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _registerTitleText(),
          SizedBox(
            height: _deviceHeight * 0.05,
          ),
          _inputArea(context)
        ],
      ),
    );
  }

  Widget _registerTitleText() {
    return SizedBox(
      width: _deviceWidth,
      child: Column(
        children: [
          Text(
            "Register Your Own \nShop",
            textAlign: TextAlign.center,
            style: AppStyles.titleTextStyle(_deviceHeight),
          ),
          SizedBox(
            height: _deviceHeight * 0.015,
          ),
          const Text(
              "Set up your own shop effortlessly! Register your store and start selling in just a few taps.",
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _inputArea(BuildContext context) {
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
              autoFocus: false,
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
              if (true) {
                provider.saveOwnerDetails(
                    name: _nameController.text,
                    email: _emailController.text,
                    mobile: _mobileController.text,
                    nic: _nicController.text);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ShopDetailsScreen();
                  },
                ));
              } else {
                print("Form is not validate");
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ShopDetailsScreen();
                  },
                ));
              }
            },
          )
        ],
      ),
    );
  }
}
