import 'package:flutter/material.dart';
import 'dart:io';

class MyImage extends StatelessWidget {

  final File myImage;

  MyImage({@required this.myImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: FileImage(myImage),
      ),
    );
  }
}
