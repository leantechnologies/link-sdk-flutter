import 'enums.dart';

class Lean {
  late String env;
  late bool showLogs;
  late String baseUrl;
  late String version;
  late String country;
  late bool isSandbox;
  late String appToken;
  late String language;
  late Map<String, String> customization;

  Lean({required Map<String, dynamic> config}) {
    env = config["env"];
    version = config["version"];
    country = config["country"];
    appToken = config["appToken"];
    language = config["language"];
    showLogs = config["showLogs"];
    isSandbox = config["isSandbox"];
    customization = config["customization"];
    baseUrl =
        "https://cdn.leantech.me/link/loader/prod/$country/$version/lean-sdk.html";
  }

  //  ================    Members and helper methods    ================    //

  String getBaseUrl() {
    return "$baseUrl?${Config.implementation}=webview-hosted-html&${Config.app_token}=$appToken&${Config.sandbox}=$isSandbox&${Config.language}=$language&${Config.version}=$version&${Config.country}=$country&${Config.env}=$env";
  }

  String convertPermissionsToURLString(List<UserPermissions> permissions) {
    var permissionsParams = '';

    if (permissions.isEmpty) {
      return permissionsParams;
    }

    for (UserPermissions permission in permissions) {
      permissionsParams =
          "$permissionsParams&${Params.permissions}=$permission";
    }

    return permissionsParams;
  }

  String convertCustomizationToURLString() {
    var customizationParams = '';

    if (customization.isEmpty) {
      return customizationParams;
    }

    for (String customizationOption in customization.keys) {
      customizationParams =
          "$customizationParams&${Params.customization}=$customizationOption+${customization[customizationOption]}";
    }

    return customizationParams;
  }

  //  ================    Link methods    ================    //

  link({
    required String customerId,
    required List<UserPermissions> permissions,
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

    if (permissions.contains(UserPermissions.payments)) {
      throw const FormatException(
        "Validation Error: 'payments' permission is not supported for link",
      );
    }

    if ((permissions.contains(UserPermissions.balance) ||
            permissions.contains(UserPermissions.transactions)) &&
        !permissions.contains(UserPermissions.accounts)) {
      throw const FormatException(
        "Validation Error: Must have 'accounts' permission if requesting 'balance' and/or 'transactions' permission",
      );
    }

    String permissionsParams = convertPermissionsToURLString(permissions);
    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$baseUrl&method=${Methods.link}&${Params.customer_id}=$customerId$permissionsParams$customizationParams";

    // only include properties that are set
    if (bankIdentifier != null && bankIdentifier.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.bank_identifier}=$bankIdentifier";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url}=$successRedirectUrl";
    }

    return initializationURL;
  }

  connect({
    required String customerId,
    required List<UserPermissions> permissions,
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

    if ((permissions.contains(UserPermissions.balance) ||
            permissions.contains(UserPermissions.transactions)) &&
        !permissions.contains(UserPermissions.accounts)) {
      throw const FormatException(
        "Validation Error: Must have 'accounts' permission if requesting 'balance' and/or 'transactions' permission",
      );
    }

    String permissionsParams = convertPermissionsToURLString(permissions);
    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$baseUrl&method=${Methods.connect}&${Params.customer_id}=$customerId$permissionsParams$customizationParams";

    // only include properties that are set
    if (bankIdentifier != null && bankIdentifier.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.bank_identifier}=$bankIdentifier";
    }

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.payment_destination_id}=$paymentDestinationId";
    }

    if (accessTo != null && accessTo.isNotEmpty) {
      initializationURL = "$initializationURL&${Params.access_to}=$accessTo";
    }

    if (accessFrom != null && accessFrom.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.access_from}=$accessFrom";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.fail_redirect_url}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
          "$initializationURL&${Params.success_redirect_url}=$successRedirectUrl";
    }

    return initializationURL;
  }

  reconnect({required String reconnectId}) {
    if (reconnectId.isEmpty) {
      throw const FormatException('Validation Error: reconnectId is required');
    }

    String customizationParams = convertCustomizationToURLString();

    return "$baseUrl&method=${Methods.reconnect}&${Params.reconnect_id}=$reconnectId$customizationParams";
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
        "$baseUrl&method=${Methods.createBeneficiary}&${Params.customer_id}=$customerId$customizationParams";

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.payment_destination_id}=$paymentDestinationId";
    }

    if (paymentSourceId != null && paymentSourceId.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.payment_source_id}=$paymentSourceId";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.fail_redirect_url}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.success_redirect_url}=$successRedirectUrl";
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
        "$baseUrl&method=${Methods.createBeneficiary}&${Params.customer_id}=$customerId$customizationParams";

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.payment_destination_id}=$paymentDestinationId";
    }

    if (bankIdentifier != null && bankIdentifier.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.bank_identifier}=$bankIdentifier";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.fail_redirect_url}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.success_redirect_url}=$successRedirectUrl";
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
        "$baseUrl&method=${Methods.createBeneficiary}&${Params.customer_id}=$customerId$customizationParams";

    if (paymentDestinationId != null && paymentDestinationId.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.payment_destination_id}=$paymentDestinationId";
    }

    if (paymentSourceId != null && paymentSourceId.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.payment_source_id}=$paymentSourceId";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.fail_redirect_url}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.success_redirect_url}=$successRedirectUrl";
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
      throw const FormatException('Validation Error: paymentIntentId is required');
    }

    String customizationParams = convertCustomizationToURLString();

    var initializationURL =
        "$baseUrl&method=${Methods.createBeneficiary}&${Params.payment_intent_id}=$paymentIntentId$customizationParams";

    if (accountId != null && accountId.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.account_id}=$accountId";
    }

    if (showBalances != null && showBalances == true) {
      initializationURL =
      "$initializationURL&${Params.show_balances}=$showBalances";
    }

    if (failRedirectUrl != null && failRedirectUrl.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.fail_redirect_url}=$failRedirectUrl";
    }

    if (successRedirectUrl != null && successRedirectUrl.isNotEmpty) {
      initializationURL =
      "$initializationURL&${Params.success_redirect_url}=$successRedirectUrl";
    }

    return initializationURL;
  }
}
