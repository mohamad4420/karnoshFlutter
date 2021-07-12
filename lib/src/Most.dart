import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/models.dart';

class Most extends StatefulWidget {
  _MostState createState() => _MostState();
}

class _MostState extends State<Most> {
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF000000), offset: Offset(0, 1), blurRadius: 10)
          ],
          image: DecorationImage(
            image: NetworkImage(
                "https://m.media-amazon.com/images/M/MV5BOGE4MmVjMDgtMzIzYy00NjEwLWJlODMtMDI1MGY2ZDlhMzE2XkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_QL75_UX1120_CR0,0,1120,1656_.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.66,
        width: MediaQuery.of(context).size.width,
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.66,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(0.0, 0.0),
                colors: [Color(0xFF212121), Colors.transparent],
              ))),
      Container(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.height * 0.45, 0, 0),
        child: Column(
          children: [
            FutureBuilder(
                future: fetchApi.fetchVid(),
                builder: (context, snapshot) {
                  return Name(snapshot.data[0].toString());
                }),
            Name(''),
            Ganeress(),
            PlayAndList(),
          ],
        ),
      )
    ]);
  }
}

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

class Ganeress extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: Center(
            child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            GenereItem(name: 'اكشن'),
            GenereItem(name: 'مغامرات'),
            GenereItem(name: 'رعب'),
            GenereItem(name: 'حياة'),
            GenereItem(name: 'ابو دية'),
            GenereItem(name: 'زفت'),
          ],
        )));
  }
}

/*
ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            GenereItem(name: 'اكشن'),
            GenereItem(name: 'مغامرات'),
            GenereItem(name: 'رعب'),
            GenereItem(name: 'حياة'),
            GenereItem(name: 'ابو دية'),
            GenereItem(name: 'زفت'),
          ],
        )
*/

class GenereItem extends StatelessWidget {
  @required
  final String name;
  GenereItem({this.name});
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      constraints: BoxConstraints(minWidth: 50),
      alignment: Alignment.center,
      child: Text(name ?? '',
          style: TextStyle(color: Colors.white70, fontFamily: 'Tajawal')),
      height: 30,
      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
      padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
      /*decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(16)),*/
    ));
  }
}

class PlayAndList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      children: [List(), Play(), Info()],
    );
  }
}

class Play extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        /*  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.025,
            0, MediaQuery.of(context).size.width * 0.0125, 0),*/
        width: MediaQuery.of(context).size.width * 0.33,
        height: 40,
        /* decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(12)),*/
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white70 // set the background color

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
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ));
  }
}

class List extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: 70,
        /*decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(12)),*/
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.white70,
              ),
              Text('اضافة', style: TextStyle(color: Colors.white70))
            ],
          ),
        ));
  }
}

class Info extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: 70,
        /*  decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(12)),*/
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {},
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
