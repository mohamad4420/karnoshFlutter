import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white // set the background color

              ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
              Text(
                'تشغيل',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )
            ],
          ),
        ));
  }
}
