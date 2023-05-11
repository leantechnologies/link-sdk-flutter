import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:lean_sdk_flutter/lean.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'enums.dart';
export 'enums.dart';

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

class Lean extends StatefulWidget {
  late String _env;
  late bool _showLogs;
  late String _version;
  late bool _isSandbox;
  late String _appToken;
  late LeanCountry _country;
  late LeanLanguage _language;
  late Map<String, String>? _customization;

  late LeanCallback? _callback;

  late String _initializationUrl;

  Lean({
    super.key,
    required appToken,
    customization,
    showLogs = false,
    isSandbox = false,
    env = 'production',
    version = 'latest',
    country = LeanCountry.ae,
    language = LeanLanguage.en,
  }) {
    _env = env;
    _version = version;
    _country = country;
    _appToken = appToken;
    _language = language;
    _showLogs = showLogs;
    _isSandbox = isSandbox;
    _customization = customization;
  }

  LeanSDK get _leanSdk {
    var leanSdk = LeanSDK(
      env: _env,
      version: _version,
      appToken: _appToken,
      showLogs: _showLogs,
      isSandbox: _isSandbox,
      country: _country.name,
      language: _language.name,
      customization: _customization,
    );

    return leanSdk;
  }

  // @TODO: call action cancelled after receiving a callback

  connect({
    required String customerId,
    required List<LeanPermissions> permissions,
    String? accessTo,
    String? accessFrom,
    LeanCallback? callback,
    String? bankIdentifier,
    String? failRedirectUrl,
    String? successRedirectUrl,
    String? paymentDestinationId,
  }) {
    _callback = callback;
    _initializationUrl = _leanSdk.connect(
      customerId: customerId,
      permissions: permissions,
      accessTo: accessTo,
      accessFrom: accessFrom,
      bankIdentifier: bankIdentifier,
      failRedirectUrl: failRedirectUrl,
      successRedirectUrl: successRedirectUrl,
      paymentDestinationId: paymentDestinationId,
    );

    log("_initializationUrl $_initializationUrl");
  }

  @override
  _LeanState createState() => _LeanState();
}

class _LeanState extends State<Lean> {
  late WebViewController _webViewController;
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  void initState() {
    log("initialUrl ${widget._initializationUrl}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("initialUrl ${widget._initializationUrl}");

    return WebView(
      initialUrl: widget._initializationUrl,
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onWebViewCreated: (WebViewController webViewController) {
        log("initialUrl ${widget._initializationUrl}");
        _webViewController = webViewController;
        // _webViewController.loadUrl(widget._initializationUrl);
      },
      onPageStarted: (_) async {
        log('Lean SDK initialization started.');
      },
      onPageFinished: (_) async {
        await Future.delayed(const Duration(milliseconds: 800));
        log('Lean SDK initialization completed.');
      },
    );
  }
}
