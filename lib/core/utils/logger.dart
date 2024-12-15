import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  static void logToConsole(String message) {
    if (kDebugMode) {
      log(message);
    }
  }

  static void error(String message) {
    if (kDebugMode) {
      log('❌ Error: $message');
    }
  }

  static void warning(String message) {
    if (kDebugMode) {
      log('⚠️ Warning: $message');
    }
  }

  static void jsonLog(dynamic data) {
    if (kDebugMode) {
      final prettyString = const JsonEncoder.withIndent('  ').convert(data);
      log('📋 JSON Data:\n$prettyString');
    }
  }
}
