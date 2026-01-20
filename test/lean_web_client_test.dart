import 'package:flutter_test/flutter_test.dart';
import 'package:lean_sdk_flutter/lean_types.dart';
import 'package:lean_sdk_flutter/lean_web_client.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  group('LeanWebClient', () {
    test('handleUrlOverride: parses all response parameters correctly',
        () async {
      // Arrange
      const testUrl =
          'leanlink://callback?status=SUCCESS&bank_id=test_bank&message=Test%20Message&exit_point=screen1&last_api_response=%7B%22data%22%3A%22test%22%7D&secondary_status=completed&is_supported=true&exit_intent_point=back_button&exit_survey_reason=too_slow&lean_correlation_id=corr_123&user_exit_intent=USER_CANCELLED_PAYMENT';

      LeanResponse? capturedResponse;
      void callback(LeanResponse response) {
        capturedResponse = response;
      }

      final request = NavigationRequest(url: testUrl, isMainFrame: true);

      // Act
      final decision = await LeanWebClient.handleUrlOverride(request, callback);

      // Assert
      expect(decision, NavigationDecision.prevent);
      expect(capturedResponse, isNotNull);
      expect(capturedResponse!.status, 'SUCCESS');
      expect(capturedResponse!.bankId, 'test_bank');
      expect(capturedResponse!.message, 'Test Message');
      expect(capturedResponse!.exitPoint, 'screen1');
      expect(capturedResponse!.lastApiResponse, '{"data":"test"}');
      expect(capturedResponse!.secondaryStatus, 'completed');
      expect(capturedResponse!.bankIsSupported, true);
      expect(capturedResponse!.exitIntentPoint, 'back_button');
      expect(capturedResponse!.exitSurveyReason, 'too_slow');
      expect(capturedResponse!.leanCorrelationId, 'corr_123');
      expect(capturedResponse!.userExitIntent, 'USER_CANCELLED_PAYMENT');
    });

    test('handleUrlOverride: parses response with missing optional parameters',
        () async {
      // Arrange
      const testUrl =
          'leanlink://callback?status=ERROR&message=Error%20occurred';

      LeanResponse? capturedResponse;
      void callback(LeanResponse response) {
        capturedResponse = response;
      }

      final request = NavigationRequest(url: testUrl, isMainFrame: true);

      // Act
      final decision = await LeanWebClient.handleUrlOverride(request, callback);

      // Assert
      expect(decision, NavigationDecision.prevent);
      expect(capturedResponse, isNotNull);
      expect(capturedResponse!.status, 'ERROR');
      expect(capturedResponse!.message, 'Error occurred');
      expect(capturedResponse!.bankId, isNull);
      expect(capturedResponse!.exitPoint, isNull);
      expect(capturedResponse!.lastApiResponse, isNull);
      expect(capturedResponse!.secondaryStatus, isNull);
      expect(capturedResponse!.bankIsSupported, isFalse);
      expect(capturedResponse!.exitIntentPoint, isNull);
      expect(capturedResponse!.exitSurveyReason, isNull);
      expect(capturedResponse!.leanCorrelationId, isNull);
      expect(capturedResponse!.userExitIntent, isNull);
    });

    test('handleUrlOverride: handles redirect URLs correctly', () async {
      // Arrange
      const testUrl = 'leanlink://redirect';

      LeanResponse? capturedResponse;
      void callback(LeanResponse response) {
        capturedResponse = response;
      }

      final request = NavigationRequest(url: testUrl, isMainFrame: true);

      // Act
      final decision = await LeanWebClient.handleUrlOverride(request, callback);

      // Assert
      expect(decision, NavigationDecision.prevent);
      expect(capturedResponse, isNotNull);
      expect(capturedResponse!.status, 'SUCCESS');
      expect(capturedResponse!.message, 'Link closed after redirect');
      expect(capturedResponse!.userExitIntent, isNull);
    });

    test('handleUrlOverride: allows Lean CDN loader URLs', () async {
      // Arrange
      const testUrl = 'https://cdn.leantech.me/link/loader/prod/ae/latest/';

      final request = NavigationRequest(url: testUrl, isMainFrame: true);

      // Act
      final decision = await LeanWebClient.handleUrlOverride(request, null);

      // Assert
      expect(decision, NavigationDecision.navigate);
    });

    test('handleUrlOverride: parses bankIsSupported as true', () async {
      // Arrange
      const testUrl = 'leanlink://callback?status=SUCCESS&is_supported=true';

      LeanResponse? capturedResponse;
      void callback(LeanResponse response) {
        capturedResponse = response;
      }

      final request = NavigationRequest(url: testUrl, isMainFrame: true);

      // Act
      await LeanWebClient.handleUrlOverride(request, callback);

      // Assert
      expect(capturedResponse!.bankIsSupported, true);
    });

    test('handleUrlOverride: parses bankIsSupported as false', () async {
      // Arrange
      const testUrl = 'leanlink://callback?status=SUCCESS&is_supported=false';

      LeanResponse? capturedResponse;
      void callback(LeanResponse response) {
        capturedResponse = response;
      }

      final request = NavigationRequest(url: testUrl, isMainFrame: true);

      // Act
      await LeanWebClient.handleUrlOverride(request, callback);

      // Assert
      expect(capturedResponse!.bankIsSupported, false);
    });

    test('handleUrlOverride: handles user_exit_intent parameter', () async {
      // Arrange
      const testUrl =
          'leanlink://callback?status=CANCELLED&user_exit_intent=USER_COMPLETED_PAYMENT';

      LeanResponse? capturedResponse;
      void callback(LeanResponse response) {
        capturedResponse = response;
      }

      final request = NavigationRequest(url: testUrl, isMainFrame: true);

      // Act
      final decision = await LeanWebClient.handleUrlOverride(request, callback);

      // Assert
      expect(decision, NavigationDecision.prevent);
      expect(capturedResponse, isNotNull);
      expect(capturedResponse!.status, 'CANCELLED');
      expect(capturedResponse!.userExitIntent, 'USER_COMPLETED_PAYMENT');
    });
  });
}
