import 'package:flutter/material.dart';
import 'Playvideo.dart';
import '../model/models.dart';

class ServerList extends StatelessWidget {
  final name;
  const ServerList({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetshServers fetchApi = FetshServers();
    return FutureBuilder(
      future: fetchApi.fetchServer(name),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data[0].server);
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: snapshot.data[0].server.length,
                            itemBuilder: (context, index) {
                              return TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PlayVideo(
                                                snapshot
                                                    .data[0].server[index])));
                                  },
                                  child: Text(
                                    snapshot.data[0].nameServer[index],
                                    style: TextStyle(color: Colors.white),
                                  ));
                            }),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child: FloatingActionButton(
                          child: Icon(Icons.exit_to_app),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
