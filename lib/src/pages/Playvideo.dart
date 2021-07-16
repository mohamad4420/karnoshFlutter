import 'dart:io';
import 'package:flutter/services.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class PlayVideo extends StatelessWidget {
  final String url;
  PlayVideo(this.url);

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WebViewExample(url: url),
    );
  }
}

class WebViewExample extends StatefulWidget {
  final String url;
  WebViewExample({this.url});

  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

//https://streamtape.com/e/YWyDojgxaDF211
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            return NavigationDecision.prevent;
          }),
    );
  }
}
