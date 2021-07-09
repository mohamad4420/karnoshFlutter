import 'package:flutter/material.dart';
import 'slider.dart';
import 'SliderTest.dart';

final themeMode = ValueNotifier(2);

class Mybody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Text(
          "Karnosh",
          style: TextStyle(fontSize: 50),
          textAlign: TextAlign.center,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.amber[100],
              border: Border(bottom: BorderSide(width: 2, color: Colors.blue))),
          child: Text("action", style: TextStyle(fontSize: 35)),
        ),
        MySlider(),
        Container(
          decoration: BoxDecoration(
              color: Colors.amber[100],
              border: Border(bottom: BorderSide(width: 2, color: Colors.blue))),
          child: Text("horror", style: TextStyle(fontSize: 35)),
        ),
        MySlider(),
        Container(
          decoration: BoxDecoration(
              color: Colors.amber[100],
              border: Border(bottom: BorderSide(width: 2, color: Colors.blue))),
          child: Text("life", style: TextStyle(fontSize: 35)),
        ),
        MySlider(),
        Container(
          decoration: BoxDecoration(
              color: Colors.amber[100],
              border: Border(bottom: BorderSide(width: 2, color: Colors.blue))),
          child: Text("children", style: TextStyle(fontSize: 35)),
        ),
        MySlider(),
        MySliderTest()
      ],
    ));
  }
}
