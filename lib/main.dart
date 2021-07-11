import 'dart:ui';
import 'package:flutter/material.dart';
import './src/body.dart';
import './src/DrowerHome.dart';
import './src/Search.dart';

void main() {
  runApp(MyApp());
}

var mediaQueryData;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'karnosh',
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  var homeColor = Color(
    0xff670909,
  );
  final List<String> listGen = List.generate(10, (index) => 'Text $index');
  Widget build(BuildContext context) {
    mediaQueryData ??= MediaQuery.of(context);
    String device = getDeviceType(mediaQueryData);

    return Scaffold(
        backgroundColor: homeColor,
        appBar: AppBar(
          title: Text("karnosh"),
          backgroundColor: homeColor,
          centerTitle: device == "Desktop" || device == "Tablet" ? false : true,
          leading: device == "Desktop" || device == "Tablet" ? MyIcon() : null,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: Search(searchList: listGen));
                },
                icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
          ],
        ),
        drawer: device == "Desktop" || device == "Tablet" ? null : DrowerHome(),
        body: Mybody());
  }
}

class MyIcon extends StatelessWidget {
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Image.asset('../icon/favicon.png'));
      },
    );
  }
}

String getDeviceType(MediaQueryData mediaQueryData) {
  double width = mediaQueryData.size.width;
  if (width >= 950) {
    return "Desktop";
  }
  return "Mobile";
}
