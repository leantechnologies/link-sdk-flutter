import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'lean_types.dart';

class LeanWebClient {
  static LeanResponse _getResponseFromParams(Uri uri) {
    return LeanResponse(
      status: uri.queryParameters["status"]!,
      bankId: uri.queryParameters["bank_id"],
      message: uri.queryParameters["message"],
      exitPoint: uri.queryParameters["exit_point"],
      lastApiResponse: uri.queryParameters["last_api_response"],
      secondaryStatus: uri.queryParameters["secondary_status"],
      bankIsSupported:
          uri.queryParameters["is_supported"]?.toLowerCase() == 'true',
    );
  }

  static handleUrlOverride(
    NavigationRequest request,
    LeanCallback? callback,
  ) async {
    var uri = Uri.parse(request.url);
    if (uri.scheme == 'leanlink') {
      // Close SDK if it's an internal OpenBanking redirect
      if (uri.host == 'redirect') {
        log('Redirect received: ${request.url}');

        callback?.call(LeanResponse(
          status: 'SUCCESS',
          message: 'Link closed after redirect',
          bankId: null,
          exitPoint: null,
          lastApiResponse: null,
          secondaryStatus: null,
          bankIsSupported: null,
        ));

        // Do not override URL loading
        return NavigationDecision.prevent;
      }

      log('Response received: ${request.url}');

      // Send response back caller for proper handling
      callback?.call(_getResponseFromParams(uri));

      // Do not override URL loading
      return NavigationDecision.prevent;
    }

    // Open all URLs in default web browser
    if (await canLaunchUrl(uri)) {
      log('Opening URL in browser: ${request.url}');
      await launchUrl(uri);
    } else {
      log('Could not launch ${request.url}');
    }

    // Do not override URL loading
    return NavigationDecision.prevent;
  }
}
