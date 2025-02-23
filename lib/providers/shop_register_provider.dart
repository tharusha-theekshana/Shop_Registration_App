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

  void setShopCategory(String category){
    shopCategory = category;
  }

  void setBankName(String bankName){
    bank = bankName;
  }

  void saveBankDetails(
      {required String accountNumber,
        required String branch,
        required String accountHolderName}) {
    accountNumber = accountNumber;
    branch = branch;
    accountHolderName = accountHolderName;
  }
}
