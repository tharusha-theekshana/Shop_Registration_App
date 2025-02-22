import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_colors.dart';
import 'package:shop_registration/core/utils/app_styles.dart';
import 'package:shop_registration/core/widgets/custom_button.dart';
import 'package:shop_registration/core/widgets/form_field.dart';
import 'package:shop_registration/core/widgets/sub_title_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late double _deviceHeight, _deviceWidth;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(child: _bodyArea()),
    );
  }

  Widget _bodyArea() {
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
          SubTitleWidget(text: "Owner Details"),
          SizedBox(
            height: _deviceHeight * 0.05,
          ),
          _formFields()
        ],
      ),
    );
  }

  Widget _formFields() {
    return Column(
      children: [
        AppFormField(
            labelText: "Name",
            hintText: "Ex : Jhon",
            controller: _nameController,
            isRequired: true,
            validator: (value) {},
            deviceHeight: _deviceHeight),
        SizedBox(
          height: _deviceHeight * 0.012,
        ),
        AppFormField(
            labelText: "Email",
            hintText: "Ex : jhon@example.com",
            controller: _emailController,
            isRequired: true,
            validator: (value) {},
            deviceHeight: _deviceHeight),
        SizedBox(
          height: _deviceHeight * 0.012,
        ),
        AppFormField(
            labelText: "Mobile",
            hintText: "Ex : 011 xxxxxxx",
            controller: _mobileController,
            isRequired: true,
            validator: (value) {},
            deviceHeight: _deviceHeight),
        SizedBox(
          height: _deviceHeight * 0.012,
        ),
        AppFormField(
            labelText: "NIC",
            hintText: "895556237V",
            controller: _nicController,
            isRequired: true,
            validator: (value) {},
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
          onPressed: () {},
        )
      ],
    );
  }

  Widget _registerTitleText() {
    return SizedBox(
      width: _deviceWidth,
      child: Text(
        "Sign Up",
        textAlign: TextAlign.center,
        style: AppStyles.titleTextStyle(_deviceHeight),
      ),
    );
  }
}
