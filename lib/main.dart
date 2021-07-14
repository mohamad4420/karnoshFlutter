import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:karnosh/src/pages/search.dart';
import './src/body.dart';
import '/src/pages/search.dart';
import 'package:flutter/services.dart';
import './src/pages/Movie.dart';
import './src/pages/Anime.dart';
import './src/pages/Searess.dart';

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
    return MaterialApp(
        title: 'karnosh',
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeColor = Color(0xFF212121);

  final List<String> listGen = List.generate(10, (index) => 'Text $index');

  Widget build(BuildContext context) {
    mediaQueryData ??= MediaQuery.of(context);

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: homeColor,
        body: Stack(
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
                  backgroundColor: homeColor.withOpacity(0.3),
                  actions: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()),
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
        ));
  }
}
