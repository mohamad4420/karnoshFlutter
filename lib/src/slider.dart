import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MySlider extends StatelessWidget {
  Widget build(BuildContext context) {
    var items = "Fuck";
    return CarouselSlider(
      options: CarouselOptions(
        height: 350,
        viewportFraction: 0.5,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: Text(
                  items + ' $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}
