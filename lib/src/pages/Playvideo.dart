import 'dart:developer';
import 'package:flutter/widgets.dart';

import '../model/models.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'ServerList.dart';
import 'package:flutter/services.dart';

class PlayVideo extends StatefulWidget {
  final name;
  final epIndex;
  PlayVideo(Key key, this.name, this.epIndex) : super(key: key);
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
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ServerList(
                                                data: snapshot.data,
                                                callback: (data) => {
                                                      print(data),
                                                      this.setState(() {
                                                        this
                                                            .webviewcontroller
                                                            .loadUrl(data);
                                                      })
                                                    })));
                                  },
                                  icon: Icon(Icons.settings),
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
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                child: Text('data$index'),
                                                height: 100,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color: Colors.amber);
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
