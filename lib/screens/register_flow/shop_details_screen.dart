import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/core/utils/app_styles.dart';
import 'package:shop_registration/providers/image_provider.dart';
import 'package:shop_registration/screens/register_flow/bank_details_screen.dart';

import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/drop_down_field.dart';
import '../../core/widgets/form_field.dart';
import '../../core/widgets/stepper_view.dart';
import '../../core/widgets/sub_title_widget.dart';
import '../../core/widgets/top_widgets.dart';
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
      body: SafeArea(child: SingleChildScrollView(child: _bodyArea(context))),
    );
  }

  Widget _bodyArea(BuildContext context) {
    return Container(
      width: _deviceWidth,
      padding: EdgeInsets.symmetric(
          vertical: _deviceHeight * 0.01, horizontal: _deviceWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopWidgets(),
          SubTitleWidget(text: "Shop Details"),
          StepperView(step: 2, allSteps: 4),
          _inputArea(context)
        ],
      ),
    );
  }

  Widget _inputArea(BuildContext context) {
    final provider = Provider.of<ShopRegisterProvider>(context);
    final imageProvider = Provider.of<ImagePickerProvider>(context);

    return Form(
      key: _shopDetailsFormKey,
      child: Column(
        children: [
          SizedBox(
            height: _deviceHeight * 0.025,
          ),
          AppFormField(
              labelText: "Shop Name",
              hintText: "ex : Example stores",
              controller: _shopNameController,
              textInputType: TextInputType.name,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Shop name is required.";
                }
                return null;
              },
              deviceHeight: _deviceHeight),
          SizedBox(
            height: _deviceHeight * 0.015,
          ),
          AppFormField(
              labelText: "Address",
              hintText: "ex : 01 lane, Colombo.",
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
            height: _deviceHeight * 0.015,
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
          SizedBox(
            height: _deviceHeight * 0.015,
          ),
          timePicker(
              labelText: "Open Time",
              hintText: "00:00:00 A.M",
              controller: _openTimeController,
              textInputType: TextInputType.none,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Open time is required";
                } else if(_closeTimeController.text == value){
                  return "Open time can not be close time";
                }
                return null;
              },
              context: context),
          SizedBox(
            height: _deviceHeight * 0.015,
          ),
          timePicker(
              labelText: "Close Time",
              hintText: "00:00:00 P.M",
              controller: _closeTimeController,
              textInputType: TextInputType.none,
              isRequired: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Close time is required";
                }else if(_openTimeController.text == value){
                  return "Close time can not be open time";
                }
                return null;
              },
              context: context),
          SizedBox(
            height: _deviceHeight * 0.015,
          ),
          _filePicketButtonSet(context, imageProvider),
          SizedBox(
            height: _deviceHeight * 0.08,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomButton(
                  buttonText: "Back",
                  height: _deviceHeight * 0.06,
                  color: AppColors.redColor,
                  borderRadius: 25,
                  fontSize: _deviceHeight * 0.02,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomButton(
                  buttonText: "Next",
                  height: _deviceHeight * 0.06,
                  color: AppColors.greenColor,
                  borderRadius: 25,
                  fontSize: _deviceHeight * 0.02,
                  onPressed: () {
                    if (_shopDetailsFormKey.currentState!.validate() && imageProvider.uploadedFileName.isNotEmpty) {
                      provider.saveShopDetails(
                          shopName: _shopNameController.text,
                          address: _addressController.text,
                          openTime: _openTimeController.text,
                          closeTime: _closeTimeController.text);

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BankDetailsScreen();
                        },
                      ));
                    } else {
                      print("Form is not validate");
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _filePicketButtonSet(BuildContext context,
      ImagePickerProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: "BR Image",
              style: AppStyles.inputLabelTextStyle(context, _deviceHeight),
              children: [
                TextSpan(
                  text: " *",
                  style: TextStyle(
                    fontSize: _deviceHeight * 0.02,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redColor, // Ensure color is set
                  ),
                ),
              ]),
        ),
        Text(provider.uploadedFileName),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                buttonText: "Take Photo",
                height: _deviceHeight * 0.05,
                color: AppColors.greyColor,
                onPressed: () =>
                    provider.setImage(
                        ImageSource.camera, _shopNameController.text),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 1,
              child: CustomButton(
                buttonText: "Select from Gallery",
                color: AppColors.dividerColor,
                height: _deviceHeight * 0.05,
                onPressed: () =>
                    provider.setImage(
                        ImageSource.gallery, _shopNameController.text),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget timePicker({required String labelText,
    required String hintText,
    required TextEditingController controller,
    required bool isRequired,
    required String? Function(String?)? validator,
    required TextInputType textInputType,
    required BuildContext context
  }) {
    return AppFormField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      validator: validator,
      deviceHeight: _deviceHeight,
      isRequired: isRequired,
      textInputType: textInputType,
      suffixIcon: IconButton(
          onPressed: () => selectTime(context, controller),
          icon: const Icon(Icons.access_time_outlined)),
    );
  }

  Future<void> selectTime(BuildContext context,
      TextEditingController controller) async {
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
