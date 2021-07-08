import 'dart:ui';

import 'package:flutter/material.dart';
import './src/body.dart';
import './src/DrowerHome.dart';

void main() {
  runApp(MyApp());
}

var mediaQueryData;
var device;

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
    device ??= getDeviceType(mediaQueryData);
    return Scaffold(
        appBar: AppBar(
          title: Text(device),
          backgroundColor: Colors.red[400],
        ),
        drawer: device == "Desktop" || device == "Tablet" ? null : DrowerHome(),
        body: Mybody());
  }
}

String getDeviceType(MediaQueryData mediaQueryData) {
  double width = mediaQueryData.size.width;

  if (width >= 950) {
    return "Desktop";
  }

  return "Mobile";
}
