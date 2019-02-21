import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/settings.dart';

class Insurance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),

        Positioned(
          top: 50,
          right: 100,
            child: Container(
          child: Icon(Icons.blur_on),
        )),
      ],
    );
  }
}
