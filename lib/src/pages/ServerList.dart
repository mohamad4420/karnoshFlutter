import 'package:flutter/material.dart';
import 'Playvideo.dart';
import '../model/models.dart';

class ServerList extends StatelessWidget {
  final name;
  const ServerList({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetshServers fetchApi = FetshServers();
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: fetchApi.fetchServer(name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data[0].server);
            List<String> dt = snapshot.data[0].nameServer;
            int count = 0;
            return Stack(
              children: [
                ListWheelScrollView(
                  onSelectedItemChanged: (e) {
                    print(e);
                  },
                  itemExtent: 100,
                  children: dt.map((e) {
                    count++;
                    return GestureDetector(
                        onTap: () {
                          print('fuck');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayVideo(
                                      snapshot.data[0].server[count - 1])));
                        },
                        child: Text(
                          snapshot.data[0].nameServer[count - 1],
                          style: TextStyle(color: Colors.white),
                        )); //Text(snapshot.data[0].nameServer[count - 1]);
                  }).toList(),
                  diameterRatio: 1.5,
                ),
                /*ListView.builder(
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
                        }),*/

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
            );
          } else {
            return Container(
                /*
              child: ListWheelScrollView.useDelegate(
                childDelegate: ListWheelChildBuilderDelegate(builder: (context, index) {
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
                },),
                itemExtent: snapshot.data[0].server.length,
              ),*/
                );
          }
        },
      ),
    );
  }
}
