import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/providers/image_provider.dart';
import 'package:shop_registration/screens/register_flow/bank_details_screen.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/drop_down_field.dart';
import '../../core/widgets/form_field.dart';
import '../../core/widgets/sub_title_widget.dart';
import '../../providers/shop_register_provider.dart';
import '../../shared/shop_categories.dart';

class ShopDetailsScreen extends StatelessWidget {
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _openTimeController = TextEditingController();
  final TextEditingController _closeTimeController = TextEditingController();

  late double _deviceHeight, _deviceWidth;

  final _shopDetailsFormKey = GlobalKey<FormState>();


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
    final imageProvider = Provider.of<ImagePickerProvider>(context);

    return Form(
      key: _shopDetailsFormKey,
      child: Column(
        children: [
          SubTitleWidget(text: "Shop Details"),
          SizedBox(
            height: _deviceHeight * 0.025,
          ),
          AppFormField(
              labelText: "Shop Name",
              hintText: "",
              controller: _shopNameController,
              textInputType: TextInputType.name,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Shop name is required";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.012,
          ),
          AppFormField(
              labelText: "Address",
              hintText: "",
              controller: _addressController,
              textInputType: TextInputType.text,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Address is required";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.012,
          ),
          DropDownField(
            labelText: "Shop Category",
            items: ShopCategories.shopCategories,
            isRequired: true,
            deviceHeight: _deviceHeight,
            setValue: (value) {
              provider.setShopCategory(value);
            },
          ),
          timePicker(
              labelText: "Open Time",
              controller: _openTimeController,
              isRequired: true,
              context: context),
          timePicker(
              labelText: "Close Time",
              controller: _closeTimeController,
              isRequired: true,
              context: context),
          ElevatedButton(
            onPressed: () => imageProvider.setImage(ImageSource.camera,_shopNameController.text),
            child: Text("Pick Image"),
          ),
          CustomButton(
            buttonText: "Next",
            height: _deviceHeight * 0.06,
            width: _deviceWidth,
            color: AppColors.greenColor,
            borderRadius: 25,
            fontSize: _deviceHeight * 0.02,
            onPressed: () {
              if (_shopDetailsFormKey.currentState!.validate()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BankDetailsScreen();
                },));
              } else {
                print("Form is not validate");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BankDetailsScreen();
                },));
              }
            },
          )
        ],
      ),
    );
  }

  Widget timePicker(
      {required String labelText,
        required TextEditingController controller,
        required bool isRequired,
        required BuildContext context}) {
    return AppFormField(
      labelText: labelText,
      hintText: "",
      controller: controller,
      validator: (p0) {},
      deviceHeight: _deviceHeight,
      isRequired: isRequired,
      suffixIcon: IconButton(
          onPressed: () => selectTime(context,controller),
          icon: Icon(Icons.access_time_outlined)),
    );
  }

  Future<void> selectTime(BuildContext context, TextEditingController controller) async {
    TimeOfDay _time = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (pickedTime != null) {
      // Format the selected time as HH:mm:ss
      final formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:'
          '${pickedTime.minute.toString().padLeft(2, '0')}:00';

      controller.text = formattedTime;
    }
  }
}
