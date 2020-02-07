import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton.icon(
          label: Text("Go home"),
          icon: Icon(
            Icons.navigate_next,
            size: 50.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
        )
      ),
    );
  }
}
