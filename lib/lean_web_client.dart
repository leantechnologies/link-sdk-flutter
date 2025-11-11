import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'lean_logger.dart';
import 'lean_types.dart';

// Tracks if a redirect callback has already been delivered for the current session.
bool _redirectFired = false;

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
      exitIntentPoint: uri.queryParameters["exit_intent_point"],
      exitSurveyReason: uri.queryParameters["exit_survey_reason"],
      leanCorrelationId: uri.queryParameters["lean_correlation_id"],
      userExitIntent: uri.queryParameters["user_exit_intent"],
    );
  }

  static Future<NavigationDecision> handleUrlOverride(
    NavigationRequest request,
    LeanCallback? callback,
  ) async {
    final uri = Uri.parse(request.url);

    if (request.url.contains('https://cdn.leantech.me/link/loader')) {
      // Treat the loader as a new session; reset the redirect guard.
      _redirectFired = false;
      return NavigationDecision.navigate;
    }

    // Allow internal WKWebView schemes that may appear during loads.
    if (uri.scheme == 'about' || uri.scheme == 'data' || uri.scheme == 'blob') {
      return NavigationDecision.navigate;
    }

    // Handle Lean custom-scheme callbacks (success/error/cancelled/redirect).
    if (uri.scheme == 'leanlink') {
      LeanLogger.info(msg: 'Lean deep-link received: ${request.url}');

      // If the host is a generic redirect marker, return a canned success;
      // otherwise parse full details from the query string.
      if (uri.host == 'redirect') {
        LeanLogger.info(msg: 'Redirect received: ${request.url}');
        _redirectFired = true; // guard against late duplicates
        callback?.call(LeanResponse(
          status: 'SUCCESS',
          message: 'Link closed after redirect',
        ));
      } else {
        LeanLogger.info(msg: 'Response received: ${request.url}');
        callback?.call(_getResponseFromParams(uri));
      }
      return NavigationDecision.prevent;
    }

    // External handoff:
    // When leaving the WebView (e.g., to Safari for Open Banking),
    // WKWebView suspends JavaScript immediately. Any callback
    // scheduled after the hop (such as window.open('leanlink://redirect'))
    // may never run — especially on iOS when the redirect path is fast
    // due to caching or preconnect.
    //
    // To avoid losing callbacks, we always launch externally and issue
    // a manual fallback callback if no real leanlink:// event was received.
    LeanLogger.info(msg: 'Opening URL in external browser: ${request.url}');
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (launched) {
      if (!_redirectFired) {
        LeanLogger.info(
            msg: 'No leanlink callback detected → issuing manual fallback');
        _redirectFired = true; // set manual call to avoid potential double-fire
        callback?.call(LeanResponse(
          status: 'SUCCESS',
          message: 'Link closed after redirect',
        ));
      }
    } else {
      LeanLogger.info(msg: 'External launch failed: ${request.url}');
    }

    // Prevent WebView navigation for external URLs; we've handled them.
    return NavigationDecision.prevent;
  }
}
