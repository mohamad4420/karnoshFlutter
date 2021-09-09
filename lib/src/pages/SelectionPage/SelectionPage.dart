import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Related.dart';
import 'Seress.dart';
import 'Spasification.dart';

class SelectionPage extends StatefulWidget {
  final dynamic data;
  SelectionPage({Key key, this.data}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool sorts = false;
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.black,
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                        actions: [
                          IconButton(
                              splashRadius: 20,
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white60,
                              ))
                        ],
                        leading: Transform.rotate(
                          angle: 3.14,
                          child: IconButton(
                            tooltip: "الرجوع ",
                            color: Colors.white70,
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        title: Text(
                          widget.data.name,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        pinned: true,
                        brightness: Brightness.dark,
                        backgroundColor: Colors.black,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(50.0),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: const FractionalOffset(0.0, 1.0),
                                  end: const FractionalOffset(0.0, 0.0),
                                  colors: [Colors.black, Colors.transparent],
                                ),
                                border: Border(
                                    bottom: BorderSide(color: Colors.white24))),
                            child: TabBar(indicatorColor: Colors.red, tabs: [
                              Text(
                                'جميع المعلومات',
                                style:
                                    TextStyle(color: Colors.white, height: 2),
                              ),
                              Text(
                                ' الحلقات (' +
                                    widget.data.numberOfServer.toString() +
                                    ")",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                'انميات لك',
                                style:
                                    TextStyle(color: Colors.white, height: 2),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Spasification(name: widget.data.name),
                    Seress(
                      data: widget.data,
                    ),
                    Related(
                      name: widget.data.name,
                    ),
                  ],
                ))),
      ),
    );
  }
}
