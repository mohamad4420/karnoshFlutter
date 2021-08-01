import 'package:flutter/material.dart';
import '../../widgets/Most/Most.dart';
import '../../widgets/Slider/slider.dart';
import '../../widgets/Menu/MyAppBar.dart';
import 'package:karnosh/src/pages/MainPages/Anime.dart';
import '../SelectionPageMore.dart';

class Searess extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Leading(),
      background: Most(
        type: "series_mt",
        generes: null,
        sort: true,
      ),
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

class SecundAppBar extends StatelessWidget {
  const SecundAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Searess()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.333333,
                child: Center(
                  child: Text(
                    "افلام",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Anime()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.333333,
                child: Center(
                  child: Text(
                    "انمي",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
