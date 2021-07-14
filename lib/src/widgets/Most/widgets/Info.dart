import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: 70,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {
            // BottomSliderMost(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.white70,
              ),
              Text('معلومات', style: TextStyle(color: Colors.white70))
            ],
          ),
        ));
  }
}
