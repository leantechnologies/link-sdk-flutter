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

  static void logIfEmpty(String value, String variableName) {
    if (value.isEmpty) {
      LeanLogger.error(msg: "$variableName can't be empty");
    }
  }

  static void logIfEmptyList(List list, String variableName) {
    if (list.isEmpty) {
      LeanLogger.error(msg: "$variableName can't be empty");
    }
  }
}
