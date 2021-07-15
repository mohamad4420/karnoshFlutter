import 'package:flutter/material.dart';
import './widgets/Most/Most.dart';
import './widgets/Slider/slider.dart';

class Mybody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Most(),
        SliderItem(
          name: "احدث الافلام ",
          type: "movie_mt",
          stored: true,
          genres: null,
        ),
        SliderItem(
          name: "احدث الانميات ",
          type: "anime",
          stored: false,
          genres: null,
        ),
        SliderItem(
          name: "افلام مترجمه ",
          type: "movie_mt",
          stored: false,
          genres: null,
        ),
        SliderItem(
          name: "افلام عربيه ",
          type: "movie_ar",
          stored: false,
          genres: null,
        ),
        SliderItem(
          name: "افلام تركيه ",
          type: "movie_tr",
          stored: false,
          genres: null,
        ),
      ],
    ));
  }
}
