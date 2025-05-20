import 'dart:io';

import 'package:lean_sdk_flutter/lean_logger.dart';

import 'lean_types.dart';

class LeanSDK {
  late String _env;
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
    packageInfo,
    customization,
  }) {
    _env = env;
    _version = version;
    _country = country;
    _appToken = appToken;
    _language = language;
    _isSandbox = isSandbox;

    LeanLogger.showLogs = showLogs;

    if (customization != null) {
      _customization = customization;
    }

    _baseUrl =
        "https://cdn.leantech.me/link/loader/prod/$country/latest/lean-sdk.html";
  }

  //  ================    Members and helper methods    ================    //

  String get _getBaseUrl {
    return "$_baseUrl?${Config.implementation.name}=webview-hosted-html$_getImplementationAnalyticsParams&${Config.app_token.name}=$_appToken&${Config.sandbox.name}=$_isSandbox&${Config.language.name}=$_language&${Config.version.name}=$_version&${Config.country.name}=$_country&${Config.env.name}=$_env";
  }

  String get _getImplementationAnalyticsParams {
    final Map<String, dynamic> implementation = {
      "platform": "mobile",
      "sdk": "flutter",
      "os": Platform.operatingSystem.toString(),
      "sdk_version": '3.0.8', // @todo: get this dynamically from pubspec.yaml
      "is_version_pinned": _version != "latest"
    };

    var implementationParams = '';

    implementation.forEach((key, value) => implementationParams =
        "$implementationParams&${Params.implementation_config.name}=$key+$value");

    return implementationParams;
  }

  String _convertPermissionsToURLString(List<LeanPermissions> permissions) {
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

  String _convertCustomizationToURLString() {
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

  connect({
    required String customerId,
    required List<LeanPermissions> permissions,
    String? endUserId,
    String? accessTo,
    String? accessFrom,
    String? bankIdentifier,
    String? failRedirectUrl,
    String? successRedirectUrl,
    String? paymentDestinationId,
    String? accountType,
    String? accessToken,
  }) {
    String permissionsParams = _convertPermissionsToURLString(permissions);
    String customizationParams = _convertCustomizationToURLString();

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

    if (endUserId != null && endUserId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.end_user_id.name}=$endUserId";
    }

    if (accessTo != null && accessTo.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_to.name}=$accessTo";
    }

    if (accessFrom != null && accessFrom.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_from.name}=$accessFrom";
    }

    if (accessToken != null && accessToken.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_token.name}=$accessToken";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url.name}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url.name}=$successRedirectUrl";
    }

    if (accountType != null && accountType.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.account_type.name}=$accountType";
    }

    return initializationURL;
  }

  reconnect({
    required String reconnectId,
    String? accessToken,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.reconnect.name}&${Params.reconnect_id.name}=$reconnectId$customizationParams";

    if (accessToken != null && accessToken.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_token.name}=$accessToken";
    }

    return initializationURL;
  }

  createBeneficiary({
    required String customerId,
    String? paymentSourceId,
    String? accessToken,
    String? failRedirectUrl,
    String? successRedirectUrl,
    String? paymentDestinationId,
    String? entityId,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.createBeneficiary.name}&${Params.customer_id.name}=$customerId$customizationParams";

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_destination_id.name}=$paymentDestinationId";
    }

    if (paymentSourceId != null && paymentSourceId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_source_id.name}=$paymentSourceId";
    }

    if (accessToken != null && accessToken.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_token.name}=$accessToken";
    }

    if (entityId != null && entityId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.entity_id.name}=$entityId";
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
    String? accessToken,
    String? failRedirectUrl,
    String? paymentSourceId,
    String? successRedirectUrl,
    String? paymentDestinationId,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.createPaymentSource.name}&${Params.customer_id.name}=$customerId$customizationParams";

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_destination_id.name}=$paymentDestinationId";
    }

    if (bankIdentifier != null && bankIdentifier.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.bank_identifier.name}=$bankIdentifier";
    }

    if (accessToken != null && accessToken.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_token.name}=$accessToken";
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
    required String paymentSourceId,
    required String paymentDestinationId,
    String? accessToken,
    String? endUserId,
    String? entityId,
    String? failRedirectUrl,
    String? successRedirectUrl,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.updatePaymentSource.name}&${Params.customer_id.name}=$customerId&${Params.payment_source_id.name}=$paymentSourceId&${Params.payment_destination_id.name}=$paymentDestinationId$customizationParams";

    if (endUserId != null && endUserId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.end_user_id.name}=$endUserId";
    }

    if (accessToken != null && accessToken.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_token.name}=$accessToken";
    }

    if (entityId != null && entityId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.entity_id.name}=$entityId";
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
    String? paymentIntentId,
    String? bulkPaymentIntentId,
    String? endUserId,
    String? accessToken,
    String? accountId,
    bool? showBalances,
    String? failRedirectUrl,
    String? successRedirectUrl,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.pay.name}&${Params.payment_intent_id.name}=$paymentIntentId$customizationParams";

    if (bulkPaymentIntentId != null && bulkPaymentIntentId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.bulk_payment_intent_id.name}=$bulkPaymentIntentId";
    }

    if (endUserId != null && endUserId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.end_user_id.name}=$endUserId";
    }

    if (accountId != null && accountId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.account_id.name}=$accountId";
    }

    if (showBalances != null && showBalances == true) {
      initializationURL =
          "$initializationURL&${Params.show_balances.name}=$showBalances";
    }

    if (accessToken != null && accessToken.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_token.name}=$accessToken";
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

  verifyAddress({
    required String customerId,
    required String customerName,
    required List<LeanPermissions> permissions,
    String? accessToken,
  }) {
    String permissionsParams = _convertPermissionsToURLString(permissions);
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.verifyAddress.name}&${Params.customer_id.name}=$customerId&${Params.customer_name.name}=$customerName$permissionsParams$customizationParams";

    // only include properties that are set
    if (accessToken != null && accessToken.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_token.name}=$accessToken";
    }

    return initializationURL;
  }
}
