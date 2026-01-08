// Enums

enum AuthenticationChannel {
  web('WEB'),
  mobile('MOBILE');

  const AuthenticationChannel(this.value);
  final String value;
}

enum PossessionFactorType {
  fido2SecurityKey('FIDO2_SECURITY_KEY'),
  passkey('PASSKEY'),
  otpDevice('OTP_DEVICE'),
  otpApp('OTP_APP'),
  smsOtp('SMS_OTP'),
  emailOtp('EMAIL_OTP'),
  pushNotification('PUSH_NOTIFICATION'),
  webauthnToken('WEBAUTHN_TOKEN'),
  secureEnclaveKey('SECURE_ENCLAVE_KEY'),
  hardwareOtpKey('HARDWARE_OTP_KEY'),
  trustedDevice('TRUSTED_DEVICE'),
  other('OTHER');

  const PossessionFactorType(this.value);
  final String value;
}

enum KnowledgeFactorType {
  pin('PIN'),
  password('PASSWORD'),
  securityQuestion('SECURITY_QUESTION'),
  smsOtp('SMS_OTP'),
  emailOtp('EMAIL_OTP'),
  otpPush('OTP_PUSH'),
  other('OTHER');

  const KnowledgeFactorType(this.value);
  final String value;
}

enum InherenceFactorType {
  biometric('BIOMETRIC'),
  fingerprint('FINGERPRINT'),
  faceRecognition('FACE_RECOGNITION'),
  irisScan('IRIS_SCAN'),
  voiceRecognition('VOICE_RECOGNITION'),
  fidoBiometric('FIDO_BIOMETRIC'),
  deviceBiometrics('DEVICE_BIOMETRICS'),
  other('OTHER');

  const InherenceFactorType(this.value);
  final String value;
}

enum ChallengeOutcome {
  pass('PASS'),
  fail('FAIL'),
  notPerformed('NOT_PERFORMED');

  const ChallengeOutcome(this.value);
  final String value;
}

enum AuthenticationFlow {
  mfa('MFA'),
  other('OTHER');

  const AuthenticationFlow(this.value);
  final String value;
}

enum DeviceType {
  mobile('MOBILE'),
  desktop('DESKTOP'),
  tablet('TABLET'),
  wearable('WEARABLE'),
  other('OTHER');

  const DeviceType(this.value);
  final String value;
}

enum ConnectionType {
  wifi('WIFI'),
  cellular('CELLULAR'),
  other('OTHER');

  const ConnectionType(this.value);
  final String value;
}

enum ScreenOrientation {
  portrait('PORTRAIT'),
  landscape('LANDSCAPE');

  const ScreenOrientation(this.value);
  final String value;
}

enum BindingStatus {
  active('ACTIVE'),
  expired('EXPIRED'),
  revoked('REVOKED'),
  suspended('SUSPENDED');

  const BindingStatus(this.value);
  final String value;
}

enum BiometricType {
  fingerprint('FINGERPRINT'),
  facialRecognition('FACIAL_RECOGNITION'),
  iris('IRIS'),
  voicePrint('VOICE_PRINT'),
  other('OTHER');

  const BiometricType(this.value);
  final String value;
}

enum MotionSensorStatus {
  inMotion('IN_MOTION'),
  stationary('STATIONARY');

  const MotionSensorStatus(this.value);
  final String value;
}

enum DeviceEnvironmentContext {
  vpnDetected('VPN_DETECTED'),
  emulatorDetected('EMULATOR_DETECTED');

  const DeviceEnvironmentContext(this.value);
  final String value;
}

enum ScrollDirection {
  up('UP'),
  down('DOWN'),
  both('BOTH');

  const ScrollDirection(this.value);
  final String value;
}

enum SuspiciousActivity {
  noSuspiciousActivity('NO_SUSPICIOUS_ACTIVITY'),
  suspiciousActivityDetected('SUSPICIOUS_ACTIVITY_DETECTED');

  const SuspiciousActivity(this.value);
  final String value;
}

enum RecipientType {
  individual('INDIVIDUAL'),
  corporate('CORPORATE');

  const RecipientType(this.value);
  final String value;
}

enum AddressType {
  business('BUSINESS'),
  correspondence('CORRESPONDENCE'),
  residential('RESIDENTIAL');

  const AddressType(this.value);
  final String value;
}

enum Channel {
  web('WEB'),
  mobile('MOBILE');

  const Channel(this.value);
  final String value;
}

enum ChannelType {
  ecommerce('ECOMMERCE'),
  inStore('IN_STORE'),
  inApp('IN_APP'),
  telephone('TELEPHONE'),
  mail('MAIL'),
  recurringPayment('RECURRING_PAYMENT'),
  other('OTHER');

  const ChannelType(this.value);
  final String value;
}

enum SubChannelType {
  webBrowser('WEB_BROWSER'),
  mobileApp('MOBILE_APP'),
  smartTv('SMART_TV'),
  wearableDevice('WEARABLE_DEVICE'),
  posTerminal('POS_TERMINAL'),
  atm('ATM'),
  kioskTerminal('KIOSK_TERMINAL'),
  other('OTHER');

  const SubChannelType(this.value);
  final String value;
}

enum DeliveryTimeframe {
  electronicDelivery('ELECTRONIC_DELIVERY'),
  sameDayShipping('SAME_DAY_SHIPPING'),
  overnightShipping('OVERNIGHT_SHIPPING'),
  moreThan1DayShipping('MORE_THAN_1_DAY_SHIPPING');

  const DeliveryTimeframe(this.value);
  final String value;
}

enum ReorderItemsIndicator {
  firstTimeOrder('FIRST_TIME_ORDER'),
  reorder('REORDER');

  const ReorderItemsIndicator(this.value);
  final String value;
}

enum PreOrderPurchaseIndicator {
  merchandiseAvailable('MERCHANDISE_AVAILABLE'),
  futureAvailability('FUTURE_AVAILABILITY');

  const PreOrderPurchaseIndicator(this.value);
  final String value;
}

enum AddressMatchLevel {
  fullMatch('FULL_MATCH'),
  partialMatch('PARTIAL_MATCH'),
  noMatch('NO_MATCH'),
  notApplicable('NOT_APPLICABLE');

  const AddressMatchLevel(this.value);
  final String value;
}

// Model classes

class PossessionFactor {
  const PossessionFactor({
    this.isUsed,
    this.type,
  });

  final bool? isUsed;
  final PossessionFactorType? type;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (isUsed != null) json['is_used'] = isUsed;
    if (type != null) json['type'] = type!.value;
    return json;
  }
}

class KnowledgeFactor {
  const KnowledgeFactor({
    this.isUsed,
    this.type,
  });

  final bool? isUsed;
  final KnowledgeFactorType? type;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (isUsed != null) json['is_used'] = isUsed;
    if (type != null) json['type'] = type!.value;
    return json;
  }
}

class InherenceFactor {
  const InherenceFactor({
    this.isUsed,
    this.type,
  });

  final bool? isUsed;
  final InherenceFactorType? type;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (isUsed != null) json['is_used'] = isUsed;
    if (type != null) json['type'] = type!.value;
    return json;
  }
}

class Authentication {
  const Authentication({
    this.authenticationChannel,
    this.possessionFactor,
    this.knowledgeFactor,
    this.inherenceFactor,
    this.challengeOutcome,
    this.authenticationFlow,
    this.authenticationValue,
    this.challengeDateTime,
  });

  final AuthenticationChannel? authenticationChannel;
  final PossessionFactor? possessionFactor;
  final KnowledgeFactor? knowledgeFactor;
  final InherenceFactor? inherenceFactor;
  final ChallengeOutcome? challengeOutcome;
  final AuthenticationFlow? authenticationFlow;
  final String? authenticationValue;
  final String? challengeDateTime;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (authenticationChannel != null) {
      json['authentication_channel'] = authenticationChannel!.value;
    }
    if (possessionFactor != null) {
      json['possession_factor'] = possessionFactor!.toJson();
    }
    if (knowledgeFactor != null) {
      json['knowledge_factor'] = knowledgeFactor!.toJson();
    }
    if (inherenceFactor != null) {
      json['inherence_factor'] = inherenceFactor!.toJson();
    }
    if (challengeOutcome != null) {
      json['challenge_outcome'] = challengeOutcome!.value;
    }
    if (authenticationFlow != null) {
      json['authentication_flow'] = authenticationFlow!.value;
    }
    if (authenticationValue != null) {
      json['authentication_value'] = authenticationValue;
    }
    if (challengeDateTime != null) {
      json['challenge_date_time'] = challengeDateTime;
    }
    return json;
  }
}

class LocalizedName {
  const LocalizedName({
    this.en,
    this.ar,
  });

  final String? en;
  final String? ar;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (en != null) json['en'] = en;
    if (ar != null) json['ar'] = ar;
    return json;
  }
}

class GeoLocation {
  const GeoLocation({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class DeviceManufacturer {
  const DeviceManufacturer({
    this.model,
    this.manufacturer,
  });

  final String? model;
  final String? manufacturer;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (model != null) json['model'] = model;
    if (manufacturer != null) json['manufacturer'] = manufacturer;
    return json;
  }
}

class ScreenInformation {
  const ScreenInformation({
    this.pixelDensity,
    this.orientation,
  });

  final double? pixelDensity;
  final ScreenOrientation? orientation;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (pixelDensity != null) json['pixel_density'] = pixelDensity;
    if (orientation != null) {
      json['orientation'] = orientation!.value;
    }
    return json;
  }
}

class BatteryStatus {
  const BatteryStatus({
    this.level,
    this.isCharging,
  });

  final double? level;
  final bool? isCharging;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (level != null) json['level'] = level;
    if (isCharging != null) json['is_charging'] = isCharging;
    return json;
  }
}

class TouchSupport {
  const TouchSupport({
    this.supported,
    this.maxTouchPoints,
  });

  final bool? supported;
  final int? maxTouchPoints;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (supported != null) json['supported'] = supported;
    if (maxTouchPoints != null) json['max_touch_points'] = maxTouchPoints;
    return json;
  }
}

class MotionSensors {
  const MotionSensors({
    this.status,
    this.accelerometer,
    this.gyroscope,
  });

  final MotionSensorStatus? status;
  final bool? accelerometer;
  final bool? gyroscope;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (status != null) json['status'] = status!.value;
    if (accelerometer != null) json['accelerometer'] = accelerometer;
    if (gyroscope != null) json['gyroscope'] = gyroscope;
    return json;
  }
}

class DeviceInformation {
  const DeviceInformation({
    this.deviceId,
    this.alternativeDeviceId,
    this.deviceOperatingSystem,
    this.deviceOperatingSystemVersion,
    this.deviceBindingId,
    this.lastBindingDateTime,
    this.bindingDuration,
    this.bindingStatus,
    this.deviceType,
    this.deviceManufacturer,
    this.deviceLanguage,
    this.deviceLocalDateTime,
    this.connectionType,
    this.screenInformation,
    this.batteryStatus,
    this.touchSupport,
    this.motionSensors,
    this.deviceEnvironmentContext,
  });

  final String? deviceId;
  final String? alternativeDeviceId;
  final String? deviceOperatingSystem;
  final String? deviceOperatingSystemVersion;
  final String? deviceBindingId;
  final String? lastBindingDateTime;
  final String? bindingDuration;
  final BindingStatus? bindingStatus;
  final DeviceType? deviceType;
  final DeviceManufacturer? deviceManufacturer;
  final String? deviceLanguage;
  final String? deviceLocalDateTime;
  final ConnectionType? connectionType;
  final ScreenInformation? screenInformation;
  final BatteryStatus? batteryStatus;
  final TouchSupport? touchSupport;
  final MotionSensors? motionSensors;
  final List<DeviceEnvironmentContext>? deviceEnvironmentContext;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (deviceId != null) json['device_id'] = deviceId;
    if (alternativeDeviceId != null) {
      json['alternative_device_id'] = alternativeDeviceId;
    }
    if (deviceOperatingSystem != null) {
      json['device_operating_system'] = deviceOperatingSystem;
    }
    if (deviceOperatingSystemVersion != null) {
      json['device_operating_system_version'] = deviceOperatingSystemVersion;
    }
    if (deviceBindingId != null) json['device_binding_id'] = deviceBindingId;
    if (lastBindingDateTime != null) {
      json['last_binding_date_time'] = lastBindingDateTime;
    }
    if (bindingDuration != null) json['binding_duration'] = bindingDuration;
    if (bindingStatus != null) {
      json['binding_status'] = bindingStatus!.value;
    }
    if (deviceType != null) {
      json['device_type'] = deviceType!.value;
    }
    if (deviceManufacturer != null) {
      json['device_manufacturer'] = deviceManufacturer!.toJson();
    }
    if (deviceLanguage != null) json['device_language'] = deviceLanguage;
    if (deviceLocalDateTime != null) {
      json['device_local_date_time'] = deviceLocalDateTime;
    }
    if (connectionType != null) {
      json['connection_type'] = connectionType!.value;
    }
    if (screenInformation != null) {
      json['screen_information'] = screenInformation!.toJson();
    }
    if (batteryStatus != null) json['battery_status'] = batteryStatus!.toJson();
    if (touchSupport != null) json['touch_support'] = touchSupport!.toJson();
    if (motionSensors != null) json['motion_sensors'] = motionSensors!.toJson();
    if (deviceEnvironmentContext != null) {
      json['device_environment_context'] =
          deviceEnvironmentContext!.map((e) => e.value).toList();
    }
    return json;
  }
}

class BiometricCapabilities {
  const BiometricCapabilities({
    this.supportsBiometric,
    this.biometricTypes,
  });

  final bool? supportsBiometric;
  final List<BiometricType>? biometricTypes;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (supportsBiometric != null) {
      json['supports_biometric'] = supportsBiometric;
    }
    if (biometricTypes != null) {
      json['biometric_types'] = biometricTypes!.map((e) => e.value).toList();
    }
    return json;
  }
}

class AppInformation {
  const AppInformation({
    this.appVersion,
    this.packageName,
    this.buildNumber,
  });

  final String? appVersion;
  final String? packageName;
  final String? buildNumber;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (appVersion != null) json['app_version'] = appVersion;
    if (packageName != null) json['package_name'] = packageName;
    if (buildNumber != null) json['build_number'] = buildNumber;
    return json;
  }
}

class ScrollBehavior {
  const ScrollBehavior({
    this.direction,
    this.speed,
    this.frequency,
  });

  final ScrollDirection? direction;
  final double? speed;
  final double? frequency;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (direction != null) {
      json['direction'] = direction!.value;
    }
    if (speed != null) json['speed'] = speed;
    if (frequency != null) json['frequency'] = frequency;
    return json;
  }
}

class UserBehavior {
  const UserBehavior({
    this.scrollBehavior,
  });

  final ScrollBehavior? scrollBehavior;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (scrollBehavior != null) {
      json['scroll_behavior'] = scrollBehavior!.toJson();
    }
    return json;
  }
}

class TransactionHistory {
  const TransactionHistory({
    this.lastDay,
    this.lastYear,
  });

  final int? lastDay;
  final int? lastYear;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (lastDay != null) json['last_day'] = lastDay;
    if (lastYear != null) json['last_year'] = lastYear;
    return json;
  }
}

class AccountRiskIndicators {
  const AccountRiskIndicators({
    this.userOnboardingDateTime,
    this.lastAccountChangeDate,
    this.lastPasswordChangeDate,
    this.suspiciousActivity,
    this.transactionHistory,
  });

  final String? userOnboardingDateTime;
  final String? lastAccountChangeDate;
  final String? lastPasswordChangeDate;
  final SuspiciousActivity? suspiciousActivity;
  final TransactionHistory? transactionHistory;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (userOnboardingDateTime != null) {
      json['user_onboarding_date_time'] = userOnboardingDateTime;
    }
    if (lastAccountChangeDate != null) {
      json['last_account_change_date'] = lastAccountChangeDate;
    }
    if (lastPasswordChangeDate != null) {
      json['last_password_change_date'] = lastPasswordChangeDate;
    }
    if (suspiciousActivity != null) {
      json['suspicious_activity'] = suspiciousActivity!.value;
    }
    if (transactionHistory != null) {
      json['transaction_history'] = transactionHistory!.toJson();
    }
    return json;
  }
}

class DebtorIndicators {
  const DebtorIndicators({
    this.authentication,
    this.userName,
    this.geoLocation,
    this.deviceInformation,
    this.biometricCapabilities,
    this.appInformation,
    this.userBehavior,
    this.accountRiskIndicators,
    this.supplementaryData,
  });

  final Authentication? authentication;
  final LocalizedName? userName;
  final GeoLocation? geoLocation;
  final DeviceInformation? deviceInformation;
  final BiometricCapabilities? biometricCapabilities;
  final AppInformation? appInformation;
  final UserBehavior? userBehavior;
  final AccountRiskIndicators? accountRiskIndicators;
  final Map<String, dynamic>? supplementaryData;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (authentication != null) {
      json['authentication'] = authentication!.toJson();
    }
    if (userName != null) json['user_name'] = userName!.toJson();
    if (geoLocation != null) json['geo_location'] = geoLocation!.toJson();
    if (deviceInformation != null) {
      json['device_information'] = deviceInformation!.toJson();
    }
    if (biometricCapabilities != null) {
      json['biometric_capabilities'] = biometricCapabilities!.toJson();
    }
    if (appInformation != null) {
      json['app_information'] = appInformation!.toJson();
    }
    if (userBehavior != null) json['user_behavior'] = userBehavior!.toJson();
    if (accountRiskIndicators != null) {
      json['account_risk_indicators'] = accountRiskIndicators!.toJson();
    }
    if (supplementaryData != null) {
      json['supplementary_data'] = supplementaryData;
    }
    return json;
  }
}

class NationalAddress {
  const NationalAddress({
    this.addressType,
    this.addressLine,
    this.buildingNumber,
    this.buildingName,
    this.floor,
    this.streetName,
    this.districtName,
    this.postBox,
    this.townName,
    this.region,
    this.country,
  });

  final AddressType? addressType;
  final String? addressLine;
  final String? buildingNumber;
  final String? buildingName;
  final String? floor;
  final String? streetName;
  final String? districtName;
  final String? postBox;
  final String? townName;
  final String? region;
  final String? country;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (addressType != null) {
      json['address_type'] = addressType!.value;
    }
    if (addressLine != null) json['address_line'] = addressLine;
    if (buildingNumber != null) json['building_number'] = buildingNumber;
    if (buildingName != null) json['building_name'] = buildingName;
    if (floor != null) json['floor'] = floor;
    if (streetName != null) json['street_name'] = streetName;
    if (districtName != null) json['district_name'] = districtName;
    if (postBox != null) json['post_box'] = postBox;
    if (townName != null) json['town_name'] = townName;
    if (region != null) json['region'] = region;
    if (country != null) json['country'] = country;
    return json;
  }
}

class DestinationDeliveryAddress {
  const DestinationDeliveryAddress({
    this.recipientType,
    this.recipientName,
    this.nationalAddress,
  });

  final RecipientType? recipientType;
  final LocalizedName? recipientName;
  final List<NationalAddress>? nationalAddress;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (recipientType != null) {
      json['recipient_type'] = recipientType!.value;
    }
    if (recipientName != null) json['recipient_name'] = recipientName!.toJson();
    if (nationalAddress != null) {
      json['national_address'] =
          nationalAddress!.map((e) => e.toJson()).toList();
    }
    return json;
  }
}

class MerchantRisk {
  const MerchantRisk({
    this.deliveryTimeframe,
    this.reorderItemsIndicator,
    this.preOrderPurchaseIndicator,
    this.isGiftCardPurchase,
    this.isDeliveryAddressMatchesBilling,
    this.addressMatchLevel,
  });

  final DeliveryTimeframe? deliveryTimeframe;
  final ReorderItemsIndicator? reorderItemsIndicator;
  final PreOrderPurchaseIndicator? preOrderPurchaseIndicator;
  final bool? isGiftCardPurchase;
  final bool? isDeliveryAddressMatchesBilling;
  final AddressMatchLevel? addressMatchLevel;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (deliveryTimeframe != null) {
      json['delivery_timeframe'] = deliveryTimeframe!.value;
    }
    if (reorderItemsIndicator != null) {
      json['reorder_items_indicator'] = reorderItemsIndicator!.value;
    }
    if (preOrderPurchaseIndicator != null) {
      json['pre_order_purchase_indicator'] = preOrderPurchaseIndicator!.value;
    }
    if (isGiftCardPurchase != null) {
      json['is_gift_card_purchase'] = isGiftCardPurchase;
    }
    if (isDeliveryAddressMatchesBilling != null) {
      json['is_delivery_address_matches_billing'] =
          isDeliveryAddressMatchesBilling;
    }
    if (addressMatchLevel != null) {
      json['address_match_level'] = addressMatchLevel!.value;
    }
    return json;
  }
}

class TransactionIndicators {
  const TransactionIndicators({
    this.isCustomerPresent,
    this.isContractPresent,
    this.channel,
    this.channelType,
    this.subChannelType,
    this.merchantRisk,
    this.supplementaryData,
  });

  final bool? isCustomerPresent;
  final bool? isContractPresent;
  final Channel? channel;
  final ChannelType? channelType;
  final SubChannelType? subChannelType;
  final MerchantRisk? merchantRisk;
  final Map<String, dynamic>? supplementaryData;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (isCustomerPresent != null) {
      json['is_customer_present'] = isCustomerPresent;
    }
    if (isContractPresent != null) {
      json['is_contract_present'] = isContractPresent;
    }
    if (channel != null) json['channel'] = channel!.value;
    if (channelType != null) {
      json['channel_type'] = channelType!.value;
    }
    if (subChannelType != null) {
      json['sub_channel_type'] = subChannelType!.value;
    }
    if (merchantRisk != null) json['merchant_risk'] = merchantRisk!.toJson();
    if (supplementaryData != null) {
      json['supplementary_data'] = supplementaryData;
    }
    return json;
  }
}

class PaymentProcess {
  const PaymentProcess({
    this.totalDuration,
    this.currentSessionAttempts,
    this.currentSessionFailedAttempts,
    this.last24HourAttempts,
    this.last24HourFailedAttempts,
  });

  final int? totalDuration;
  final int? currentSessionAttempts;
  final int? currentSessionFailedAttempts;
  final int? last24HourAttempts;
  final int? last24HourFailedAttempts;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (totalDuration != null) json['total_duration'] = totalDuration;
    if (currentSessionAttempts != null) {
      json['current_session_attempts'] = currentSessionAttempts;
    }
    if (currentSessionFailedAttempts != null) {
      json['current_session_failed_attempts'] = currentSessionFailedAttempts;
    }
    if (last24HourAttempts != null) {
      json['last24_hour_attempts'] = last24HourAttempts;
    }
    if (last24HourFailedAttempts != null) {
      json['last24_hour_failed_attempts'] = last24HourFailedAttempts;
    }
    return json;
  }
}

class RiskDetails {
  const RiskDetails({
    this.debtorIndicators,
    this.destinationDeliveryAddress,
    this.transactionIndicators,
    this.paymentProcess,
  });

  final DebtorIndicators? debtorIndicators;
  final DestinationDeliveryAddress? destinationDeliveryAddress;
  final TransactionIndicators? transactionIndicators;
  final PaymentProcess? paymentProcess;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (debtorIndicators != null) {
      json['debtor_indicators'] = debtorIndicators!.toJson();
    }
    if (destinationDeliveryAddress != null) {
      json['destination_delivery_address'] =
          destinationDeliveryAddress!.toJson();
    }
    if (transactionIndicators != null) {
      json['transaction_indicators'] = transactionIndicators!.toJson();
    }
    if (paymentProcess != null) {
      json['payment_process'] = paymentProcess!.toJson();
    }
    return json;
  }
}
