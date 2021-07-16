import 'dart:io';
import 'package:flutter/services.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import '../widgets/Most/Most.dart';
import '../widgets/Slider/slider.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

//https://streamtape.com/e/YWyDojgxaDF211
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;
    return Container(
      child: WebView(
          initialUrl: "https://streamtape.com/e/YWyDojgxaDF211",
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            return NavigationDecision.prevent;
          }),
    );
  }
}
