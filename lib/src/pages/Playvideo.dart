import 'package:flutter/widgets.dart';

import '../model/models.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'ServerList.dart';
import 'package:flutter/services.dart';

class PlayVideo extends StatefulWidget {
  final name;
  final epIndex;
  final numberOfServer;
  PlayVideo(Key key, this.name, this.epIndex, this.numberOfServer)
      : super(key: key);
  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  String url = "";
  WebViewController webviewcontroller;
  FetshServers fetchApi = FetshServers();
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: OrientationBuilder(builder: (context, orientation) {
          orientation == Orientation.landscape
              ? SystemChrome.setEnabledSystemUIOverlays([])
              : SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

          return FutureBuilder(
              future: fetchApi.fetchServer(widget.name, widget.epIndex),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  this.url = snapshot.data[0].server[0];
                  return WillPopScope(
                    onWillPop: () async {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                        DeviceOrientation.portraitDown,
                      ]);
                      Navigator.pop(context);
                      return false;
                    },
                    child: Scaffold(
                        backgroundColor: Colors.black,
                        appBar: orientation == Orientation.portrait
                            ? AppBar(
                                leading: IconButton(
                                  onPressed: () {
                                    SystemChrome.setPreferredOrientations([
                                      DeviceOrientation.portraitUp,
                                      DeviceOrientation.portraitDown,
                                    ]);
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_ios),
                                ),
                                backgroundColor: Colors.black,
                                title: IconButton(
                                  splashRadius: 25,
                                  tooltip: "تغيير السيرفر",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ServerList(
                                                data: snapshot.data,
                                                callback: (data) => {
                                                      this.setState(() {
                                                        this
                                                            .webviewcontroller
                                                            .loadUrl(data);
                                                      })
                                                    })));
                                  },
                                  icon: Icon(Icons.video_settings),
                                ),
                              )
                            : null,
                        body: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: orientation == Orientation.portrait
                                  ? MediaQuery.of(context).size.width * 0.5625
                                  : MediaQuery.of(context).size.height,
                              child: WebView(
                                  initialUrl: this.url,
                                  onWebViewCreated:
                                      (WebViewController webViewController) {
                                    webviewcontroller = webViewController;
                                  },
                                  javascriptMode: JavascriptMode.unrestricted,
                                  navigationDelegate:
                                      (NavigationRequest request) {
                                    return NavigationDecision.prevent;
                                  }),
                            ),
                            Container(
                              child: orientation == Orientation.portrait
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context)
                                              .size
                                              .height -
                                          MediaQuery.of(context).size.width *
                                              0.5625 -
                                          105.143,
                                      child: ListView.builder(
                                          itemCount: widget.numberOfServer -
                                              widget.epIndex -
                                              1,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Container(
                                                child: ListTile(
                                                  trailing: Column(
                                                    children: [
                                                      IconButton(
                                                        tooltip:
                                                            "وضع للمشاهده لاحقا",
                                                        onPressed: () {},
                                                        splashRadius: 15,
                                                        icon: Icon(Icons
                                                            .visibility_outlined),
                                                        color: Colors.white30,
                                                      ),
                                                    ],
                                                  ),
                                                  title: Text(
                                                    ' الحلقة رقم ' +
                                                        (index +
                                                                widget.epIndex +
                                                                2)
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  subtitle: Text(
                                                    'حجوم العمالقة فتال جد والله',
                                                    style: TextStyle(
                                                        color: Colors.white70),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PlayVideo(
                                                                    widget.key,
                                                                    widget.name,
                                                                    index +
                                                                        widget
                                                                            .epIndex +
                                                                        1,
                                                                    widget
                                                                        .numberOfServer)));
                                                  },
                                                  tileColor: Colors.white10
                                                      .withOpacity(0.04),
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  : null,
                            ),
                          ],
                        )),
                  );
                } else {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.black,
                      title: IconButton(
                        splashRadius: 25,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServerList()));
                        },
                        icon: Icon(Icons.settings),
                      ),
                    ),
                  );
                }
              });
        }));
  }
}
