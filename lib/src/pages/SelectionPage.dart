import 'dart:ui';

import 'package:flutter/material.dart';
import 'Playvideo.dart';
import 'package:flutter/services.dart';
import '../model/Fetch.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SelectionPage extends StatefulWidget {
  final dynamic data;
  SelectionPage({Key key, this.data}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool sorts = false;
  bool spasification = false;
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
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                        expandedHeight: this.spasification
                            ? 60
                            : MediaQuery.of(context).size.width * 0.6625 + 30,
                        pinned: true,
                        brightness: Brightness.dark,
                        backgroundColor: Colors.black,
                        flexibleSpace: FlexibleSpaceBar(
                          background: CachedNetworkImage(
                              placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.red,
                                    ),
                                  ),
                              imageUrl: widget.data.galary,
                              fit: BoxFit.fill),
                        ),
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
                            child: TabBar(
                                indicatorColor: Colors.red,
                                onTap: (int) {
                                  print(int);
                                  if (int == 2) {
                                    this.setState(() {
                                      spasification = true;
                                    });
                                  } else {
                                    this.setState(() {
                                      spasification = false;
                                    });
                                  }
                                },
                                tabs: [
                                  Text(
                                    ' الحلقات (' +
                                        widget.data.numberOfServer.toString() +
                                        ")",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  Text(
                                    'انميات لك',
                                    style: TextStyle(
                                        color: Colors.white, height: 2),
                                  ),
                                  Text(
                                    'جميع المعلومات',
                                    style: TextStyle(
                                        color: Colors.white, height: 2),
                                  ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                      child: ListView(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () {
                                  if (this.sorts) {
                                    setState(() {
                                      sorts = false;
                                    });
                                  } else {
                                    setState(() {
                                      sorts = true;
                                    });
                                  }
                                },
                                icon: Icon(Icons.swap_vert_rounded),
                                color: Colors.white,
                                splashRadius: 25,
                              ),
                            ),
                          ),
                          this.sorts
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.data.numberOfServer,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ListTile(
                                        title: Text(
                                          ' الحلقة رقم ' +
                                              (widget.data.numberOfServer -
                                                      index)
                                                  .toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        trailing: Column(
                                          children: [
                                            IconButton(
                                              tooltip: "وضع للمشاهده لاحقا",
                                              onPressed: () {},
                                              splashRadius: 15,
                                              icon: Icon(
                                                  Icons.visibility_outlined),
                                              color: Colors.white30,
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          'حجوم العمالقة فتال جد والله',
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => PlayVideo(
                                                      widget.key,
                                                      widget.data.name,
                                                      widget.data
                                                              .numberOfServer -
                                                          index -
                                                          1,
                                                      widget.data
                                                          .numberOfServer)));
                                        },
                                        tileColor:
                                            Colors.white10.withOpacity(0.1),
                                      ),
                                    );
                                  })
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.data.numberOfServer,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ListTile(
                                        title: Text(
                                          ' الحلقة رقم ' +
                                              (index + 1).toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        trailing: Column(
                                          children: [
                                            IconButton(
                                              tooltip: "وضع للمشاهده لاحقا",
                                              onPressed: () {},
                                              splashRadius: 15,
                                              icon: Icon(
                                                  Icons.visibility_outlined),
                                              color: Colors.white30,
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          'حجوم العمالقة فتال جد والله',
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PlayVideo(
                                                          widget.key,
                                                          widget.data.name,
                                                          index,
                                                          widget.data
                                                              .numberOfServer)));
                                        },
                                        tileColor:
                                            Colors.white10.withOpacity(0.1),
                                      ),
                                    );
                                  }),
                        ],
                      ),
                    ),
                    Related(
                      name: widget.data.name,
                    ),
                    Spasification(name: widget.data.name),
                  ],
                ))),
      ),
    );
  }
}

class Related extends StatelessWidget {
  final String name;
  Related({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FetchApi().related(this.name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectionPage(
                                        data: snapshot.data[index],
                                      )));
                        },
                        child: Column(
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.54,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: CachedNetworkImage(
                                    placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.red,
                                          ),
                                        ),
                                    imageUrl: snapshot.data[index].poster,
                                    fit: BoxFit.fill)),
                            ListTile(
                              title: Text(snapshot.data[index].name,
                                  style: TextStyle(color: Colors.white)),
                              subtitle: Container(
                                height: 28,
                                child: Text(snapshot.data[index].description,
                                    style: TextStyle(color: Colors.white60)),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          }
        });
  }
}

class Spasification extends StatelessWidget {
  final String name;
  Spasification({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FetchApi().information(this.name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 105, 0, 0),
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data[0].poster),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: const FractionalOffset(0.0, 1.0),
                              end: const FractionalOffset(0.0, 0.0),
                              colors: [Colors.black, Colors.black54],
                            )),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                      placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.red,
                                            ),
                                          ),
                                      imageUrl: snapshot.data[0].poster,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(snapshot.data[0].broadcast,
                                        style:
                                            TextStyle(color: Colors.white70)),
                                    Text(snapshot.data[0].date,
                                        style:
                                            TextStyle(color: Colors.white70)),
                                    Text(
                                        " انمي | حلقه " +
                                            snapshot.data[0].numberOfServer
                                                .toString() +
                                            " | " +
                                            snapshot.data[0].Rating,
                                        style: TextStyle(color: Colors.white70))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 820,
                            height: 50,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3, // 60% of space => (6/(6 + 4))
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white70,
                                      ),
                                      Text('قائمتي',
                                          style:
                                              TextStyle(color: Colors.white70))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3, // 60% of space => (6/(6 + 4))
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.white70,
                                      ),
                                      Text('اضافه تقييم',
                                          style:
                                              TextStyle(color: Colors.white70))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3, // 60% of space => (6/(6 + 4))
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[600],
                                      ),
                                      Text(snapshot.data[0].rating.toString(),
                                          style:
                                              TextStyle(color: Colors.white70))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          color: Colors.white10,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: Generess(
                                    generess: snapshot.data[0].genres,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          "المصدر",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(snapshot.data[0].source,
                                            style: TextStyle(
                                                color: Colors.white38))
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text("مده الحلقه",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(snapshot.data[0].time,
                                            style: TextStyle(
                                                color: Colors.white38))
                                      ],
                                    ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Text(
                                            "عرض من ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(snapshot.data[0].from,
                                              style: TextStyle(
                                                  color: Colors.white38))
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Text("الى",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text(snapshot.data[0].to,
                                              style: TextStyle(
                                                  color: Colors.white38))
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Text(
                                            "الاستديو",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Container(
                                              color: Colors.white10
                                                  .withOpacity(0.1),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Text(
                                                  snapshot.data[0].studios,
                                                  style: TextStyle(
                                                      color: Colors.white70),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Text("اخر حلقه مضافه",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text(snapshot.data[0].time,
                                              style: TextStyle(
                                                  color: Colors.white38))
                                        ],
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: MediaQuery.of(context).size.width * 0.8,
                          color: Colors.white10,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                child: CircularProgressIndicator(color: Colors.red),
              ),
            );
          }
        });
  }
}

class Generess extends StatelessWidget {
  final dynamic generess;
  const Generess({Key key, this.generess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(
            child: ListView.builder(
                itemCount: generess.length,
                shrinkWrap: true,
                scrollDirection: Axis
                    .horizontal, //GenereItem(name: genData[index].toString());
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white10.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            generess[index],
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                  );
                })));
  }
}
