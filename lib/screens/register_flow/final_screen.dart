import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_colors.dart';
import 'package:shop_registration/core/widgets/custom_button.dart';

import 'owner_details_screen.dart';

class FinalScreen extends StatefulWidget {
  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  late double _deviceHeight, _deviceWidth;

  late String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = generateClientId();
  }

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Shop Registration is success.",textAlign: TextAlign.center,style: TextStyle(
              fontSize: _deviceHeight * 0.04,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(
            height: _deviceHeight * 0.03,
          ),
          Text("Shop Owner Id : $id",style: TextStyle(
              fontSize: _deviceHeight * 0.02,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(
            height: _deviceHeight * 0.04,
          ),
          Icon(Icons.check_circle_outline,color: AppColors.greenColor,size: 60,),
          SizedBox(
            height: _deviceHeight * 0.2,
          ),
          CustomButton(buttonText: "Ok", height: _deviceHeight * 0.05, color: AppColors.greenColor, fontWeight: FontWeight.bold, onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => OwnerDetailsScreen()),
                  (route) => false, // This removes all previous routes
            );
          },)
        ],
      ),
    );
  }

  String generateClientId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();
  }
}
