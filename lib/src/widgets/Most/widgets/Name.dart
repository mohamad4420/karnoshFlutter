import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  final String name;
  Name(this.name);
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 27,
            )),
      ),
    );
  }
}
