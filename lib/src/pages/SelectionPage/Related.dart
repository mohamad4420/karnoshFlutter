import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:karnosh/src/model/Fetch.dart';

import 'SelectionPage.dart';

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
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                                    fit: BoxFit.cover)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(snapshot.data[index].name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text(snapshot.data[index].name,
                                      style: TextStyle(
                                          color: Colors.white54, fontSize: 14)),
                                ],
                              ),
                            ),
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
