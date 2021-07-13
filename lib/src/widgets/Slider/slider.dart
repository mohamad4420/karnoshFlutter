import 'package:flutter/material.dart';
import '../../model/models.dart';
import './widgets/widgets.dart';
import '../Most/widgets/FunctionsMost.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key key}) : super(key: key);
  _MySliderState createState() => _MySliderState();
}

class SliderItem extends StatelessWidget {
  final String name;
  final String fetchUrl;
  SliderItem({this.name, this.fetchUrl});
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              name,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.start,
            ),
          ),
          MySlider(),
        ],
      ),
    );
  }
}

class _MySliderState extends State<MySlider>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    return FutureBuilder(
        future: fetchApi.fetchVid('movie_mt', false, null),
        builder: (context, snapshot) {
          var vids = snapshot.data;
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          else {
            return Container(
              height: MediaQuery.of(context).size.height * 0.21,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vids.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        BottomSliderMost(context, vids[index]);
                      },
                      child: MyCard(img: vids[index].poster),
                    );
                  }),
            );
          }
        });
  }
}
