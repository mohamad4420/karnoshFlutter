import 'package:flutter/material.dart';
import 'package:karnosh/src/pages/MainPages/Home.dart';
import './src/pages/MainPages/Home.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: 'karnosh',
        debugShowCheckedModeBanner: false,
        home: Directionality(textDirection: TextDirection.rtl, child: Home()));
  }
}
