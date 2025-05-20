import 'package:lean_sdk_flutter/lean.dart';
import 'package:lean_sdk_flutter/lean_sdk_flutter.dart';
import 'package:test/test.dart';

void main() {
  group('Lean SDK', () {
    var appToken = '9fb9e934-9efb-4e7e-a508-de67c0839be0';
    var customerId = 'dda80d32-4062-404c-abe7-ba9b9290c873';
    var leanSdk = LeanSDK(
      appToken: appToken,
      env: 'production',
      country: 'ae',
      language: 'en',
      isSandbox: false,
      showLogs: false,
      version: 'latest',
      customization: null,
    );

    group('connect', () {
      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=connect&customer_id=dda80d32-4062-404c-abe7-ba9b9290c873&permissions=identity&permissions=accounts&permissions=balance&permissions=transactions&permissions=payments';

        final initializationURL = leanSdk.connect(
          customerId: customerId,
          permissions: [
            LeanPermissions.identity,
            LeanPermissions.accounts,
            LeanPermissions.balance,
            LeanPermissions.transactions,
            LeanPermissions.payments
          ],
          accessTo: '',
          accessFrom: '',
          bankIdentifier: '',
          failRedirectUrl: '',
          successRedirectUrl: '',
          paymentDestinationId: '',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=connect&customer_id=dda80d32-4062-404c-abe7-ba9b9290c873&permissions=identity&permissions=accounts&permissions=balance&permissions=transactions&permissions=payments&bank_identifier=LEANMB1_SAU&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&access_to=10-10-2023&access_from=10-05-2023&access_token=test&fail_redirect_url=https://dev.leantech.me/fail&success_redirect_url=https://dev.leantech.me/success';

        final initializationURL = leanSdk.connect(
            customerId: customerId,
            permissions: [
              LeanPermissions.identity,
              LeanPermissions.accounts,
              LeanPermissions.balance,
              LeanPermissions.transactions,
              LeanPermissions.payments
            ],
            accessToken: 'test',
            accessTo: '10-10-2023',
            accessFrom: '10-05-2023',
            bankIdentifier: 'LEANMB1_SAU',
            failRedirectUrl: 'https://dev.leantech.me/fail',
            successRedirectUrl: 'https://dev.leantech.me/success',
            paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0');

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('reconnect', () {
      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=reconnect&reconnect_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.reconnect(
          reconnectId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=reconnect&reconnect_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&access_token=test';

        final initializationURL = leanSdk.reconnect(
          reconnectId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          accessToken: 'test',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('createBeneficiary', () {
      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createBeneficiary&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.createBeneficiary(
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createBeneficiary&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_source_id=8b3b7960-c4a1-41da-8ad0-5df36cf67540&access_token=test&entity_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&fail_redirect_url=https://dev.leantech.me/fail&success_redirect_url=https://dev.leantech.me/success';

        final initializationURL = leanSdk.createBeneficiary(
          accessToken: 'test',
          entityId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          paymentSourceId: '8b3b7960-c4a1-41da-8ad0-5df36cf67540',
          failRedirectUrl: 'https://dev.leantech.me/fail',
          successRedirectUrl: 'https://dev.leantech.me/success',
          paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('createPaymentSource', () {
      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createPaymentSource&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.createPaymentSource(
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createPaymentSource&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&bank_identifier=LEANMB1_SAU&access_token=test&fail_redirect_url=https://dev.leantech.me/fail&success_redirect_url=https://dev.leantech.me/success';

        final initializationURL = leanSdk.createPaymentSource(
          accessToken: 'test',
          bankIdentifier: 'LEANMB1_SAU',
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          failRedirectUrl: 'https://dev.leantech.me/fail',
          successRedirectUrl: 'https://dev.leantech.me/success',
          paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('updatePaymentSource', () {
      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=updatePaymentSource&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_source_id=8b3b7960-c4a1-41da-8ad0-5df36cf67540&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.updatePaymentSource(
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          paymentSourceId: '8b3b7960-c4a1-41da-8ad0-5df36cf67540',
          paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=updatePaymentSource&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_source_id=8b3b7960-c4a1-41da-8ad0-5df36cf67540&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&access_token=test&entity_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&fail_redirect_url=https://dev.leantech.me/fail&success_redirect_url=https://dev.leantech.me/success';

        final initializationURL = leanSdk.updatePaymentSource(
          accessToken: 'test',
          entityId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          paymentSourceId: '8b3b7960-c4a1-41da-8ad0-5df36cf67540',
          paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          failRedirectUrl: 'https://dev.leantech.me/fail',
          successRedirectUrl: 'https://dev.leantech.me/success',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('pay', () {
      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=pay&payment_intent_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.pay(
          paymentIntentId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=pay&payment_intent_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&account_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&show_balances=true&access_token=test&fail_redirect_url=https://dev.leantech.me/fail&success_redirect_url=https://dev.leantech.me/success';

        final initializationURL = leanSdk.pay(
          accessToken: 'test',
          paymentIntentId: "617207b3-a4d4-4413-ba1b-b8d32efd58a0",
          accountId: "617207b3-a4d4-4413-ba1b-b8d32efd58a0",
          showBalances: true,
          failRedirectUrl: 'https://dev.leantech.me/fail',
          successRedirectUrl: 'https://dev.leantech.me/success',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('verifyAddress', () {
      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&implementation_config=platform+mobile&implementation_config=sdk+flutter&implementation_config=os+macos&implementation_config=sdk_version+3.0.8&implementation_config=is_version_pinned+false&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=verifyAddress&customer_id=test-customer-id&customer_name=test-customer-name&permissions=identity';

        final initializationURL = leanSdk.verifyAddress(
            customerId:'test-customer-id',
            customerName:'test-customer-name',
            permissions: [LeanPermissions.identity]
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });
  });
}
