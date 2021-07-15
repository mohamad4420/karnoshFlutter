import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
              brightness: Brightness.dark,
              backgroundColor: Colors.black,
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
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  datas.date + '    ' + datas.rating,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white70),
                                ))),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white // set the background color=
                              ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('عرض',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: ReadMoreText(
                            datas.description,
                            trimLines: 3,
                            colorClickableText: Colors.white60,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'المزيد',
                            trimExpandedText: 'القليل',
                            moreStyle: TextStyle(color: Colors.white60),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: IconButton(
                                  splashRadius: 24,
                                  onPressed: () {
                                    print("isclickd");
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white70,
                                  )),
                            ),
                            Expanded(
                              child: IconButton(
                                  splashRadius: 24,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.thumb_up,
                                    color: Colors.white70,
                                  )),
                            ),
                            Expanded(
                              child: IconButton(
                                  splashRadius: 24,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.white70,
                                  )),
                            )
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
