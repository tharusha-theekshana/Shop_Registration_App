import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/core/widgets/stepper_view.dart';
import 'package:shop_registration/core/widgets/top_widgets.dart';
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
          TopWidgets(),
          SubTitleWidget(text: "Owner Details"),
          StepperView(step: 1, allSteps: 3),
          _inputArea(context)
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
          SizedBox(
            height: _deviceHeight * 0.025,
          ),
          AppFormField(
              labelText: "Name",
              hintText: "ex : Jhon snovy",
              controller: _nameController,
              isRequired: true,
              textInputType: TextInputType.name,
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
            height: _deviceHeight * 0.015,
          ),
          AppFormField(
              labelText: "Email",
              hintText: "ex : example@gmail.com",
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
            height: _deviceHeight * 0.015,
          ),
          AppFormField(
              labelText: "Mobile",
              hintText: "ex : 011 xxxxxxx",
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
            height: _deviceHeight * 0.015,
          ),
          AppFormField(
              labelText: "NIC",
              hintText: "ex : 895556237V",
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
              if (_ownerDetailsFormKey.currentState!.validate()) {
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
              }
            },
          )
        ],
      ),
    );
  }
}
