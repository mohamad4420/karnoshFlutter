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
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 40,
            height: 20,
            color: Color(0xff180606),
            child: Image.asset(
              "images/favicon.png",
            ),
            padding: EdgeInsets.all(5),
          ),
        ),
      ),
      background: Most(
        type: "anime",
        generes: null,
        sort: true,
      ),
      //bottonAppBar: SecundAppBar(),
      body: Wrap(children: [
        SliderItem(
          name: "أحدث الانميات المضافة",
          type: "anime",
          stored: true,
          genres: null,
        ),
        SliderItem(
          name: "انميات سحر",
          type: "anime",
          stored: true,
          genres: "سحر",
        ),
        SliderItem(
          name: "انميات اكشن",
          type: "anime",
          stored: true,
          genres: "أكشن",
        ),
        SliderItem(
          name: "انميات خارق للعادة",
          type: "anime",
          stored: false,
          genres: "خارق للعادة",
        ),
        SliderItem(
          name: "انميات دراما",
          type: "anime",
          stored: false,
          genres: "دراما",
        ),
        SliderItem(
          name: "انميات رومانسي",
          type: "anime",
          stored: false,
          genres: "رومانسي",
        ),
        SliderItem(
          name: "انميات شريحة من الحياة",
          type: "anime",
          stored: false,
          genres: "شريحة من الحياة",
        ),
        SliderItem(
          name: "انميات فنتازيا",
          type: "anime",
          stored: false,
          genres: "فنتازيا",
        ),
        SliderItem(
          name: "انميات خيال علمي",
          type: "anime",
          stored: false,
          genres: "خيال علمي",
        ),
        SliderItem(
          name: "انميات مدرسي",
          type: "anime",
          stored: false,
          genres: "مدرسي",
        ),
        SliderItem(
          name: "انميات شونين",
          type: "anime",
          stored: false,
          genres: "شونين",
        ),
        SliderItem(
          name: "انميات كوميدي",
          type: "anime",
          stored: false,
          genres: "كوميدي",
        ),
        SliderItem(
          name: "انميات رعب",
          type: "anime",
          stored: false,
          genres: "رعب",
        ),
        SliderItem(
          name: "انميات بوليسي",
          type: "anime",
          stored: false,
          genres: "بوليسي",
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
