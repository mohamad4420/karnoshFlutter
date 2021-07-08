import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'karnosh',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("karnsoh"),
              backgroundColor: Colors.red[400],
              centerTitle: true,
            ),
            endDrawer: Drawer(
                child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("mohamad abudaya"),
                  accountEmail: Text("m1152580@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    child: Image(
                      image: NetworkImage(
                          'https://lh3.googleusercontent.com/ogw/ADea4I4APSzm8AVe1Kb_t3-9pt8fJXV9EPV3p347d-jp0FI=s500-c-mo'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                  ),
                )
              ],
            )),
            drawer: Drawer(text: Text("abodia "))));
  }
}
