import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:karnosh/main.dart';

class SelectionPage extends StatelessWidget {
  final dynamic datas;
  SelectionPage({this.datas});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text("مسلسلات"),
              backgroundColor: Color(0xFF222222),
            ),
            body: Column(children: [
              Container(
                child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                      image: NetworkImage(datas.poster),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            constraints: BoxConstraints(maxHeight: 55),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  datas.name,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ))),
                        Container(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  datas.date + '       ' + datas.rating,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ))),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('عرص'),
                              Icon(Icons.play_arrow),
                            ],
                          ),
                        ),
                        Container(
                            constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.1),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: SingleChildScrollView(
                                  child: Text(
                                    datas.description,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {}, child: Icon(Icons.add)),
                            TextButton(
                                onPressed: () {}, child: Icon(Icons.thumb_up)),
                            TextButton(
                                onPressed: () {}, child: Icon(Icons.share))
                          ],
                        ),
                        Container(height: 2, color: Colors.grey[800]),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Text(
                                    'Ep $index',
                                    style: TextStyle(color: Colors.white),
                                  ));
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ])));
  }
}
