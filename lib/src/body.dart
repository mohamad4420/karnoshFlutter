import 'package:flutter/material.dart';
import './Most.dart';
import 'slider.dart';
import 'SliderTest.dart';

final themeMode = ValueNotifier(2);

class Mybody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.red[400]),
        child: ListView(
          children: <Widget>[Most()],
        ));
  }
}
