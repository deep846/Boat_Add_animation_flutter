
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  const Webview({Key? key}) : super(key: key);

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final Completer<WebViewController> controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BOAT ROCKERZ 450R"),
      ),
      body: Container(
        child: WebView(
          initialUrl: 'http://www.boat-lifestyle.com/products/boat-rockerz-450r',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webviewController){
            setState(() {
              controller.complete(webviewController);
            });
          },
        ),
      ),
    );
  }
}
