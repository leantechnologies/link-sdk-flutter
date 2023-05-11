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
  permissions,
  access_from,
  reconnect_id,
  show_balances,
  customization,
  bank_identifier,
  fail_redirect_url,
  payment_intent_id,
  payment_source_id,
  initialization_url,
  success_redirect_url,
  payment_destination_id,
}

enum LeanMethods {
  pay,
  link,
  connect,
  reconnect,
  createBeneficiary,
  createPaymentSource,
  updatePaymentSource,
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
