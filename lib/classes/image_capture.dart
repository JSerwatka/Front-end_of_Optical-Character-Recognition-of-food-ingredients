import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class ImageCaptureState {

  File imageFile;

  // Select an image via gallery or camera
  Future<void> pickImage(ImageSource source) async {
    try {
      File selected = await ImagePicker.pickImage(source: source);
      this.imageFile = selected;
    }
    catch (e){
      print("cought error: $e");
      this.imageFile = null;
    }
  }

  Future<void> cropImage() async{
    try {
      File cropped = await ImageCropper.cropImage(
          sourcePath: this.imageFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.lightBlue[100],
              toolbarWidgetColor: Colors.grey[800],
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          )
      );

      this.imageFile =  cropped ?? this.imageFile;
    }
    catch (e){
      print("cought error: $e");
      this.imageFile = null;
    }
  }

  Future<void> pickAndCropImage(ImageSource source) async {
    await pickImage(source);
    await cropImage();
  }
}