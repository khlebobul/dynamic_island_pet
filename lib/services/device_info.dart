import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class DeviceInfo {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<bool> hasDynamicIsland() async {
    if (Platform.isIOS) {
      try {
        final iosInfo = await _deviceInfo.iosInfo;

        final dynamicIslandModels = [
          'iPhone15,2', // iPhone 14 Pro
          'iPhone15,3', // iPhone 14 Pro Max
          'iPhone15,4', // iPhone 15
          'iPhone15,5', // iPhone 15 Plus
          'iPhone16,1', // iPhone 15 Pro
          'iPhone16,2', // iPhone 15 Pro Max
          'iPhone17,1', // iPhone 16 Pro
          'iPhone17,2', // iPhone 16 Pro Max
          'iPhone17,3', // iPhone 16
          'iPhone17,4', // iPhone 16 Plus
          'iPhone18,1', // iPhone 17 Pro
          'iPhone18,2', // iPhone 17 Pro Max
          'iPhone18,3', // iPhone 17
          'iPhone18,4', // iPhone Air
          'iPhone19,2', // iPhone 18 Pro
          'iPhone19,3', // iPhone 18 Pro Max
          'iPhone19,7', // iPhone 18 Pro Max (regional variant)
        ];
        debugPrint('Device model: ${iosInfo.utsname.machine}');

        return dynamicIslandModels.contains(iosInfo.utsname.machine);
      } catch (e) {
        debugPrint('Error checking for dynamic island: $e');
        return false;
      }
    }
    return false;
  }

  static Future<String> getDeviceModel() async {
    if (Platform.isIOS) {
      try {
        final iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.utsname.machine;
      } catch (e) {
        debugPrint('Error getting device model: $e');
        return '';
      }
    }
    return '';
  }
}
