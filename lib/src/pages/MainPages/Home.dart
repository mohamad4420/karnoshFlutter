import 'package:flutter/material.dart';
import '../../widgets/Most/Most.dart';
import '../../widgets/Slider/slider.dart';
import '../../widgets/Menu/MyAppBar.dart';
import 'package:karnosh/src/pages/MainPages/Anime.dart';
import 'package:karnosh/src/pages/MainPages/Movie.dart';
import 'package:karnosh/src/pages/MainPages/Searess.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyAppBar(
      leading: Image(width: 20, image: AssetImage("images/favicon.png")),
      background: Most(
        type: "movie_mt",
        generes: null,
        sort: true,
      ),
      bottonAppBar: SecundAppBar(),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Movie()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Searess()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.333333,
                child: Center(
                  child: Text(
                    "مسلسلات",
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
