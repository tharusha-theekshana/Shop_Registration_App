import 'package:flutter/material.dart';

class ShopRegisterProvider extends ChangeNotifier {
  String ownerName = '';
  String ownerEmail = '';
  String ownerMobile = '';
  String ownerNic = '';

  String shopName = "";
  String shopAddress = "";
  String shopCategory = "";
  String shopOpenTime = "";
  String shopCloseTime = "";

  String accountBank = "";
  String accountNumber = "";
  String accountBranch = "";
  String accountHolderName = "";

  // Set owner details
  void saveOwnerDetails(
      {required String name,
      required String email,
      required String mobile,
      required String nic}) {
    ownerName = name;
    ownerEmail = email;
    ownerMobile = mobile;
    ownerNic = nic;

    notifyListeners();
  }

  // Set shop details
  void saveShopDetails({required String name,required String address,required String openTime,required String closeTime}){
    shopName = name;
    shopAddress = address;
   shopOpenTime = openTime;
    shopCloseTime = closeTime;

    notifyListeners();
  }

  // Set shop category
  void setShopCategory(String category){
    shopCategory = category;
    notifyListeners();
  }

  // Set bank name
  void setBankName(String bankName){
    accountBank = bankName;
    notifyListeners();
  }

  // Set bank details
  void saveBankDetails(
      {required String accNumber,
        required String branch,
        required String accountName}) {
    accountNumber = accNumber;
    accountBranch = branch;
    accountHolderName = accountName;

    notifyListeners();
  }
}
