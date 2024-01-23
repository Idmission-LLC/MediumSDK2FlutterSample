
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginIdentitySdk {
  static const MethodChannel _channel = MethodChannel('flutter_plugin_identity_sdk');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> idm_sdk_init(String loginId, String password, int merchantId) async {
    final String? resultData = await _channel.invokeMethod('idm_sdk_init', {"loginId": loginId, "password": password, "merchantId": merchantId});
    return resultData;
  }

  static Future<String?> idm_sdk_serviceID20() async {
    final String? resultData = await _channel.invokeMethod('idm_sdk_serviceID20');
    return resultData;
  }

  static Future<String?> idm_sdk_serviceID10() async {
    final String? resultData = await _channel.invokeMethod('idm_sdk_serviceID10');
    return resultData;
  } 

  static Future<String?> idm_sdk_serviceID50(int uniqueCustomerNumber) async {
    final String? resultData = await _channel.invokeMethod('idm_sdk_serviceID50', {"uniqueCustomerNumber": uniqueCustomerNumber});
    return resultData;
  }

  static Future<String?> idm_sdk_serviceID175(int uniqueCustomerNumber) async {
    final String? resultData = await _channel.invokeMethod('idm_sdk_serviceID175', {"uniqueCustomerNumber": uniqueCustomerNumber});
    return resultData;
  }

  static Future<String?> idm_sdk_serviceID105(int uniqueCustomerNumber) async {
    final String? resultData = await _channel.invokeMethod('idm_sdk_serviceID105', {"uniqueCustomerNumber": uniqueCustomerNumber});
    return resultData;
  }    

  static Future<String?> idm_sdk_serviceID185() async {
    final String? resultData = await _channel.invokeMethod('idm_sdk_serviceID185');
    return resultData;
  } 

  static Future<String?> idm_sdk_serviceID660() async {
    final String? resultData = await _channel.invokeMethod('idm_sdk_serviceID660');
    return resultData;
  } 

  static Future<String?> submit_result() async {
    final String? resultData = await _channel.invokeMethod('submit_result');
    return resultData;
  } 

}
