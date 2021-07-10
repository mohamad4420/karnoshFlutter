import 'package:flutter/material.dart';

class Most extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 300, 0, 00),
      decoration: BoxDecoration(
        color: Colors.black45,
        image: DecorationImage(
          image: NetworkImage(
              "https://m.media-amazon.com/images/M/MV5BOGE4MmVjMDgtMzIzYy00NjEwLWJlODMtMDI1MGY2ZDlhMzE2XkEyXkFqcGdeQXVyMzY0MTE3NzU@.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      height: 600,
      width: 375,
      child: Column(
        children: [Name(), Ganeress(), PlayAndList(), Discription(), Time()],
      ),
    );
  }
}

class Name extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 30,
      child: Center(
        child: Text(
          "the witcher",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class Ganeress extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: Row(
          children: [
            Center(
                child: Text(
              "اكشن",
              style: TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),
            )),
          ],
        ));
  }
}

class PlayAndList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: [Play(), List()],
    );
  }
}

class Play extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Text("play"),
    );
  }
}

class List extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Text("list"),
    );
  }
}

class Discription extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "بعد اندلاع الزومبي في لاس فيغاس,تقوم مجموعة من المرتزقة بالمجازفة النهائية,المغامرة في منطقة الحجر الصحي لسحب أعظم محاولة سرقة على الإطلاق.",
        style: TextStyle(color: Colors.white60),
      ),
    );
  }
}

class Time extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            "الوقت :",
            style: TextStyle(color: Colors.white60),
          ),
          Text(
            "18min",
            style: TextStyle(color: Colors.white60),
          ),
        ],
      ),
    );
  }
}
