import 'package:flutter/material.dart';
import 'dart:io';

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final myImage = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Image(
        image: FileImage(myImage),
      ),
    );
  }
}
