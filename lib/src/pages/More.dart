import 'package:flutter/material.dart';

class More extends StatelessWidget {
  final String name;
  const More({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
