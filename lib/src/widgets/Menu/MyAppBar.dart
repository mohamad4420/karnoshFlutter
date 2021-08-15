import 'package:flutter/material.dart';
import 'package:karnosh/src/pages/search/search.dart';

var homeColor = Colors.black;

class MyAppBar extends StatelessWidget {
  final Widget body;
  final Widget bottonAppBar;
  final Widget background;
  final Widget leading;
  final Widget title;
  const MyAppBar(
      {Key key,
      this.body,
      this.title,
      this.background,
      this.leading,
      this.bottonAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: homeColor,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              /* bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: bottonAppBar),
              ),*/
              expandedHeight: MediaQuery.of(context).size.height * 0.8,
              pinned: true,
              title: title,
              centerTitle: true,
              brightness: Brightness.dark,
              backgroundColor: Colors.black.withOpacity(0.3),
              leading: leading,
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
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image(
                          width: 30,
                          image: AssetImage('images/AccountImage.png'))),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: background,
              ),
            ),
            SliverList(delegate: SliverChildListDelegate([body]))
          ],
        ),
      ),
    );
  }
}
