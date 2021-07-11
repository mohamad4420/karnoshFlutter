import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.black12,
      title: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            border: OutlineInputBorder(),
            hintText: 'shit',
            hintStyle: TextStyle(color: Colors.black54)),
      ),
    ));
  }
}
