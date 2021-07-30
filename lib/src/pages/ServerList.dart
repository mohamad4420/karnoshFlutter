import 'package:flutter/material.dart';
import 'Playvideo.dart';
import '../model/models.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';

class ServerList extends StatelessWidget {
  final name;
  const ServerList({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FetshServers fetchApi = FetshServers();
    final _scrollController = FixedExtentScrollController();
    const double _itemHeight = 60;
    int _itemCount = 1;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: fetchApi.fetchServer(name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data[0].server);
            _itemCount = snapshot.data[0].nameServer.length;
            return Stack(
              children: [
                ClickableListWheelScrollView(
                  scrollController: _scrollController,
                  itemHeight: _itemHeight,
                  itemCount: _itemCount,
                  onItemTapCallback: (index) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlayVideo(snapshot.data[0].server[index])));
                  },
                  child: ListWheelScrollView.useDelegate(
                    controller: _scrollController,
                    itemExtent: _itemHeight,
                    physics: FixedExtentScrollPhysics(),
                    overAndUnderCenterOpacity: 0.5,
                    perspective: 0.002,
                    onSelectedItemChanged: (index) {
                      print("onSelectedItemChanged index: $index");
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: _itemHeight,
                        child: ListTile(
                          title: Center(
                            child: Text(snapshot.data[0].nameServer[index],
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      childCount: _itemCount,
                    ),
                  ),
                )
                /*
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
                ListView.builder(
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
                ,
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
