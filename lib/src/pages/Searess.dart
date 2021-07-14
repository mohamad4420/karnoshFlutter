import 'package:flutter/material.dart';
import '../widgets/Most/Most.dart';
import '../widgets/Slider/slider.dart';

class Searess extends StatelessWidget {
  const Searess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
          title: Text("مسلسلات"),
          backgroundColor: Color(0xFF222222),
        ),
        body: ListView(
          children: [
            Most(),
            SliderItem(
              name: "مسلسلات عربيه ",
              type: "series_ar",
              stored: true,
              genres: null,
            ),
            SliderItem(
              name: "افلام تركيه ",
              type: "movie_tr",
              stored: false,
              genres: null,
            ),
            SliderItem(
              name: "افلام هنديه ",
              type: "movie_hn",
              stored: false,
              genres: null,
            ),
            SliderItem(
              name: "افلام وثائقيه ",
              type: "movie_wth",
              stored: false,
              genres: null,
            ),
          ],
        ),
      ),
    );
  }
}
