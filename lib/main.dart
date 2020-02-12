import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:substances_ocr_app/screens/loading.dart';
import 'package:substances_ocr_app/screens/home.dart';
import 'package:substances_ocr_app/screens/camera.dart';
import 'package:substances_ocr_app/screens/history.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    initialRoute: '/camera',
    routes: {
      '/': (context) => Loading(),
      '/main': (context) => HomeScreen(),
      '/camera': (context) => CameraScreen(
        camera: firstCamera,
      ),
      '/history': (context) => History(),
    },
  ));
}
