import 'package:flutter/material.dart';
import 'Playvideo.dart';
import 'package:flutter/services.dart';

class SelectionPage extends StatefulWidget {
  final dynamic data;
  SelectionPage({Key key, this.data}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool spasification = false;
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                    : MediaQuery.of(context).size.width * 0.6625 + 60,
                pinned: true,
                brightness: Brightness.dark,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                    image: NetworkImage(widget.data.galary),
                    fit: BoxFit.fill,
                  ),
                ),
                bottom: PreferredSize(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: const FractionalOffset(0.0, 1.0),
                          end: const FractionalOffset(0.0, 0.0),
                          colors: [Colors.black, Colors.black12],
                        ),
                        border:
                            Border(bottom: BorderSide(color: Colors.white24))),
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(indicatorColor: Colors.red, tabs: [
                        FittedBox(
                            child: Text(
                          ' الحلقات (' +
                              widget.data.numberOfServer.toString() +
                              ")",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                        FittedBox(
                            child: Text(
                          'انميات لك',
                          style: TextStyle(color: Colors.white, height: 2),
                        )),
                        FittedBox(
                            child: Text(
                          'جميع المعلومات',
                          style: TextStyle(color: Colors.white, height: 2),
                        )),
                      ]),
                    ),
                  ),
                  preferredSize: const Size.fromHeight(50.0),
                )),
            SliverList(
                delegate: SliverChildListDelegate([
              Wrap(children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.data.numberOfServer,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(
                                  ' الحلقة رقم ' + (index + 1).toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  'حجوم العمالقة فتال جد والله',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlayVideo(
                                              widget.key,
                                              widget.data.name,
                                              index)));
                                },
                                tileColor: Colors.white10.withOpacity(0.04),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ])
            ]))
          ],
        ),
      ),
    );
  }
}
