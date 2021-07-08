import 'package:flutter/material.dart';
import './src/body.dart';

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
          title: Text("karnsoh"),
          backgroundColor: Colors.red[400],
        ),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("mohamad abudaya"),
              accountEmail: Text("m1152580@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Image(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/ogw/ADea4I4APSzm8AVe1Kb_t3-9pt8fJXV9EPV3p347d-jp0FI=s500-c-mo'),
                  fit: BoxFit.fill,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red[400],
              ),
            )
          ],
        )),
        body: Mybody());
  }
}
