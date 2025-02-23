import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/screens/register_flow/summery_screen.dart';
import 'package:shop_registration/shared/bank_names.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/drop_down_field.dart';
import '../../core/widgets/form_field.dart';
import '../../core/widgets/sub_title_widget.dart';
import '../../providers/shop_register_provider.dart';

class BankDetailsScreen extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _accountHolderNameController= TextEditingController();

  final _bankDetailsFormKey = GlobalKey<FormState>();

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


  Widget _inputArea(BuildContext context){
    final provider = Provider.of<ShopRegisterProvider>(context);

    return Form(
      key: _bankDetailsFormKey,
      child: Column(
        children: [
          SubTitleWidget(text: "Bank Details"),
          SizedBox(
            height: _deviceHeight * 0.025,
          ),
          DropDownField(
            labelText: "Bank",
            items: BankNames.bankNames,
            isRequired: true,
            deviceHeight: _deviceHeight,
          ),
          AppFormField(
              labelText: "Account Number",
              hintText: "",
              controller: _accountNumberController,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Account number is required.";
                }else if(value.length <= 10){
                  return "Account number length is invalid.";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.012,
          ),
          AppFormField(
              labelText: "Branch",
              hintText: "",
              controller: _branchController,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Branch is required";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.012,
          ),
          AppFormField(
              labelText: "Account Holder Name",
              hintText: "",
              controller: _accountNumberController,
              isRequired: true,
              maxLength: 10,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Account holder name is required";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.012,
          ),
          CustomButton(
            buttonText: "Next",
            height: _deviceHeight * 0.06,
            width: _deviceWidth,
            color: AppColors.greenColor,
            borderRadius: 25,
            fontSize: _deviceHeight * 0.02,
            onPressed: () {
              if (_bankDetailsFormKey.currentState!.validate()) {
              } else {
                print("Form is not validate");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SummeryScreen();
                },));
              }
            },
          )
        ],
      ),
    );
  }
}
