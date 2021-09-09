import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:karnosh/src/model/Fetch.dart';
import 'Related.dart';

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
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: const FractionalOffset(0.0, 1.0),
                            end: const FractionalOffset(0.0, 0.0),
                            colors: [Colors.black, Colors.black54],
                          )),
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
                          color: Colors.white10,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          "حاله العرض",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(snapshot.data[0].status,
                                            style: TextStyle(
                                                color: Colors.white38))
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text("الشعبيه",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(snapshot.data[0].popularity,
                                            style: TextStyle(
                                                color: Colors.white38))
                                      ],
                                    ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Text(
                                            "اخر حلقه مضافه",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(snapshot.data[0].ubdate,
                                              style: TextStyle(
                                                  color: Colors.white38))
                                        ],
                                      )),
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Text("الموسم",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text(snapshot.data[0].S,
                                              style: TextStyle(
                                                  color: Colors.white38))
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
