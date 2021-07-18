import 'package:flutter/material.dart';

class Ganeress extends StatelessWidget {
  final genData;
  final int count;
  Ganeress(this.genData, this.count);
  Widget build(BuildContext context) {
    var ind = 0;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: Center(
            child: ListView.builder(
                itemCount: this.count * 2 - 1,
                shrinkWrap: true,
                scrollDirection: Axis
                    .horizontal, //GenereItem(name: genData[index].toString());
                itemBuilder: (context, index) {
                  if (index % 2 != 0) ind++;
                  return index % 2 != 0
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            ".",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                        )
                      : GenereItem(name: genData[ind].toString());
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
      child: Text(name,
          style: TextStyle(color: Colors.white70, fontFamily: 'Tajawal')),
      height: 30,
      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
      padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
    ));
  }
}
