import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path;

class ImagePickerProvider extends ChangeNotifier{
  late File? imageFile;
  late File selectedImageFile;
  bool? validate = true;
  late String imageType;

  final ImagePicker picker = ImagePicker();

  Future<void> setImage(ImageSource source,String shopName) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        bool sizeOk = checkImageSize(imageFile!);
        bool typeOk = checkImageType(imageFile!);

        if(sizeOk == true && typeOk == true){
          selectedImageFile = imageFile!;
          saveImageLocally(selectedImageFile,shopName);
          validate = true;
        }else{
          imageFile = null;
          validate = false;
        }

      } else {
        print('No image selected.');
        validate = false;
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> saveImageLocally(File image,String shopName) async {
    final appDir = await path.getApplicationDocumentsDirectory();

    imageType = imageFile!.path.split('.').last.toLowerCase();
    final localImage = await image.copy('${appDir.path}/"$shopName - BR".$imageType');

    print('Image saved locally: ${localImage}');
  }

  bool checkImageSize(File imageFile) {
    int bytes = imageFile.lengthSync();
    double kb = bytes / 1024;
    if(kb > 102400){
      return false;
    }else{
      print('Image size: $kb KB');
      return true;
    }
  }

  bool checkImageType(File imageFile) {
    imageType = imageFile.path.split('.').last.toLowerCase();
    print('Image type: $imageType');
    if (imageType == 'jpg' || imageType == 'jpeg') {
      return true;
    } else if (imageType == 'png') {
      return true;
    } else {
      return false;
    }
  }


}