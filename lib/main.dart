import 'package:flutter/material.dart';
import 'package:karnosh/src/pages/search.dart';
import 'package:karnosh/src/widgets/Most/Most.dart';
import './src/body.dart';
import '/src/pages/search.dart';
import 'package:flutter/services.dart';
import './src/pages/Movie.dart';
import './src/pages/Anime.dart';
import './src/pages/Searess.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(MyApp());
}

var mediaQueryData;

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);

    return MaterialApp(
        title: 'karnosh',
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: HomePage(),
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeColor = Colors.black;
//0xFF212121
  //final List<String> listGen = List.generate(10, (index) => 'Text $index');
  var botIndex = 0;

  Widget build(BuildContext context) {
    mediaQueryData ??= MediaQuery.of(context);

    return Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: botIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {},
          items: [
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Music',
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              label: 'Places',
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              label: 'News',
              icon: Icon(Icons.library_books),
            ),
          ],
        ),
        backgroundColor: homeColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              brightness: Brightness.dark,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                    icon: Icon(Icons.search)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      width: 30,
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/b6/77/cd/b677cd1cde292f261166533d6fe75872.png")),
                )
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                width: double.infinity,
                child: Mybody(),
              ),
            ]))
          ],
        ));
  }
}

class StackMy extends StatelessWidget {
  const StackMy({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Mybody(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                      child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Movie()),
                      )
                    },
                    child: Text(
                      "افلام",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
                Expanded(
                  child: Center(
                      child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Searess()),
                      )
                    },
                    child: Text("مسلاسلات",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  )),
                ),
                Expanded(
                  child: Center(
                      child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Anime()),
                      )
                    },
                    child: Text("انمي",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  )),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0, //https://karnoshab.herokuapp.com/icon/favicon.png
            child: AppBar(
              brightness: Brightness.dark,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                    icon: Icon(Icons.search)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                      width: 30,
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/b6/77/cd/b677cd1cde292f261166533d6fe75872.png")),
                )
              ],
            ))
      ],
    );
  }
}
