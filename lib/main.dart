import 'dart:ui';
import 'package:flutter/material.dart';
import './src/body.dart';
import './src/DrowerHome.dart';

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
  Widget build(BuildContext context) {
    mediaQueryData ??= MediaQuery.of(context);
    String device = getDeviceType(mediaQueryData);

    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("karnosh"),
          backgroundColor: Colors.red[400],
          centerTitle: device == "Desktop" || device == "Tablet" ? false : true,
          leading: device == "Desktop" || device == "Tablet" ? MyIcon() : null,
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
