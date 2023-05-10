enum Config {
  env,
  sandbox,
  version,
  country,
  language,
  app_token,
  implementation,
  show_logs,
}

class Lean {
  late String env;
  late String version;
  late String country;
  late String appToken;
  late String language;
  late bool showLogs;
  late bool isSandbox;
  late String customization;
  late String baseUrl;

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

  String convertPermissionsToURLString(List<String> permissions) {
    return '';
  }

  String convertCustomizationToURLString() {
    return '';
  }

  //  ================    Link methods    ================    //

  link({
    customer_id,
    permissions,
    bank_identifier,
    fail_redirect_url,
    success_redirect_url,
  }) {}

  connect({
    accessTo,
    accessFrom,
    permissions,
    customer_id,
    bank_identifier,
    fail_redirect_url,
    success_redirect_url,
    payment_destination_id,
  }) {}

  reconnect({reconnect_id}) {}

  createBeneficiary({
    customer_id,
    payment_source_id,
    fail_redirect_url,
    success_redirect_url,
    payment_destination_id,
  }) {}

  createPaymentSource({
    customer_id,
    bank_identifier,
    fail_redirect_url,
    success_redirect_url,
    payment_destination_id,
  }) {}

  updatePaymentSource({
    customer_id,
    payment_source_id,
    fail_redirect_url,
    success_redirect_url,
    payment_destination_id,
  }) {}

  pay({
    account_id,
    show_balances,
    fail_redirect_url,
    payment_intent_id,
    success_redirect_url,
  }) {}
}
