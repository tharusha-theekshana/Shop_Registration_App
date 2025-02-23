import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/core/utils/app_colors.dart';
import 'package:shop_registration/core/widgets/custom_button.dart';
import 'package:shop_registration/providers/image_provider.dart';
import 'package:shop_registration/screens/register_flow/final_screen.dart';
import 'package:shop_registration/screens/register_flow/owner_details_screen.dart';

import '../../core/widgets/stepper_view.dart';
import '../../core/widgets/sub_title_widget.dart';
import '../../core/widgets/top_widgets.dart';
import '../../providers/shop_register_provider.dart';

class SummeryScreen extends StatefulWidget {
  const SummeryScreen({super.key});

  @override
  State<SummeryScreen> createState() => _SummeryScreenState();
}

class _SummeryScreenState extends State<SummeryScreen> {
  late double _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    final shopProvider = Provider.of<ShopRegisterProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(child: _bodyArea(shopProvider))),
    );
  }

  Widget _bodyArea(ShopRegisterProvider shopProvider) {
    return Container(
      width: _deviceWidth,
      padding: EdgeInsets.symmetric(
          vertical: _deviceHeight * 0.01, horizontal: _deviceWidth * 0.03),
      child: Column(
        children: [
          TopWidgets(),
          SubTitleWidget(text: "Registration Summery"),
          StepperView(step: 4, allSteps: 4),
          SizedBox(
            height: _deviceHeight * 0.04,
          ),
          _shopDetails(shopProvider),
          SizedBox(
            height: _deviceHeight * 0.02,
          ),
          _ownerDetails(shopProvider),
          SizedBox(
            height: _deviceHeight * 0.02,
          ),
          _bankDetails(shopProvider),
          SizedBox(
            height: _deviceHeight * 0.08,
          ),
          CustomButton(
            buttonText: "Register Shop",
            height: _deviceHeight * 0.05,
            width: _deviceWidth,
            color: AppColors.greenColor,
            onPressed: () {
              _showConfirmationDialog(context);
            },
          ),
          SizedBox(
            height: _deviceHeight * 0.04,
          )
        ],
      ),
    );
  }

  Widget _ownerDetails(ShopRegisterProvider shopProvider) {
    return Column(
      children: [
        _summeryTitle("Owner Details"),
        rowText(key: "Owner Name", value: shopProvider.ownerName),
        rowText(key: "Email", value: shopProvider.email),
        rowText(key: "Mobile Number", value: shopProvider.mobile),
        rowText(key: "NIC", value: shopProvider.nic)
      ],
    );
  }

  Widget _shopDetails(ShopRegisterProvider shopProvider) {
    return Column(
      children: [
        _brView(),
        _summeryTitle("Shop Details"),
        rowText(key: "Shop Name", value: shopProvider.shopName),
        rowText(key: "Address", value: shopProvider.address),
        rowText(key: "Shop Category", value: shopProvider.shopCategory),
        rowText(key: "Open Time", value: shopProvider.openTime),
        rowText(key: "Close Time", value: shopProvider.closeTime),
      ],
    );
  }

  Widget _bankDetails(ShopRegisterProvider shopProvider) {
    return Column(
      children: [
        _summeryTitle("Bank Details"),
        rowText(key: "Bank Name", value: shopProvider.bank),
        rowText(key: "Account Number", value: shopProvider.accountNumber),
        rowText(key: "Branch", value: shopProvider.branch),
        rowText(
            key: "Account Holder Name", value: shopProvider.accountHolderName)
      ],
    );
  }

  Widget _brView() {
    final imageProvider = Provider.of<ImagePickerProvider>(context);

    return Container(
      height: _deviceHeight * 0.35,
      width: _deviceWidth * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: imageProvider.selectedImageFile != null
            ? DecorationImage(
                image: FileImage(imageProvider.selectedImageFile),
                fit: BoxFit.cover,
              )
            : null, // In case the image is not selected
      ),
      child: imageProvider.selectedImageFile == null
          ? const Center(child: Text("No image selected"))
          : null, // Optional: display text when no image is selected
    );
  }

  Widget rowText({required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.005),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Text(
                key,
                style: TextStyle(
                    fontSize: _deviceHeight * 0.019,
                    fontWeight: FontWeight.w500),
              )),
          const Expanded(flex: 1, child: Text(" : ")),
          Expanded(
              flex: 7,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: _deviceHeight * 0.019,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  Widget _summeryTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.02),
      width: _deviceWidth,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: _deviceHeight * 0.028),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm"),
          content: Text("Are you sure you want to register the shop?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OwnerDetailsScreen()),
                  (route) => false, // This removes all previous routes
                ); // Close dialog
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.005),
                width: _deviceWidth * 0.15,
                decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: const Text(
                  "No",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => FinalScreen()),
                      (route) => false, // This removes all previous routes
                );
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: AppColors.greenColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
