import 'dart:ui';

import 'package:flutter/material.dart';
import './src/body.dart';
import './src/DrowerHome.dart';

void main() {
  runApp(MyApp());
}

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
    return Scaffold(
        appBar: AppBar(
          title: Text("karnosh"),
          backgroundColor: Colors.red[400],
        ),
        drawer: DrowerHome(),
        body: Mybody());
  }
}
