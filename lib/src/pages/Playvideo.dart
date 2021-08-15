import 'dart:io';
import 'package:flutter/services.dart';
import '../model/models.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class PlayVideo extends StatefulWidget {
  final name;
  final epIndex;
  PlayVideo(this.name, this.epIndex);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  FetshServers fetchApi = FetshServers();

  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.play_arrow),
            ),
            body: FutureBuilder(
              future: fetchApi.fetchServer(widget.name, widget.epIndex),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.5625,
                      child: WebView(
                          initialUrl: snapshot.data[0].server[0],
                          javascriptMode: JavascriptMode.unrestricted,
                          navigationDelegate: (NavigationRequest request) {
                            return NavigationDecision.prevent;
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.74,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                                child: Text('data$index'),
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber);
                          }),
                    ),
                  ],
                );
              },
            )));
  }
}
