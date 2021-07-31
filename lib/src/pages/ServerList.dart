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

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: fetchApi.fetchServer(name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data[0].server);
            int _itemCount = snapshot.data[0].nameServer.length;
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
                    magnification: 1.3,
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
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: FloatingActionButton(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.exit_to_app),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
