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
          'iPhone14,3',
          'iPhone14,4',
          'iPhone15,2',
          'iPhone15,3',
          'iPhone15,4',
          'iPhone15,5',
          'iPhone16,1',
          'iPhone16,2',
          'iPhone16,3',
          'iPhone16,4',
        ];

        return dynamicIslandModels.contains(iosInfo.utsname.machine);
      } catch (e) {
        debugPrint('Error checking for dynamic island: $e');
        return false;
      }
    }
    return false;
  }
}
