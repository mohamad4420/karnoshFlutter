import 'package:flutter/material.dart';

class DrowerHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
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
          ),
          ListTile(
            title: Text("الصفحه الرئيسيه"),
            leading: Icon(Icons.home),
            onTap: () => {},
          ),
          ListTile(
            title: Text("الاقسام"),
          ),
          Divider(
            color: Colors.black54,
          ),
          ListTile(
            title: Text("افلام"),
            leading: Icon(Icons.movie),
            onTap: () => {},
          ),
          ListTile(
            title: Text("مسلسلسلات"),
            leading: Icon(Icons.mobile_friendly),
            onTap: () => {},
          ),
          ListTile(
            title: Text("انمي"),
            leading: Icon(Icons.animation),
            onTap: () => {},
          ),
          ListTile(
            title: Text("قائمتي"),
            leading: Icon(Icons.my_library_add),
            onTap: () => {},
          ),
        ],
      )),
    );
  }
}
