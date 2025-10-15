// ignore_for_file: constant_identifier_names

enum Config {
  env,
  sandbox,
  version,
  country,
  language,
  app_token,
  show_logs,
  implementation,
}

enum Params {
  access_to,
  account_id,
  customer_id,
  customer_name,
  end_user_id,
  permissions,
  access_from,
  reconnect_id,
  show_balances,
  customization,
  implementation,
  bank_identifier,
  fail_redirect_url,
  payment_intent_id,
  payment_source_id,
  initialization_url,
  success_redirect_url,
  implementation_config,
  payment_destination_id,
  account_type,
  access_token,
  bulk_payment_intent_id,
  entity_id,
  show_consent_explanation,
  destination_alias,
  destination_avatar,
  consent_id,
  consent_attempt_id,
  granular_status_code,
  status_additional_info,
  customer_metadata
}

enum LeanMethods {
  pay,
  link,
  connect,
  reconnect,
  createBeneficiary,
  createPaymentSource,
  updatePaymentSource,
  verifyAddress,
  authorizeConsent,
  checkout,
  manageConsents,
  captureRedirect,
}

enum LeanPermissions {
  balance,
  identity,
  accounts,
  payments,
  transactions,

  // KSA permissions
  identities,
  beneficiaries,
  direct_debits,
  standing_orders,
  scheduled_payments,
}

enum LeanCountry {
  sa,
  ae,
}

enum LeanLanguage {
  en,
  ar,
}

typedef LeanCallback = void Function(LeanResponse response);

typedef LeanActionError = void Function(String errorMessage);

typedef LeanActionCancelled = void Function();

class LeanBankResponse {
  final String? bankId;
  final bool? isSupported;

  LeanBankResponse(this.bankId, this.isSupported);
}

class LeanResponse {
  final String status;
  final String? message;
  final String? lastApiResponse;
  final String? exitPoint;
  final String? secondaryStatus;
  final String? bankId;
  final bool? bankIsSupported;
  final String? exitIntentPoint;
  final String? exitSurveyReason;
  final String? leanCorrelationId;
  final String? userExitIntent;

  LeanResponse({
    required this.status,
    this.bankId,
    this.message,
    this.exitPoint,
    this.bankIsSupported,
    this.lastApiResponse,
    this.secondaryStatus,
    this.exitIntentPoint,
    this.exitSurveyReason,
    this.leanCorrelationId,
    this.userExitIntent,
  });
}
