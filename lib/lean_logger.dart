import 'package:flutter/foundation.dart';

class LeanLogger {
  static var showLogs = false;

  static info({required String msg}) {
    if (kDebugMode) {
      showLogs == true ? print('LeanSDK: $msg') : null;
    }
  }

  static error({required String msg}) {
    if (kDebugMode) {
      showLogs == true ? print('LeanSdk-Error: $msg') : null;
    }
  }
}
