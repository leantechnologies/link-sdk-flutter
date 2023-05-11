import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'enums.dart';

class LeanSDK {
  late String _env;
  late bool _showLogs;
  late String _baseUrl;
  late String _version;
  late String _country;
  late bool _isSandbox;
  late String _appToken;
  late String _language;
  Map<String, String> _customization = {};

  LeanSDK({
    env,
    version,
    country,
    appToken,
    language,
    showLogs,
    isSandbox,
    customization,
  }) {
    _env = env;
    _version = version;
    _country = country;
    _appToken = appToken;
    _language = language;
    _showLogs = showLogs;
    _isSandbox = isSandbox;

    if (customization != null) {
      _customization = customization;
    }

    _baseUrl =
        "https://cdn.leantech.me/link/loader/prod/$country/$version/lean-sdk.html";
  }

  //  ================    Members and helper methods    ================    //

  String get _getBaseUrl {
    return "$_baseUrl?${Config.implementation.name}=webview-hosted-html&${Config.app_token.name}=$_appToken&${Config.sandbox.name}=$_isSandbox&${Config.language.name}=$_language&${Config.version.name}=$_version&${Config.country.name}=$_country&${Config.env.name}=$_env";
  }

  String convertPermissionsToURLString(List<LeanPermissions> permissions) {
    var permissionsParams = '';

    if (permissions.isEmpty) {
      return permissionsParams;
    }

    for (LeanPermissions permission in permissions) {
      permissionsParams =
          "$permissionsParams&${Params.permissions.name}=${permission.name}";
    }

    return permissionsParams;
  }

  String convertCustomizationToURLString() {
    var customizationParams = '';

    if (_customization.isEmpty) {
      return customizationParams;
    }

    for (String customizationOption in _customization.keys) {
      customizationParams =
          "$customizationParams&${Params.customization.name}=$customizationOption+${_customization[customizationOption]}";
    }

    return customizationParams;
  }

  //  ================    Link methods    ================    //

  link({
    required String customerId,
    required List<LeanPermissions> permissions,
    String? bankIdentifier,
    String? failRedirectUrl,
    String? successRedirectUrl,
  }) {
    if (customerId.isEmpty) {
      throw const FormatException('Validation Error: customerId is required');
    }

    if (permissions.isEmpty) {
      throw const FormatException('Validation Error: permissions is required');
    }

    if (permissions.contains(LeanPermissions.payments)) {
      throw const FormatException(
        "Validation Error: 'payments' permission is not supported for link",
      );
    }

    if ((permissions.contains(LeanPermissions.balance) ||
            permissions.contains(LeanPermissions.transactions)) &&
        !permissions.contains(LeanPermissions.accounts)) {
      throw const FormatException(
        "Validation Error: Must have 'accounts' permission if requesting 'balance' and/or 'transactions' permission",
      );
    }

    String permissionsParams = convertPermissionsToURLString(permissions);
    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.link.name}&${Params.customer_id.name}=$customerId$permissionsParams$customizationParams";

    // only include properties that are set
    if (bankIdentifier != null && bankIdentifier.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.bank_identifier.name}=$bankIdentifier";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url.name}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url.name}=$successRedirectUrl";
    }

    return initializationURL;
  }

  connect({
    required String customerId,
    required List<LeanPermissions> permissions,
    String? accessTo,
    String? accessFrom,
    String? bankIdentifier,
    String? failRedirectUrl,
    String? successRedirectUrl,
    String? paymentDestinationId,
  }) {
    if (customerId.isEmpty) {
      throw const FormatException('Validation Error: customerId is required');
    }

    if (permissions.isEmpty) {
      throw const FormatException('Validation Error: permissions is required');
    }

    if ((permissions.contains(LeanPermissions.balance) ||
            permissions.contains(LeanPermissions.transactions)) &&
        !permissions.contains(LeanPermissions.accounts)) {
      throw const FormatException(
        "Validation Error: Must have 'accounts' permission if requesting 'balance' and/or 'transactions' permission",
      );
    }

    String permissionsParams = convertPermissionsToURLString(permissions);
    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.connect.name}&${Params.customer_id.name}=$customerId$permissionsParams$customizationParams";

    // only include properties that are set
    if (bankIdentifier != null && bankIdentifier.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.bank_identifier.name}=$bankIdentifier";
    }

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_destination_id.name}=$paymentDestinationId";
    }

    if (accessTo != null && accessTo.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_to.name}=$accessTo";
    }

    if (accessFrom != null && accessFrom.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_from.name}=$accessFrom";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url.name}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url.name}=$successRedirectUrl";
    }

    return initializationURL;
  }

  reconnect({required String reconnectId}) {
    if (reconnectId.isEmpty) {
      throw const FormatException('Validation Error: reconnectId is required');
    }

    String customizationParams = convertCustomizationToURLString();

    return "$_getBaseUrl&method=${LeanMethods.reconnect}&${Params.reconnect_id.name}=$reconnectId$customizationParams";
  }

  createBeneficiary({
    required String customerId,
    String? paymentSourceId,
    String? failRedirectUrl,
    String? successRedirectUrl,
    String? paymentDestinationId,
  }) {
    if (customerId.isEmpty) {
      throw const FormatException('Validation Error: customerId is required');
    }

    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.createBeneficiary}&${Params.customer_id.name}=$customerId$customizationParams";

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_destination_id.name}=$paymentDestinationId";
    }

    if (paymentSourceId != null && paymentSourceId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_source_id.name}=$paymentSourceId";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url.name}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url.name}=$successRedirectUrl";
    }

    return initializationURL;
  }

  createPaymentSource({
    required String customerId,
    String? bankIdentifier,
    String? failRedirectUrl,
    String? successRedirectUrl,
    String? paymentDestinationId,
  }) {
    if (customerId.isEmpty) {
      throw const FormatException('Validation Error: customerId is required');
    }

    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.createBeneficiary}&${Params.customer_id.name}=$customerId$customizationParams";

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_destination_id.name}=$paymentDestinationId";
    }

    if (bankIdentifier != null && bankIdentifier.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.bank_identifier.name}=$bankIdentifier";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url.name}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url.name}=$successRedirectUrl";
    }

    return initializationURL;
  }

  updatePaymentSource({
    required String customerId,
    String? paymentSourceId,
    String? failRedirectUrl,
    String? successRedirectUrl,
    String? paymentDestinationId,
  }) {
    if (customerId.isEmpty) {
      throw const FormatException('Validation Error: customerId is required');
    }

    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.createBeneficiary}&${Params.customer_id.name}=$customerId$customizationParams";

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_destination_id.name}=$paymentDestinationId";
    }

    if (paymentSourceId != null && paymentSourceId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_source_id.name}=$paymentSourceId";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url.name}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url.name}=$successRedirectUrl";
    }

    return initializationURL;
  }

  pay({
    required String paymentIntentId,
    String? accountId,
    bool? showBalances,
    String? failRedirectUrl,
    String? successRedirectUrl,
  }) {
    if (paymentIntentId.isEmpty) {
      throw const FormatException(
          'Validation Error: paymentIntentId is required');
    }

    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.createBeneficiary}&${Params.payment_intent_id.name}=$paymentIntentId$customizationParams";

    if (accountId != null && accountId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.account_id.name}=$accountId";
    }

    if (showBalances != null && showBalances == true) {
      initializationURL =
          "$initializationURL&${Params.show_balances.name}=$showBalances";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url.name}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url.name}=$successRedirectUrl";
    }

    return initializationURL;
  }
}
