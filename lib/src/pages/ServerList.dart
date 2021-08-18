import 'package:flutter/material.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';

// ignore: must_be_immutable
class ServerList extends StatelessWidget {
  dynamic data;
  dynamic callback;

  ServerList({Key key, this.data, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = FixedExtentScrollController();
    const double _itemHeight = 60;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            ClickableListWheelScrollView(
              scrollController: _scrollController,
              itemHeight: _itemHeight,
              itemCount: data[0].server.length,
              onItemTapCallback: (index) {
                Navigator.pop(context);
                callback(data[0].server[index]);
              },
              child: ListWheelScrollView.useDelegate(
                magnification: 1.2,
                controller: _scrollController,
                itemExtent: _itemHeight,
                physics: FixedExtentScrollPhysics(),
                overAndUnderCenterOpacity: 0.5,
                perspective: 0.002,
                onSelectedItemChanged: (index) {
                  print("onSelectedItemChanged index: $index");
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) => Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: _itemHeight,
                      child: Text(data[0].nameServer[index],
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  childCount: data[0].server.length,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.exit_to_app_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ));
  }
}
