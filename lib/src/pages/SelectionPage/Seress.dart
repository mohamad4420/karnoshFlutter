import 'package:flutter/material.dart';

import '../Playvideo.dart';

class Seress extends StatelessWidget {
  final dynamic data;
  const Seress({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: this.data.numberOfServer,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayVideo(
                              this.key,
                              this.data.name,
                              this.data.numberOfServer - index - 1,
                              this.data.numberOfServer)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    color: Colors.white10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ' الحلقة رقم ' +
                            (this.data.numberOfServer - index).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
/*
ListTile(
                title: Text(
                  ' الحلقة رقم ' +
                      (this.data.numberOfServer - index).toString(),
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Column(
                  children: [
                    IconButton(
                      tooltip: "وضع للمشاهده لاحقا",
                      onPressed: () {},
                      splashRadius: 15,
                      icon: Icon(Icons.visibility_outlined),
                      color: Colors.white30,
                    ),
                  ],
                ),
                subtitle: Text(
                  'حجوم العمالقة فتال جد والله',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayVideo(
                              this.key,
                              this.data.name,
                              this.data.numberOfServer - index - 1,
                              this.data.numberOfServer)));
                },
                tileColor: Colors.white10.withOpacity(0.1),
              )
 */
