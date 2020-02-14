import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final GestureTapCallback onPressed;
  final IconData icon;

  const BottomButton({@required this.label, @required this.onPressed, @required this.icon});


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(0, 3.0, 0, 3.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,1),
            child: Icon(
              icon,
              size: 26.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}