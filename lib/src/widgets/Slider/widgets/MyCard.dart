import 'package:flutter/material.dart';
import '../../responsive.dart';

class MyCard extends StatelessWidget {
  @required
  final String img;
  MyCard({this.img});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width * 0.29
          : Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width * 0.13
              : MediaQuery.of(context).size.width * 0.19,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: Colors.grey[900],
          child: FadeInImage.assetNetwork(
              placeholder: "images/sliderLoading.png",
              image: img,
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
