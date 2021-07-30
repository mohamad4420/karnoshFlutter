import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class SelectionPage extends StatelessWidget {
  final dynamic data;
  SelectionPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.width * 0.5625,
            pinned: true,
            brightness: Brightness.dark,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage(data.galary),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Wrap(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        constraints: BoxConstraints(maxHeight: 55),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              data.name,
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ))),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          data.date + '    ' + data.rating,
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: ElevatedButton(
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
                    ),
                    ReadMoreText(
                      data.description,
                      trimLines: 3,
                      colorClickableText: Colors.white60,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'المزيد',
                      trimExpandedText: 'القليل',
                      moreStyle: TextStyle(color: Colors.white60),
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Text(
                                'Ep $index',
                                style: TextStyle(color: Colors.white),
                              ));
                        }),
                  ],
                ),
              ),
            ])
          ]))
        ],
      ),
    );
  }
}
