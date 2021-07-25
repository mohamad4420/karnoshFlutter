import 'package:flutter/material.dart';
import 'package:karnosh/src/pages/search.dart';
import './src/body.dart';
import '/src/pages/search.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(MyApp());
}

var mediaQueryData;
var colorMenu = Colors.transparent;
var colorMenuSlide = Colors.black;
var homeColor = Colors.black;

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
            extendBodyBehindAppBar: true,
            backgroundColor: homeColor,
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
//0xFF212121
  //final List<String> listGen = List.generate(10, (index) => 'Text $index');
  var botIndex = 0;

  Widget build(BuildContext context) {
    mediaQueryData ??= MediaQuery.of(context);

    return CustomScrollView(
      slivers: [
        MainAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          Stack(children: [
            Mybody(),
            SecundAppBar(),
          ]),
        ]))
      ],
    );
  }
}

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      brightness: Brightness.dark,
      backgroundColor: colorMenu,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
            width: 20,
            image: NetworkImage(
                "https://user-images.githubusercontent.com/33750251/59487006-313d6080-8e73-11e9-8c50-3a5660761138.png")),
      ),
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
          padding: const EdgeInsets.all(10.0),
          child: Image(
              width: 30,
              image: NetworkImage(
                  "https://i.pinimg.com/originals/b6/77/cd/b677cd1cde292f261166533d6fe75872.png")),
        ),
      ],
    );
  }
}

class SecundAppBar extends StatelessWidget {
  const SecundAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.black.withOpacity(0.5),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "افلام",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "مسلسلات",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "انمي",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
        ],
      ),
    );
  }
}
