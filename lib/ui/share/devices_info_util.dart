import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

/// * @Author: chuxiong
/// * @Created at: 2020/12/18 3:20 PM
/// * @Email: 
/// * @Company: 嘉联支付
/// * description 设备信息
class DevicesInfoUtils {
  Map<String, dynamic> deviceData=<String, dynamic>{};
  static String osVersion = "";
  static String deviceId = "";
  static String deviceType = "";

  Future<void> initialize() async {
     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfoPlugin.androidInfo;
        osVersion = androidDeviceInfo.version.sdkInt.toString();
        deviceId = "Android_" + androidDeviceInfo.androidId;
        deviceType = androidDeviceInfo.brand;
        deviceData = _readAndroidBuildData(androidDeviceInfo);
      } else if (Platform.isIOS) {
        var iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        osVersion = iosDeviceInfo.systemVersion;
        deviceId = "iOS_" + iosDeviceInfo.identifierForVendor;
        deviceType = iosDeviceInfo.name;
        deviceData = _readIosDeviceInfo(iosDeviceInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }


  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}