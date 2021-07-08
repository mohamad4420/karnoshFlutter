import 'package:flutter/material.dart';
import 'package:karnoshflutter/main.dart';

class Mybody extends StatelessWidget {
  Widget build(BuildContext context) {
    String device = getDeviceType(mediaQueryData);
    return Container(
      child: Text(device,
          style: TextStyle(
            fontSize: 22,
            color: Colors.red[600],
            letterSpacing: 5,
            wordSpacing: 15,
          )),
    );
  }
}
