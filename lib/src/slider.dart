import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MySlider extends StatelessWidget {
  Widget build(BuildContext context) {
    var items = "Fuck";
    var width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.width * 0.45,
          viewportFraction: 0.3,
          initialPage: 1,
          enableInfiniteScroll: false,
          pageSnapping: true,
          disableCenter: true,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal),
      items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      image: NetworkImage(
                          'https://m.media-amazon.com/images/M/MV5BN2UxYzYzZDYtNWM0NC00ZDQ1LWIwZTktNDk1Y2I5ZWZmZTI5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._CR360,55,1605,2380_UX402_UY596_QL75_UX280_CR0,0,280,414_.jpg'),
                      fit: BoxFit.cover,
                    )));
          },
        );
      }).toList(),
    );
  }
}
