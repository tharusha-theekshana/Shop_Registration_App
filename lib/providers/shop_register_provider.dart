import 'package:flutter/material.dart';

class ShopRegisterProvider extends ChangeNotifier {
  int _currentStep = 1;

  int get currentStep => _currentStep;

  void nextStep() {
    _currentStep++;
    notifyListeners();
  }

  void previousStep() {
    _currentStep--;
    notifyListeners();
  }

  String ownerName = '';
  String email = '';
  String mobile = '';
  String nic = '';

  void saveOwnerDetails(
      {required String name,
      required String email,
      required String mobile,
      required String nic}) {
    ownerName = name;
    email = email;
    mobile = mobile;
    nic = nic;
  }
}
