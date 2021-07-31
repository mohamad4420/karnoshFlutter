import 'package:flutter/material.dart';
import '../../widgets/Most/Most.dart';
import '../../widgets/Slider/slider.dart';
import '../../widgets/Menu/MyAppBar.dart';
import '../SelectionPageMore.dart';

class Anime extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Leading(),
      background: Most(),
      body: Wrap(children: [
        SliderItem(
          name: "احدث الانميات ",
          type: "anime",
          stored: true,
          genres: null,
        ),
        SliderItem(
          name: "انميات اكشن ",
          type: "anime",
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
        SliderItem(
          name: "احدث الانميه ",
          type: "anime",
          stored: true,
          genres: null,
        ),
        SliderItem(
          name: "انميات اكشن ",
          type: "anime",
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
          name: "احدث الانميه ",
          type: "anime",
          stored: true,
          genres: null,
        ),
        SliderItem(
          name: "انميات اكشن ",
          type: "anime",
          stored: false,
          genres: null,
        ),
        SliderItem(
          name: "افلام عربيه ",
          type: "movie_ar",
          stored: false,
          genres: null,
        ),
      ]),
    );
  }
}

class Leading extends StatelessWidget {
  const Leading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SelectionPageMore()));
      },
      child: Row(
        children: [
          Text(
            "التصنيفات ",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Icon(
            Icons.expand_more_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
