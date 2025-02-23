import 'package:flutter/material.dart';

class ShopRegisterProvider extends ChangeNotifier {
  String ownerName = '';
  String email = '';
  String mobile = '';
  String nic = '';

  String shopName = "";
  String address = "";
  String shopCategory = "";
  String openTime = "";
  String closeTime = "";

  String bank = "";
  String accountNumber = "";
  String branch = "";
  String accountHolderName = "";

  // Set owner details
  void saveOwnerDetails(
      {required String name,
      required String email,
      required String mobile,
      required String nic}) {
    ownerName = name;
    email = email;
    mobile = mobile;
    nic = nic;

    notifyListeners();
  }

  // Set shop details
  void saveShopDetails({required String shopName,required String address,required String openTime,required String closeTime}){
    shopName = shopName;
    address = address;
    openTime = openTime;
    closeTime = closeTime;

    notifyListeners();
  }

  // Set shop category
  void setShopCategory(String category){
    shopCategory = category;
    notifyListeners();
  }

  // Set bank name
  void setBankName(String bankName){
    bank = bankName;
    notifyListeners();
  }

  // Set bank details
  void saveBankDetails(
      {required String accountNumber,
        required String branch,
        required String accountHolderName}) {
    accountNumber = accountNumber;
    branch = branch;
    accountHolderName = accountHolderName;

    notifyListeners();
  }
}
