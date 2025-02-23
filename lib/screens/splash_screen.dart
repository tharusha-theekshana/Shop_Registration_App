import 'package:flutter/material.dart';
import 'package:shop_registration/core/utils/app_colors.dart';
import 'package:shop_registration/screens/register_flow/owner_details_screen.dart';
import '../core/utils/app_styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double _deviceHeight, _deviceWidth;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OwnerDetailsScreen()), // Replace with your next screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "MyShop",
              textAlign: TextAlign.center,
              style: AppStyles.titleTextStyle(_deviceHeight),
            ),
            SizedBox(height: _deviceHeight * 0.1),
            const SizedBox(
              width: 23.0,
              height: 23.0,
              child: CircularProgressIndicator(
                color: AppColors.greenColor,
                strokeWidth: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
