// Enums

enum AuthenticationChannel {
  web,
  mobile,
}

enum PossessionFactorType {
  fido2SecurityKey,
  passkey,
  otpDevice,
  otpApp,
  smsOtp,
  emailOtp,
  pushNotification,
  webauthnToken,
  secureEnclaveKey,
  hardwareOtpKey,
  trustedDevice,
  other,
}

enum KnowledgeFactorType {
  pin,
  password,
  securityQuestion,
  smsOtp,
  emailOtp,
  otpPush,
  other,
}

enum InherenceFactorType {
  biometric,
  fingerprint,
  faceRecognition,
  irisScan,
  voiceRecognition,
  fidoBiometric,
  deviceBiometrics,
  other,
}

enum ChallengeOutcome {
  pass,
  fail,
  notPerformed,
}

enum AuthenticationFlow {
  mfa,
  other,
}

enum DeviceType {
  mobile,
  desktop,
  tablet,
  wearable,
  other,
}

enum ConnectionType {
  wifi,
  cellular,
  other,
}

enum ScreenOrientation {
  portrait,
  landscape,
}

enum BindingStatus {
  active,
  expired,
  revoked,
  suspended,
}

enum BiometricType {
  fingerprint,
  facialRecognition,
  iris,
  voicePrint,
  other,
}

enum MotionSensorStatus {
  inMotion,
  stationary,
}

enum DeviceEnvironmentContext {
  vpnDetected,
  emulatorDetected,
}

enum ScrollDirection {
  up,
  down,
  both,
}

enum SuspiciousActivity {
  noSuspiciousActivity,
  suspiciousActivityDetected,
}

enum RecipientType {
  individual,
  corporate,
}

enum AddressType {
  business,
  correspondence,
  residential,
}

enum Channel {
  web,
  mobile,
}

enum ChannelType {
  ecommerce,
  inStore,
  inApp,
  telephone,
  mail,
  recurringPayment,
  other,
}

enum SubChannelType {
  webBrowser,
  mobileApp,
  smartTv,
  wearableDevice,
  posTerminal,
  atm,
  kioskTerminal,
  other,
}

enum DeliveryTimeframe {
  electronicDelivery,
  sameDayShipping,
  overnightShipping,
  moreThan1DayShipping,
}

enum ReorderItemsIndicator {
  firstTimeOrder,
  reorder,
}

enum PreOrderPurchaseIndicator {
  merchandiseAvailable,
  futureAvailability,
}

enum AddressMatchLevel {
  fullMatch,
  partialMatch,
  noMatch,
  notApplicable,
}

// Enum to JSON converters
String _authenticationChannelToJson(AuthenticationChannel value) {
  switch (value) {
    case AuthenticationChannel.web:
      return 'WEB';
    case AuthenticationChannel.mobile:
      return 'MOBILE';
  }
}

String _possessionFactorTypeToJson(PossessionFactorType value) {
  switch (value) {
    case PossessionFactorType.fido2SecurityKey:
      return 'FIDO2_SECURITY_KEY';
    case PossessionFactorType.passkey:
      return 'PASSKEY';
    case PossessionFactorType.otpDevice:
      return 'OTP_DEVICE';
    case PossessionFactorType.otpApp:
      return 'OTP_APP';
    case PossessionFactorType.smsOtp:
      return 'SMS_OTP';
    case PossessionFactorType.emailOtp:
      return 'EMAIL_OTP';
    case PossessionFactorType.pushNotification:
      return 'PUSH_NOTIFICATION';
    case PossessionFactorType.webauthnToken:
      return 'WEBAUTHN_TOKEN';
    case PossessionFactorType.secureEnclaveKey:
      return 'SECURE_ENCLAVE_KEY';
    case PossessionFactorType.hardwareOtpKey:
      return 'HARDWARE_OTP_KEY';
    case PossessionFactorType.trustedDevice:
      return 'TRUSTED_DEVICE';
    case PossessionFactorType.other:
      return 'OTHER';
  }
}

String _knowledgeFactorTypeToJson(KnowledgeFactorType value) {
  switch (value) {
    case KnowledgeFactorType.pin:
      return 'PIN';
    case KnowledgeFactorType.password:
      return 'PASSWORD';
    case KnowledgeFactorType.securityQuestion:
      return 'SECURITY_QUESTION';
    case KnowledgeFactorType.smsOtp:
      return 'SMS_OTP';
    case KnowledgeFactorType.emailOtp:
      return 'EMAIL_OTP';
    case KnowledgeFactorType.otpPush:
      return 'OTP_PUSH';
    case KnowledgeFactorType.other:
      return 'OTHER';
  }
}

String _inherenceFactorTypeToJson(InherenceFactorType value) {
  switch (value) {
    case InherenceFactorType.biometric:
      return 'BIOMETRIC';
    case InherenceFactorType.fingerprint:
      return 'FINGERPRINT';
    case InherenceFactorType.faceRecognition:
      return 'FACE_RECOGNITION';
    case InherenceFactorType.irisScan:
      return 'IRIS_SCAN';
    case InherenceFactorType.voiceRecognition:
      return 'VOICE_RECOGNITION';
    case InherenceFactorType.fidoBiometric:
      return 'FIDO_BIOMETRIC';
    case InherenceFactorType.deviceBiometrics:
      return 'DEVICE_BIOMETRICS';
    case InherenceFactorType.other:
      return 'OTHER';
  }
}

String _challengeOutcomeToJson(ChallengeOutcome value) {
  switch (value) {
    case ChallengeOutcome.pass:
      return 'PASS';
    case ChallengeOutcome.fail:
      return 'FAIL';
    case ChallengeOutcome.notPerformed:
      return 'NOT_PERFORMED';
  }
}

String _authenticationFlowToJson(AuthenticationFlow value) {
  switch (value) {
    case AuthenticationFlow.mfa:
      return 'MFA';
    case AuthenticationFlow.other:
      return 'OTHER';
  }
}

String _deviceTypeToJson(DeviceType value) {
  switch (value) {
    case DeviceType.mobile:
      return 'MOBILE';
    case DeviceType.desktop:
      return 'DESKTOP';
    case DeviceType.tablet:
      return 'TABLET';
    case DeviceType.wearable:
      return 'WEARABLE';
    case DeviceType.other:
      return 'OTHER';
  }
}

String _connectionTypeToJson(ConnectionType value) {
  switch (value) {
    case ConnectionType.wifi:
      return 'WIFI';
    case ConnectionType.cellular:
      return 'CELLULAR';
    case ConnectionType.other:
      return 'OTHER';
  }
}

String _screenOrientationToJson(ScreenOrientation value) {
  switch (value) {
    case ScreenOrientation.portrait:
      return 'PORTRAIT';
    case ScreenOrientation.landscape:
      return 'LANDSCAPE';
  }
}

String _bindingStatusToJson(BindingStatus value) {
  switch (value) {
    case BindingStatus.active:
      return 'ACTIVE';
    case BindingStatus.expired:
      return 'EXPIRED';
    case BindingStatus.revoked:
      return 'REVOKED';
    case BindingStatus.suspended:
      return 'SUSPENDED';
  }
}

String _biometricTypeToJson(BiometricType value) {
  switch (value) {
    case BiometricType.fingerprint:
      return 'FINGERPRINT';
    case BiometricType.facialRecognition:
      return 'FACIAL_RECOGNITION';
    case BiometricType.iris:
      return 'IRIS';
    case BiometricType.voicePrint:
      return 'VOICE_PRINT';
    case BiometricType.other:
      return 'OTHER';
  }
}

String _motionSensorStatusToJson(MotionSensorStatus value) {
  switch (value) {
    case MotionSensorStatus.inMotion:
      return 'IN_MOTION';
    case MotionSensorStatus.stationary:
      return 'STATIONARY';
  }
}

String _deviceEnvironmentContextToJson(DeviceEnvironmentContext value) {
  switch (value) {
    case DeviceEnvironmentContext.vpnDetected:
      return 'VPN_DETECTED';
    case DeviceEnvironmentContext.emulatorDetected:
      return 'EMULATOR_DETECTED';
  }
}

String _scrollDirectionToJson(ScrollDirection value) {
  switch (value) {
    case ScrollDirection.up:
      return 'UP';
    case ScrollDirection.down:
      return 'DOWN';
    case ScrollDirection.both:
      return 'BOTH';
  }
}

String _suspiciousActivityToJson(SuspiciousActivity value) {
  switch (value) {
    case SuspiciousActivity.noSuspiciousActivity:
      return 'NO_SUSPICIOUS_ACTIVITY';
    case SuspiciousActivity.suspiciousActivityDetected:
      return 'SUSPICIOUS_ACTIVITY_DETECTED';
  }
}

String _recipientTypeToJson(RecipientType value) {
  switch (value) {
    case RecipientType.individual:
      return 'INDIVIDUAL';
    case RecipientType.corporate:
      return 'CORPORATE';
  }
}

String _addressTypeToJson(AddressType value) {
  switch (value) {
    case AddressType.business:
      return 'BUSINESS';
    case AddressType.correspondence:
      return 'CORRESPONDENCE';
    case AddressType.residential:
      return 'RESIDENTIAL';
  }
}

String _channelToJson(Channel value) {
  switch (value) {
    case Channel.web:
      return 'WEB';
    case Channel.mobile:
      return 'MOBILE';
  }
}

String _channelTypeToJson(ChannelType value) {
  switch (value) {
    case ChannelType.ecommerce:
      return 'ECOMMERCE';
    case ChannelType.inStore:
      return 'IN_STORE';
    case ChannelType.inApp:
      return 'IN_APP';
    case ChannelType.telephone:
      return 'TELEPHONE';
    case ChannelType.mail:
      return 'MAIL';
    case ChannelType.recurringPayment:
      return 'RECURRING_PAYMENT';
    case ChannelType.other:
      return 'OTHER';
  }
}

String _subChannelTypeToJson(SubChannelType value) {
  switch (value) {
    case SubChannelType.webBrowser:
      return 'WEB_BROWSER';
    case SubChannelType.mobileApp:
      return 'MOBILE_APP';
    case SubChannelType.smartTv:
      return 'SMART_TV';
    case SubChannelType.wearableDevice:
      return 'WEARABLE_DEVICE';
    case SubChannelType.posTerminal:
      return 'POS_TERMINAL';
    case SubChannelType.atm:
      return 'ATM';
    case SubChannelType.kioskTerminal:
      return 'KIOSK_TERMINAL';
    case SubChannelType.other:
      return 'OTHER';
  }
}

String _deliveryTimeframeToJson(DeliveryTimeframe value) {
  switch (value) {
    case DeliveryTimeframe.electronicDelivery:
      return 'ELECTRONIC_DELIVERY';
    case DeliveryTimeframe.sameDayShipping:
      return 'SAME_DAY_SHIPPING';
    case DeliveryTimeframe.overnightShipping:
      return 'OVERNIGHT_SHIPPING';
    case DeliveryTimeframe.moreThan1DayShipping:
      return 'MORE_THAN_1_DAY_SHIPPING';
  }
}

String _reorderItemsIndicatorToJson(ReorderItemsIndicator value) {
  switch (value) {
    case ReorderItemsIndicator.firstTimeOrder:
      return 'FIRST_TIME_ORDER';
    case ReorderItemsIndicator.reorder:
      return 'REORDER';
  }
}

String _preOrderPurchaseIndicatorToJson(PreOrderPurchaseIndicator value) {
  switch (value) {
    case PreOrderPurchaseIndicator.merchandiseAvailable:
      return 'MERCHANDISE_AVAILABLE';
    case PreOrderPurchaseIndicator.futureAvailability:
      return 'FUTURE_AVAILABILITY';
  }
}

String _addressMatchLevelToJson(AddressMatchLevel value) {
  switch (value) {
    case AddressMatchLevel.fullMatch:
      return 'FULL_MATCH';
    case AddressMatchLevel.partialMatch:
      return 'PARTIAL_MATCH';
    case AddressMatchLevel.noMatch:
      return 'NO_MATCH';
    case AddressMatchLevel.notApplicable:
      return 'NOT_APPLICABLE';
  }
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
    if (type != null) json['type'] = _possessionFactorTypeToJson(type!);
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
    if (type != null) json['type'] = _knowledgeFactorTypeToJson(type!);
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
    if (type != null) json['type'] = _inherenceFactorTypeToJson(type!);
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
      json['authentication_channel'] =
          _authenticationChannelToJson(authenticationChannel!);
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
      json['challenge_outcome'] = _challengeOutcomeToJson(challengeOutcome!);
    }
    if (authenticationFlow != null) {
      json['authentication_flow'] = _authenticationFlowToJson(authenticationFlow!);
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

  final dynamic latitude; // Can be number or string
  final dynamic longitude; // Can be number or string

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
      json['orientation'] = _screenOrientationToJson(orientation!);
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
    if (status != null) json['status'] = _motionSensorStatusToJson(status!);
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
      json['binding_status'] = _bindingStatusToJson(bindingStatus!);
    }
    if (deviceType != null) json['device_type'] = _deviceTypeToJson(deviceType!);
    if (deviceManufacturer != null) {
      json['device_manufacturer'] = deviceManufacturer!.toJson();
    }
    if (deviceLanguage != null) json['device_language'] = deviceLanguage;
    if (deviceLocalDateTime != null) {
      json['device_local_date_time'] = deviceLocalDateTime;
    }
    if (connectionType != null) {
      json['connection_type'] = _connectionTypeToJson(connectionType!);
    }
    if (screenInformation != null) {
      json['screen_information'] = screenInformation!.toJson();
    }
    if (batteryStatus != null) json['battery_status'] = batteryStatus!.toJson();
    if (touchSupport != null) json['touch_support'] = touchSupport!.toJson();
    if (motionSensors != null) json['motion_sensors'] = motionSensors!.toJson();
    if (deviceEnvironmentContext != null) {
      json['device_environment_context'] = deviceEnvironmentContext!
          .map((e) => _deviceEnvironmentContextToJson(e))
          .toList();
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
      json['biometric_types'] =
          biometricTypes!.map((e) => _biometricTypeToJson(e)).toList();
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

class BrowserInformation {
  const BrowserInformation({
    this.userAgent,
    this.isCookiesEnabled,
    this.availableFonts,
    this.plugins,
    this.pixelRatio,
  });

  final String? userAgent;
  final bool? isCookiesEnabled;
  final List<String>? availableFonts;
  final List<String>? plugins;
  final double? pixelRatio;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (userAgent != null) json['user_agent'] = userAgent;
    if (isCookiesEnabled != null) json['is_cookies_enabled'] = isCookiesEnabled;
    if (availableFonts != null) json['available_fonts'] = availableFonts;
    if (plugins != null) json['plugins'] = plugins;
    if (pixelRatio != null) json['pixel_ratio'] = pixelRatio;
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
    if (direction != null) json['direction'] = _scrollDirectionToJson(direction!);
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
      json['suspicious_activity'] = _suspiciousActivityToJson(suspiciousActivity!);
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
    this.browserInformation,
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
  final BrowserInformation? browserInformation;
  final UserBehavior? userBehavior;
  final AccountRiskIndicators? accountRiskIndicators;
  final Map<String, dynamic>? supplementaryData;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (authentication != null) json['authentication'] = authentication!.toJson();
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
    if (browserInformation != null) {
      json['browser_information'] = browserInformation!.toJson();
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
      json['address_type'] = _addressTypeToJson(addressType!);
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
      json['recipient_type'] = _recipientTypeToJson(recipientType!);
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
      json['delivery_timeframe'] = _deliveryTimeframeToJson(deliveryTimeframe!);
    }
    if (reorderItemsIndicator != null) {
      json['reorder_items_indicator'] =
          _reorderItemsIndicatorToJson(reorderItemsIndicator!);
    }
    if (preOrderPurchaseIndicator != null) {
      json['pre_order_purchase_indicator'] =
          _preOrderPurchaseIndicatorToJson(preOrderPurchaseIndicator!);
    }
    if (isGiftCardPurchase != null) {
      json['is_gift_card_purchase'] = isGiftCardPurchase;
    }
    if (isDeliveryAddressMatchesBilling != null) {
      json['is_delivery_address_matches_billing'] =
          isDeliveryAddressMatchesBilling;
    }
    if (addressMatchLevel != null) {
      json['address_match_level'] = _addressMatchLevelToJson(addressMatchLevel!);
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
    if (channel != null) json['channel'] = _channelToJson(channel!);
    if (channelType != null) {
      json['channel_type'] = _channelTypeToJson(channelType!);
    }
    if (subChannelType != null) {
      json['sub_channel_type'] = _subChannelTypeToJson(subChannelType!);
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
      json['destination_delivery_address'] = destinationDeliveryAddress!.toJson();
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
