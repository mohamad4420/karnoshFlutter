import 'package:flutter/material.dart';

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
      child: Text(name,
          style: TextStyle(color: Colors.white70, fontFamily: 'Tajawal')),
      height: 30,
      margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
      padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
    ));
  }
}
