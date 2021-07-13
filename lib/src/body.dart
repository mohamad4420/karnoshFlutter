import 'package:flutter/material.dart';
import './widgets/Most/Most.dart';
import './widgets/Slider/slider.dart';

final themeMode = ValueNotifier(2);

class Mybody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Most(),
        SliderItem(name: "حياة"),
        SliderItem(name: "اطفال"),
        SliderItem(name: "اكشن"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
        SliderItem(name: "مغامرات"),
      ],
    ));
  }
}
