import 'package:flutter/material.dart';
import 'package:substances_ocr_app/screens/loading.dart';
import 'package:substances_ocr_app/screens/home.dart';
import 'package:substances_ocr_app/screens/camera.dart';
import 'package:substances_ocr_app/screens/history.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/main': (context) => Home(),
    '/camera': (context) => Camera(),
    '/history': (context) => History(),
  },
));
