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
    return FutureBuilder(
        future: fetchApi.fetchVid(),
        builder: (context, snapshot) {
          VidModels vids = snapshot.data;
          return Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF000000),
                      offset: Offset(0, 1),
                      blurRadius: 10)
                ],
                image: DecorationImage(
                  image: NetworkImage(vids.poster),
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
                  Name(vids.name),
                  Ganeress(vids.Genres, vids.Genres.length),
                  PlayAndListAndInfo(),
                ],
              ),
            )
          ]);
        });
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
  var genData;
  int count;
  Ganeress(this.genData, this.count);
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: Center(
            child: ListView.builder(
                itemCount: this.count,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GenereItem(name: genData[index].toString());
                })));
  }
}

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

class PlayAndListAndInfo extends StatelessWidget {
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
