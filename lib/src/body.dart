import 'package:flutter/material.dart';
import 'slider.dart';
import 'SliderTest.dart';

final themeMode = ValueNotifier(2);

class Mybody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Container(
          child: Text("action", style: TextStyle(fontSize: 35)),
        ),
        MySliderTest(),
        Container(
          child: Text("horror", style: TextStyle(fontSize: 35)),
        ),
        MySliderTest(),
        Container(
          child: Text("life", style: TextStyle(fontSize: 35)),
        ),
        MySliderTest(),
        Container(
          child: Text("children", style: TextStyle(fontSize: 35)),
        ),
        MySliderTest()
      ],
    ));
  }
}
