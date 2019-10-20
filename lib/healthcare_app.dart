import 'dart:async';

import 'package:flutter/services.dart';

class HealthcareApp {
  static const MethodChannel _channel =
      const MethodChannel('healthcare_app');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
