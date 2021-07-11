import 'package:flutter/material.dart';
import 'package:karnosh/src/Most.dart';
import 'Slider.dart';

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
      ],
    ));
  }
}

class SliderItem extends StatelessWidget {
  @required
  final String? name;
  SliderItem({this.name});
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              name ?? '',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
          MySlider(),
        ],
      ),
    );
  }
}
