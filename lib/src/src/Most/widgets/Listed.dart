import 'package:flutter/material.dart';

class Listed extends StatefulWidget {
  _ListedState createState() => _ListedState();
}

class _ListedState extends State<Listed> {
  bool isListed = false;
  Widget build(BuildContext context) {
    return Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.33),
        width: MediaQuery.of(context).size.width * 0.33,
        height: 70,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {
            setState(() {
              if (isListed == false)
                isListed = true;
              else
                isListed = false;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isListed ? Icons.check : Icons.add,
                color: isListed ? Colors.blue[500] : Colors.white70,
              ),
              Text(isListed ? 'تم الاضافة' : 'اضافة',
                  style: TextStyle(
                      color: isListed ? Colors.blue[500] : Colors.white70))
            ],
          ),
        ));
  }
}
