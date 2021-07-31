import 'package:flutter/material.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import './More.dart';

class SelectionPageMore extends StatelessWidget {
  final name;
  const SelectionPageMore({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = FixedExtentScrollController();
    List<String> data = ["اكشن", "دراما", "مغامرات", "طبيعه", "بشير شلبي"];
    const double _itemHeight = 60;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.black,
          body: ClickableListWheelScrollView(
            scrollController: _scrollController,
            itemHeight: _itemHeight,
            itemCount: data.length,
            onItemTapCallback: (index) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => More(name: data[index])));
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
                      child: Text(data[index],
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                childCount: data.length,
              ),
            ),
          )),
    );
  }
}
