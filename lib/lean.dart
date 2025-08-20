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
      "sdk_version": '3.0.9', // @todo: get this dynamically from pubspec.yaml
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

  String _appendOptionalConfigToURLParams(
    String url,
    Map<String, Object?> optionalParams,
  ) {
    var result = url;
    optionalParams.forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        result = "$result&$key=${value.toString()}";
      }
    });
    return result;
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
    bool? showConsentExplanation,
    String? destinationAlias,
    String? destinationAvatar,
  }) {
    String permissionsParams = _convertPermissionsToURLString(permissions);
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.connect.name}&${Params.customer_id.name}=$customerId$permissionsParams$customizationParams";

    final optionalParams = {
      Params.bank_identifier.name: bankIdentifier,
      Params.payment_destination_id.name: paymentDestinationId,
      Params.end_user_id.name: endUserId,
      Params.access_to.name: accessTo,
      Params.access_from.name: accessFrom,
      Params.access_token.name: accessToken,
      Params.fail_redirect_url.name: failRedirectUrl,
      Params.success_redirect_url.name: successRedirectUrl,
      Params.account_type.name: accountType,
      Params.show_consent_explanation.name: showConsentExplanation,
      Params.destination_alias.name: destinationAlias,
      Params.destination_avatar.name: destinationAvatar,
    };

    initializationURL = _appendOptionalConfigToURLParams(
      initializationURL,
      optionalParams,
    );

    return initializationURL;
  }

  reconnect({
    required String reconnectId,
    String? accessToken,
    String? destinationAlias,
    String? destinationAvatar,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.reconnect.name}&${Params.reconnect_id.name}=$reconnectId$customizationParams";

    final optionalParams = {
      Params.access_token.name: accessToken,
      Params.destination_alias.name: destinationAlias,
      Params.destination_avatar.name: destinationAvatar,
    };

    initializationURL = _appendOptionalConfigToURLParams(
      initializationURL,
      optionalParams,
    );

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
    String? destinationAlias,
    String? destinationAvatar,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.createBeneficiary.name}&${Params.customer_id.name}=$customerId$customizationParams";

    final optionalParams = {
      Params.payment_source_id.name: paymentSourceId,
      Params.access_token.name: accessToken,
      Params.fail_redirect_url.name: failRedirectUrl,
      Params.success_redirect_url.name: successRedirectUrl,
      Params.payment_destination_id.name: paymentDestinationId,
      Params.entity_id.name: entityId,
      Params.destination_alias.name: destinationAlias,
      Params.destination_avatar.name: destinationAvatar,
    };

    initializationURL = _appendOptionalConfigToURLParams(
      initializationURL,
      optionalParams,
    );

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
    String? destinationAlias,
    String? destinationAvatar,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.createPaymentSource.name}&${Params.customer_id.name}=$customerId$customizationParams";

    final optionalParams = {
      Params.payment_destination_id.name: paymentDestinationId,
      Params.bank_identifier.name: bankIdentifier,
      Params.access_token.name: accessToken,
      Params.fail_redirect_url.name: failRedirectUrl,
      Params.success_redirect_url.name: successRedirectUrl,
      Params.destination_alias.name: destinationAlias,
      Params.destination_avatar.name: destinationAvatar,
    };

    initializationURL = _appendOptionalConfigToURLParams(
      initializationURL,
      optionalParams,
    );

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
    String? destinationAlias,
    String? destinationAvatar,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.updatePaymentSource.name}&${Params.customer_id.name}=$customerId&${Params.payment_source_id.name}=$paymentSourceId&${Params.payment_destination_id.name}=$paymentDestinationId$customizationParams";

    final optionalParams = {
      Params.end_user_id.name: endUserId,
      Params.access_token.name: accessToken,
      Params.entity_id.name: entityId,
      Params.fail_redirect_url.name: failRedirectUrl,
      Params.success_redirect_url.name: successRedirectUrl,
      Params.destination_alias.name: destinationAlias,
      Params.destination_avatar.name: destinationAvatar,
    };

    initializationURL = _appendOptionalConfigToURLParams(
      initializationURL,
      optionalParams,
    );

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
    String? destinationAlias,
    String? destinationAvatar,
  }) {
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.pay.name}&${Params.payment_intent_id.name}=$paymentIntentId$customizationParams";

    final optionalParams = {
      Params.bulk_payment_intent_id.name: bulkPaymentIntentId,
      Params.end_user_id.name: endUserId,
      Params.account_id.name: accountId,
      Params.show_balances.name: showBalances,
      Params.access_token.name: accessToken,
      Params.fail_redirect_url.name: failRedirectUrl,
      Params.success_redirect_url.name: successRedirectUrl,
      Params.destination_alias.name: destinationAlias,
      Params.destination_avatar.name: destinationAvatar,
    };

    initializationURL = _appendOptionalConfigToURLParams(
      initializationURL,
      optionalParams,
    );

    return initializationURL;
  }

  verifyAddress({
    required String customerId,
    required String customerName,
    required List<LeanPermissions> permissions,
    String? accessToken,
    String? destinationAlias,
    String? destinationAvatar,
  }) {
    String permissionsParams = _convertPermissionsToURLString(permissions);
    String customizationParams = _convertCustomizationToURLString();

    var initializationURL =
        "$_getBaseUrl&method=${LeanMethods.verifyAddress.name}&${Params.customer_id.name}=$customerId&${Params.customer_name.name}=$customerName$permissionsParams$customizationParams";

    final optionalParams = {
      Params.access_token.name: accessToken,
      Params.destination_alias.name: destinationAlias,
      Params.destination_avatar.name: destinationAvatar,
    };

    initializationURL = _appendOptionalConfigToURLParams(
      initializationURL,
      optionalParams,
    );

    return initializationURL;
  }
}
