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

    group('link', () {
      test('throws an error when required params are missing', () {
        expect(
            () => leanSdk.connect(
                  customerId: '',
                  permissions: [],
                  accessTo: '',
                  accessFrom: '',
                  bankIdentifier: '',
                  failRedirectUrl: '',
                  successRedirectUrl: '',
                  paymentDestinationId: '',
                ),
            throwsA(predicate((e) =>
                e is FormatException &&
                e.message == 'Validation Error: customerId is required')));

        expect(
            () => leanSdk.connect(
                  customerId: customerId,
                  permissions: [],
                  accessTo: '',
                  accessFrom: '',
                  bankIdentifier: '',
                  failRedirectUrl: '',
                  successRedirectUrl: '',
                  paymentDestinationId: '',
                ),
            throwsA(predicate((e) =>
                e is FormatException &&
                e.message == 'Validation Error: permissions is required')));

        expect(
            () => leanSdk.connect(
                  customerId: customerId,
                  permissions: [
                    LeanPermissions.identity,
                    LeanPermissions.transactions,
                    LeanPermissions.payments
                  ],
                  accessTo: '',
                  accessFrom: '',
                  bankIdentifier: '',
                  failRedirectUrl: '',
                  successRedirectUrl: '',
                  paymentDestinationId: '',
                ),
            throwsA(predicate((e) =>
                e is FormatException &&
                e.message ==
                    "Validation Error: Must have 'accounts' permission if requesting 'balance' and/or 'transactions' permission")));
      });

      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=connect&customer_id=dda80d32-4062-404c-abe7-ba9b9290c873&permissions=identity&permissions=accounts&permissions=balance&permissions=transactions&permissions=payments';

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
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=connect&customer_id=dda80d32-4062-404c-abe7-ba9b9290c873&permissions=identity&permissions=accounts&permissions=balance&permissions=transactions&permissions=payments&bank_identifier=LEANMB1_SAU&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&access_to=10-10-2023&access_from=10-05-2023&fail_redirect_url=https://dev.leantech.me/success&success_redirect_url=https://dev.leantech.me/fail';

        final initializationURL = leanSdk.connect(
            customerId: customerId,
            permissions: [
              LeanPermissions.identity,
              LeanPermissions.accounts,
              LeanPermissions.balance,
              LeanPermissions.transactions,
              LeanPermissions.payments
            ],
            accessTo: '10-10-2023',
            accessFrom: '10-05-2023',
            bankIdentifier: 'LEANMB1_SAU',
            failRedirectUrl: 'https://dev.leantech.me/success',
            successRedirectUrl: 'https://dev.leantech.me/fail',
            paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0');

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('reconnect', () {
      test('throws an error when required params are missing', () {
        expect(
            () => leanSdk.reconnect(reconnectId: ''),
            throwsA(predicate((e) =>
                e is FormatException &&
                e.message == 'Validation Error: reconnectId is required')));
      });

      test('returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=reconnect&reconnect_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.reconnect(
          reconnectId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('createBeneficiary', () {
      test('throws an error when required params are missing', () {
        expect(
            () => leanSdk.createBeneficiary(
                  customerId: '',
                  paymentSourceId: '8b3b7960-c4a1-41da-8ad0-5df36cf67540',
                  failRedirectUrl: 'https://dev.leantech.me/success',
                  successRedirectUrl: 'https://dev.leantech.me/fail',
                  paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
                ),
            throwsA(predicate((e) =>
                e is FormatException &&
                e.message == 'Validation Error: customerId is required')));
      });

      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createBeneficiary&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.createBeneficiary(
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createBeneficiary&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_source_id=8b3b7960-c4a1-41da-8ad0-5df36cf67540&fail_redirect_url=https://dev.leantech.me/success&success_redirect_url=https://dev.leantech.me/fail';

        final initializationURL = leanSdk.createBeneficiary(
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          paymentSourceId: '8b3b7960-c4a1-41da-8ad0-5df36cf67540',
          failRedirectUrl: 'https://dev.leantech.me/success',
          successRedirectUrl: 'https://dev.leantech.me/fail',
          paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('createPaymentSource', () {
      test('throws an error when required params are missing', () {
        expect(
            () => leanSdk.createPaymentSource(
                  customerId: '',
                  bankIdentifier: 'LEANMB1_SAU',
                  failRedirectUrl: 'https://dev.leantech.me/success',
                  successRedirectUrl: 'https://dev.leantech.me/fail',
                  paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
                ),
            throwsA(predicate((e) =>
                e is FormatException &&
                e.message == 'Validation Error: customerId is required')));
      });

      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createBeneficiary&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.createPaymentSource(
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createBeneficiary&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&bank_identifier=LEANMB1_SAU&fail_redirect_url=https://dev.leantech.me/success&success_redirect_url=https://dev.leantech.me/fail';

        final initializationURL = leanSdk.createPaymentSource(
          bankIdentifier: 'LEANMB1_SAU',
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          failRedirectUrl: 'https://dev.leantech.me/success',
          successRedirectUrl: 'https://dev.leantech.me/fail',
          paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });

    group('updatePaymentSource', () {
      test('throws an error when required params are missing', () {
        expect(
            () => leanSdk.updatePaymentSource(
                  customerId: '',
                  paymentSourceId: '8b3b7960-c4a1-41da-8ad0-5df36cf67540',
                  failRedirectUrl: 'https://dev.leantech.me/success',
                  successRedirectUrl: 'https://dev.leantech.me/fail',
                  paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
                ),
            throwsA(predicate((e) =>
                e is FormatException &&
                e.message == 'Validation Error: customerId is required')));
      });

      test('partial params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createBeneficiary&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0';

        final initializationURL = leanSdk.updatePaymentSource(
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });

      test('all params: returns the correct URL', () {
        const expectedUrl =
            'https://cdn.leantech.me/link/loader/prod/ae/latest/lean-sdk.html?implementation=webview-hosted-html&app_token=9fb9e934-9efb-4e7e-a508-de67c0839be0&sandbox=false&language=en&version=latest&country=ae&env=production&method=createBeneficiary&customer_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_destination_id=617207b3-a4d4-4413-ba1b-b8d32efd58a0&payment_source_id=8b3b7960-c4a1-41da-8ad0-5df36cf67540&fail_redirect_url=https://dev.leantech.me/success&success_redirect_url=https://dev.leantech.me/fail';

        final initializationURL = leanSdk.updatePaymentSource(
          customerId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
          paymentSourceId: '8b3b7960-c4a1-41da-8ad0-5df36cf67540',
          failRedirectUrl: 'https://dev.leantech.me/success',
          successRedirectUrl: 'https://dev.leantech.me/fail',
          paymentDestinationId: '617207b3-a4d4-4413-ba1b-b8d32efd58a0',
        );

        expect(initializationURL, equals(expectedUrl));
      });
    });
  });
}
