import 'package:flutter/material.dart';
import '../../model/models.dart';
import './widgets/widgets.dart';
import '../FunctionsMost.dart';
import '../responsive.dart';
import 'package:shimmer/shimmer.dart';

class SliderItem extends StatefulWidget {
  final String name;
  final String type;
  final bool stored;
  final String genres;

  const SliderItem({Key key, this.name, this.genres, this.stored, this.type})
      : super(key: key);
  _SliderItemState createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          FutureBuilder(
              future:
                  fetchApi.fetchVid(widget.type, widget.stored, widget.genres),
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
      child: Shimmer.fromColors(
        direction: ShimmerDirection.rtl,
        enabled: true,
        baseColor: Colors.grey[900],
        highlightColor: Colors.white24,
        child: Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext ctxt, index) {
                return Container(
                  color: Colors.grey[900],
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width * 0.29
                      : Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width * 0.13
                          : MediaQuery.of(context).size.width * 0.19,
                );
              }),
        ),
      ),
    );
  }
}
