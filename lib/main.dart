import 'package:flutter/material.dart';
import 'dart:async';
import 'package:substances_ocr_app/screens/loading.dart';
import 'package:substances_ocr_app/screens/home.dart';
import 'package:substances_ocr_app/screens/camera.dart';
import 'package:substances_ocr_app/screens/history.dart';

void main(){

  runApp(MaterialApp(
    initialRoute: '/main',
    routes: {
      '/': (context) => Loading(),
      '/main': (context) => HomeScreen(),
      '/camera': (context) => MyImage(),
      '/history': (context) => History(),
    },
  ));
}
