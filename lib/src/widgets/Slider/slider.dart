import 'package:flutter/material.dart';
import '../../model/models.dart';
import './widgets/widgets.dart';
import '../InfoSmall.dart';
import '../responsive.dart';

class SliderItem extends StatelessWidget {
  final String name;
  final String type;
  final bool stored;
  final String genres;
  const SliderItem({Key key, this.name, this.genres, this.stored, this.type})
      : super(key: key);

  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 2),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  this.name,
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            FutureBuilder(
                future: fetchApi.fetchVid(this.type, this.stored, this.genres),
                builder: (context, snapshot) {
                  var vids = snapshot.data;

                  if (!snapshot.hasData)
                    return LoadingSlider();
                  else {
                    return Container(
                      height: Responsive.isMobile(context)
                          ? MediaQuery.of(context).size.width * 0.38
                          : Responsive.isDesktop(context)
                              ? MediaQuery.of(context).size.width * 0.18
                              : MediaQuery.of(context).size.width * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: vids.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (Responsive.isMobile(context))
                                  bottomSliderMost(context, vids[index]);
                              },
                              child: MyCard(img: vids[index].poster),
                            );
                          }),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class LoadingSlider extends StatelessWidget {
  const LoadingSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width * 0.38
          : Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width * 0.18
              : MediaQuery.of(context).size.width * 0.25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 17,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey[900].withOpacity(1 - index.toDouble() * 0.005),
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width * 0.29
                  : Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * 0.13
                      : MediaQuery.of(context).size.width * 0.19,
              child: Container(),
            );
          }),
    );
  }
}
