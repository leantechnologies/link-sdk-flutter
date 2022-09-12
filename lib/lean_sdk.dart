import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LeanResponse {
  final String status;
  final String method;
  final String? exitPoint;

  LeanResponse(this.status, this.method, this.exitPoint);

  LeanResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        method = json['method'],
        exitPoint = json['exit_point'];
}

typedef LeanCallback = void Function(String response);
typedef LeanActionError = void Function(String errorMessage);
typedef LeanActionCancelled = void Function();

enum Country { uae, ksa }

enum Permission { identity, transactions, balance, accounts }

enum LeanActionType { connect, createPaymentSource, reconnect, pay }

class Lean extends StatefulWidget {
  final String appToken;
  final String? customerId;
  final String? reconnectId;
  final String? paymentIntentId;
  final List<Permission>? permissions;
  final String version;
  final bool isSandbox;
  final Country country;
  final LeanCallback? callback;
  final LeanActionCancelled? actionCancelled;
  final LeanActionType _actionType;

  const Lean.connect(
      {super.key,
      required this.appToken,
      required this.customerId,
      required this.permissions,
      this.version = 'latest',
      this.isSandbox = true,
      this.country = Country.uae,
      this.callback,
      this.actionCancelled})
      : _actionType = LeanActionType.connect,
        paymentIntentId = null,
        reconnectId = null;

  const Lean.createPaymentSource(
      {super.key,
      required this.appToken,
      required this.customerId,
      this.version = 'latest',
      this.isSandbox = true,
      this.country = Country.uae,
      this.callback,
      this.actionCancelled})
      : _actionType = LeanActionType.createPaymentSource,
        reconnectId = null,
        paymentIntentId = null,
        permissions = null;

  const Lean.reconnect(
      {super.key,
      required this.appToken,
      required this.reconnectId,
      this.version = 'latest',
      this.isSandbox = true,
      this.country = Country.uae,
      this.callback,
      this.actionCancelled})
      : _actionType = LeanActionType.reconnect,
        customerId = null,
        paymentIntentId = null,
        permissions = null;

  const Lean.pay(
      {super.key,
      required this.appToken,
      required this.paymentIntentId,
      this.version = 'latest',
      this.isSandbox = true,
      this.country = Country.uae,
      this.callback,
      this.actionCancelled})
      : _actionType = LeanActionType.pay,
        customerId = null,
        reconnectId = null,
        permissions = null;

  @override
  _LeanState createState() => _LeanState();
}

class _LeanState extends State<Lean> {
  late WebViewController _webViewController;
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  String get _html {
    return ('''
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    </head>
    <body>
    <div id="lean-link"></div>
    <script src="https://cdn.leantech.me/${widget.country == Country.ksa ? "sa/" : ""}link/sdk/web/${widget.version}/Lean.min.js"></script>
    </body>
    </html>
    ''');
  }

  String get _javaScript {
    switch (widget._actionType) {
      case LeanActionType.connect:
        return _connectJsFunction;
      case LeanActionType.reconnect:
        return _reconnectJsFunction;
      case LeanActionType.createPaymentSource:
        return _createPaymentSourceJsFunction;
      case LeanActionType.pay:
        return _payJsFunction;
    }
  }

  String get _connectJsFunction {
    return ('''
          function postResponse(status) {
              status.method = "CONNECT"
              LeanFlutter.postMessage(JSON.stringify(status))
          }
          try {
            Lean.connect({
              app_token: "${widget.appToken}",
              customer_id: "${widget.customerId}",
              permissions: ["${widget.permissions?.map((p) => p.name).join("\",\"")}"],
              sandbox: ${widget.isSandbox},
              callback: postResponse
            });
          } catch (e) {
            postResponse({ method: "CONNECT", status: "ERROR", message: "Lean not initialized" })
          }
    ''');
  }

  String get _createPaymentSourceJsFunction {
    return ('''
          function postResponse(status) {
              status.method = "CREATE_PAYMENT_SOURCE"
              LeanFlutter.postMessage(JSON.stringify(status))
          }
          try {
            Lean.createPaymentSource({
              app_token: "${widget.appToken}",
              customer_id: "${widget.customerId}",
              sandbox: ${widget.isSandbox},
              callback: postResponse
            });
          } catch (e) {
            postResponse({ method: "CREATE_PAYMENT_SOURCE", status: "ERROR", message: "Lean not initialized" })
          }
    ''');
  }

  String get _reconnectJsFunction {
    return ('''
          function postResponse(status) {
              status.method = "RECONNECT"
              LeanFlutter.postMessage(JSON.stringify(status))
          }
          try {
            Lean.reconnect({
              app_token: "${widget.appToken}",
              reconnect_id: "${widget.reconnectId}",
              sandbox: ${widget.isSandbox},
              callback: postResponse
            });
          } catch (e) {
            postResponse({ method: "RECONNECT", status: "ERROR", message: "Lean not initialized" })
          }
    ''');
  }

  String get _payJsFunction {
    return ('''
          function postResponse(status) {
              status.method = "PAY"
              LeanFlutter.postMessage(JSON.stringify(status))
          }
          try {
            Lean.pay({
              app_token: "${widget.appToken}",
              customer_id: "${widget.customerId}",
              sandbox: ${widget.isSandbox},
              callback: postResponse
            });
          } catch (e) {
            postResponse({ method: "PAY", status: "ERROR", message: "Lean not initialized" })
          }
    ''');
  }

  JavascriptChannel _leanJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'LeanFlutter',
        onMessageReceived: (JavascriptMessage message) {

          Map<String, dynamic> userMap = jsonDecode(message.message);
          var resp = LeanResponse.fromJson(userMap);
          if (widget.actionCancelled != null && "CANCELLED" == resp.status) {
            widget.actionCancelled!();
          } else if (widget.callback != null) {
            widget.callback!(message.message);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onWebViewCreated: (WebViewController webViewController) {
        _webViewController = webViewController;
        _webViewController.loadHtmlString(_html);
      },
      onPageFinished: (_) async {
        await Future.delayed(const Duration(milliseconds: 800));
        _webViewController.runJavascript(_javaScript);
      },
      javascriptChannels: <JavascriptChannel>{
        _leanJavascriptChannel(context),
      },
    );
  }
}
