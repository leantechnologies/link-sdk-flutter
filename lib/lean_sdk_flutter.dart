import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:lean_sdk_flutter/lean.dart';
import 'package:lean_sdk_flutter/lean_web_client.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:permission_handler/permission_handler.dart';

import 'lean_logger.dart';
import 'lean_types.dart';

export 'lean_types.dart';

class Lean extends StatefulWidget {
  //  ================    Initialization params    =============    //

  final String env; // Internal
  final String version;
  final bool showLogs;
  final bool isSandbox;
  final LeanCountry country;
  final LeanLanguage language;

  //  ================    Link method params    ================    //

  final String appToken;
  final String? accessTo;
  final String? accessToken;
  final String? accountId;
  final String? accessFrom;
  final String? customerId;
  final String? reconnectId;
  final bool? showBalances;
  final LeanCallback? callback;
  final String? bankIdentifier;
  final String? paymentIntentId;
  final String? failRedirectUrl;
  final String? paymentSourceId;
  final String? successRedirectUrl;
  final String? paymentDestinationId;
  final Map<String, String>? customization;
  final List<LeanPermissions>? permissions;
  final LeanActionCancelled? actionCancelled;

  //  ================    Extra params    =====================    //

  final LeanMethods _method;
  final String initializationUrl;

  const Lean.connect({
    super.key,
    required this.appToken,
    required this.customerId,
    required this.permissions,
    this.callback,
    this.customization,
    this.actionCancelled,
    this.isSandbox = true,
    this.showLogs = false,
    this.version = 'latest',
    this.env = 'production',
    this.country = LeanCountry.ae,
    this.language = LeanLanguage.en,
    // method-specific properties
    this.accessTo,
    this.accessFrom,
    this.accessToken,
    this.bankIdentifier,
    this.failRedirectUrl,
    this.successRedirectUrl,
    this.paymentDestinationId,
  })  : _method = LeanMethods.connect,
        accountId = null,
        reconnectId = null,
        showBalances = null,
        paymentSourceId = null,
        paymentIntentId = null,
        initializationUrl = '';

  const Lean.reconnect({
    super.key,
    required this.appToken,
    required this.reconnectId,
    this.callback,
    this.accessToken,
    this.customization,
    this.actionCancelled,
    this.isSandbox = true,
    this.showLogs = false,
    this.version = 'latest',
    this.env = 'production',
    this.country = LeanCountry.ae,
    this.language = LeanLanguage.en,
  })  : _method = LeanMethods.reconnect,
        accessTo = null,
        accountId = null,
        customerId = null,
        accessFrom = null,
        permissions = null,
        showBalances = null,
        bankIdentifier = null,
        paymentSourceId = null,
        paymentIntentId = null,
        initializationUrl = '',
        failRedirectUrl = null,
        successRedirectUrl = null,
        paymentDestinationId = null;

  const Lean.createBeneficiary({
    super.key,
    required this.appToken,
    required this.customerId,
    this.callback,
    this.accessToken,
    this.customization,
    this.actionCancelled,
    this.isSandbox = true,
    this.showLogs = false,
    this.version = 'latest',
    this.env = 'production',
    this.country = LeanCountry.ae,
    this.language = LeanLanguage.en,
    // method-specific properties
    this.paymentSourceId,
    this.failRedirectUrl,
    this.successRedirectUrl,
    this.paymentDestinationId,
  })  : _method = LeanMethods.createBeneficiary,
        accessTo = null,
        accountId = null,
        accessFrom = null,
        permissions = null,
        reconnectId = null,
        showBalances = null,
        bankIdentifier = null,
        paymentIntentId = null,
        initializationUrl = '';

  const Lean.createPaymentSource({
    super.key,
    required this.appToken,
    required this.customerId,
    this.callback,
    this.accessToken,
    this.customization,
    this.actionCancelled,
    this.isSandbox = true,
    this.showLogs = false,
    this.version = 'latest',
    this.env = 'production',
    this.country = LeanCountry.ae,
    this.language = LeanLanguage.en,
    // method-specific properties
    this.bankIdentifier,
    this.failRedirectUrl,
    this.paymentSourceId,
    this.successRedirectUrl,
    this.paymentDestinationId,
  })  : _method = LeanMethods.createPaymentSource,
        accessTo = null,
        accountId = null,
        accessFrom = null,
        permissions = null,
        reconnectId = null,
        showBalances = null,
        paymentIntentId = null,
        initializationUrl = '';

  const Lean.updatePaymentSource({
    super.key,
    required this.appToken,
    required this.customerId,
    this.callback,
    this.accessToken,
    this.customization,
    this.actionCancelled,
    this.isSandbox = true,
    this.showLogs = false,
    this.version = 'latest',
    this.env = 'production',
    this.country = LeanCountry.ae,
    this.language = LeanLanguage.en,
    // method-specific properties
    this.paymentSourceId,
    this.failRedirectUrl,
    this.successRedirectUrl,
    this.paymentDestinationId,
  })  : _method = LeanMethods.updatePaymentSource,
        accessTo = null,
        accountId = null,
        accessFrom = null,
        permissions = null,
        reconnectId = null,
        showBalances = null,
        bankIdentifier = null,
        paymentIntentId = null,
        initializationUrl = '';

  const Lean.pay({
    super.key,
    required this.appToken,
    required this.paymentIntentId,
    this.callback,
    this.accessToken,
    this.customization,
    this.actionCancelled,
    this.isSandbox = true,
    this.showLogs = false,
    this.version = 'latest',
    this.env = 'production',
    this.country = LeanCountry.ae,
    this.language = LeanLanguage.en,
    // method-specific properties
    this.accountId,
    this.showBalances,
    this.failRedirectUrl,
    this.successRedirectUrl,
  })  : _method = LeanMethods.pay,
        accessTo = null,
        customerId = null,
        accessFrom = null,
        reconnectId = null,
        permissions = null,
        bankIdentifier = null,
        paymentSourceId = null,
        initializationUrl = '',
        paymentDestinationId = null;

  @override
  State<Lean> createState() => _LeanState();
}

class _LeanState extends State<Lean> {
  LeanSDK get _leanSdk {
    var leanSdk = LeanSDK(
      env: widget.env,
      version: widget.version,
      appToken: widget.appToken,
      showLogs: widget.showLogs,
      isSandbox: widget.isSandbox,
      country: widget.country.name,
      language: widget.language.name,
      customization: widget.customization,
    );

    return leanSdk;
  }

  String get _connect {
    return _leanSdk.connect(
        customerId: widget.customerId!,
        permissions: widget.permissions!,
        accessTo: widget.accessTo,
        accessFrom: widget.accessFrom,
        bankIdentifier: widget.bankIdentifier,
        failRedirectUrl: widget.failRedirectUrl,
        successRedirectUrl: widget.successRedirectUrl,
        paymentDestinationId: widget.paymentDestinationId,
        accessToken: widget.accessToken);
  }

  String get _reconnect {
    return _leanSdk.reconnect(
        reconnectId: widget.reconnectId!, accessToken: widget.accessToken);
  }

  String get _createBeneficiary {
    return _leanSdk.createBeneficiary(
        customerId: widget.customerId!,
        paymentSourceId: widget.paymentSourceId,
        failRedirectUrl: widget.failRedirectUrl,
        successRedirectUrl: widget.successRedirectUrl,
        paymentDestinationId: widget.paymentDestinationId,
        accessToken: widget.accessToken);
  }

  String get _createPaymentSource {
    return _leanSdk.createPaymentSource(
        customerId: widget.customerId!,
        bankIdentifier: widget.bankIdentifier,
        failRedirectUrl: widget.failRedirectUrl,
        successRedirectUrl: widget.successRedirectUrl,
        paymentDestinationId: widget.paymentDestinationId,
        accessToken: widget.accessToken);
  }

  String get _updatePaymentSource {
    return _leanSdk.updatePaymentSource(
        customerId: widget.customerId!,
        paymentSourceId: widget.paymentSourceId!,
        paymentDestinationId: widget.paymentDestinationId!,
        failRedirectUrl: widget.failRedirectUrl,
        successRedirectUrl: widget.successRedirectUrl,
        accessToken: widget.accessToken);
  }

  String get _pay {
    return _leanSdk.pay(
        paymentIntentId: widget.paymentIntentId!,
        accountId: widget.accountId,
        showBalances: widget.showBalances,
        failRedirectUrl: widget.failRedirectUrl,
        successRedirectUrl: widget.successRedirectUrl,
        accessToken: widget.accessToken);
  }

  String get _initializationUrl {
    switch (widget._method) {
      case LeanMethods.connect:
        return _connect;
      case LeanMethods.reconnect:
        return _reconnect;
      case LeanMethods.createBeneficiary:
        return _createBeneficiary;
      case LeanMethods.createPaymentSource:
        return _createPaymentSource;
      case LeanMethods.updatePaymentSource:
        return _updatePaymentSource;
      case LeanMethods.pay:
        return _pay;
      default:
        return '';
    }
  }

  Future<void> requestCameraPermission(
      PlatformWebViewPermissionRequest request) async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      request.grant();
    } else if (status == PermissionStatus.denied) {
      // Permission denied.
    } else if (status == PermissionStatus.permanentlyDenied) {
      // Permission permanently denied.
    }
  }

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    var initialUrl = Uri.parse(_initializationUrl);

    LeanLogger.info(msg: "_initializationUrl $initialUrl");

    late final PlatformWebViewControllerCreationParams params;

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{});
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params)
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                LeanLogger.info(msg: 'Lean SDK initialization started.');
              },
              onPageFinished: (String url) {
                LeanLogger.info(msg: 'Lean SDK initialization completed.');
              },
              onNavigationRequest: (NavigationRequest request) {
                return LeanWebClient.handleUrlOverride(
                    request, widget.callback);
              },
            ),
          )
          ..loadRequest(initialUrl);

    if (controller.platform is WebKitWebViewController) {
      if (kDebugMode) {
        (controller.platform as WebKitWebViewController).setInspectable(true);
      }
    }

    if (controller.platform is AndroidWebViewController) {
      if (kDebugMode) {
        AndroidWebViewController.enableDebugging(true);
      }

      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
      (controller.platform as AndroidWebViewController)
          .setOnPlatformPermissionRequest(
              (PlatformWebViewPermissionRequest request) {
        requestCameraPermission(request);
      });
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
