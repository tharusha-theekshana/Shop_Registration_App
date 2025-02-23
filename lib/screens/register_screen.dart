import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/core/utils/app_styles.dart';
import 'package:shop_registration/core/widgets/widget_groups/owner_details.dart';

import '../providers/shop_register_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late double _deviceHeight, _deviceWidth;

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
          _buildFormFields()
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
              textAlign: TextAlign.center)
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    final provider = Provider.of<ShopRegisterProvider>(context);

    if (provider.currentStep == 1) {
      return OwnerDetails();
    } else if (provider.currentStep == 2) {
      return Container();
    }
    return Container();
  }
}
