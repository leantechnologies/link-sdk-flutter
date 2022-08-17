library lean_flutter_sdk;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef LeanCallback = void Function(String message);

class LeanViewWidget extends StatefulWidget {
  LeanViewWidget({
    required this.appToken,
    this.isSandbox = true,
    this.version = "latest",
    this.country = "",
    this.callback,
    Key? key,
  }) : super(key: key);

  final LeanCallback? callback;
  final String appToken;
  final String version;
  final bool isSandbox;
  final String country;

  final LeanViewStateController lvsc = LeanViewStateController();

  void connect({
    required String customerId,
    required List<String> permissions,
  }) {
    lvsc._connect(
        appToken: appToken,
        isSandbox: isSandbox,
        customerId: customerId,
        permissions: permissions);
  }

  void reconnect({required String reconnectId,}) {
    lvsc._reconnect(
      appToken: appToken,
      isSandbox: isSandbox,
      reconnectId: reconnectId,
    );
  }

  @override
  State<LeanViewWidget> createState() => lvsc;
}

class LeanViewStateController extends State<LeanViewWidget> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  String get _htmlString => '''
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  </head>
  <body>

    <div id="lean-link"></div>

    <script src="https://cdn.leantech.me/${widget.country == "SaudiArabia" ? "sa/" : ""}link/sdk/web/${widget.version}/Lean.min.js"></script>
  </body>
</html>
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          webViewController.loadHtmlString(_htmlString);
          _controller.complete(webViewController);
        },
        javascriptChannels: <JavascriptChannel>{
          _leanJavascriptChannel(context, widget.callback),
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }

  JavascriptChannel _leanJavascriptChannel(
      BuildContext context, LeanCallback? callback) {
    return JavascriptChannel(
        name: 'LeanFlutter',
        onMessageReceived: (JavascriptMessage message) {
          print("LeanFlutter Channel Callback: ${message.message}");
          if (callback != null) {
            callback(message.message);
          }
        });
  }

  Future<void> _connect({
    required String appToken,
    required bool isSandbox,
    required String customerId,
    required List<String> permissions,
  }) async {
    if (kDebugMode) {
      print("Called _connect");
    }
    WebViewController controller = await _controller.future;

    await controller.runJavascript('''
        LeanFlutter.postMessage("connect called")
        function postResponse(status) {
                status.method = "CONNECT"
                LeanFlutter.postMessage(JSON.stringify(status))
            }
            try {
                Lean.connect({
                    app_token: "$appToken",
                    customer_id: "$customerId",
                    permissions: ["${permissions.join("\",\"")}"],
                    sandbox: $isSandbox,
                    callback: postResponse
                })
            } catch (e) {
                postResponse({ method: "CONNECT", status: "ERROR", message: "Lean not initialized" })
            }
        ''');
  }

  Future<void> _reconnect({
    required String appToken,
    required bool isSandbox,
    required String reconnectId,
  }) async {
    if (kDebugMode) {
      print("Called _reconnect");
    }
    WebViewController controller = await _controller.future;

    await controller.runJavascript('''
        function postResponse(status) {
                status.method = "RECONNECT"
                LeanFlutter.postMessage(JSON.stringify(status))
            }
            try {
                Lean.reconnect({
                    app_token: "$appToken",
                    reconnect_id: "$reconnectId",
                    sandbox: $isSandbox,
                    callback: postResponse
                })
            } catch (e) {
                postResponse({ method: "RECONNECT", status: "ERROR", message: "Lean not initialized" })
            }
        ''');
  }
}
