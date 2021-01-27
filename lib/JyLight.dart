import 'dart:async';

import 'package:flutter/services.dart';

class JyLightStatus {
  ///true表示当前灯光是打开的,false表示关闭.
  final bool status;

  ///当前灯光级别[0...9]
  final int light;
  const JyLightStatus(this.status, this.light);
}

class JyLight {
  static const MethodChannel _channel = const MethodChannel('JyLight');

  ///开灯,成功返回true,反之false.
  static Future<bool> turnOn() async {
    final bool result = await _channel.invokeMethod('turnOn');
    return result;
  }

  ///关灯,成功返回true,反之false.
  static Future<bool> turnOff() async {
    final bool result = await _channel.invokeMethod('turnOff');
    return result;
  }

  ///如果灯光已开返回true, 反之返回false.
  static Future<bool> isLightOn() async {
    final bool result = await _channel.invokeMethod('isLightOn');
    return result;
  }

  ///增加亮度，并返回当前灯光亮度级别[0...9].
  static Future<int> increaseBrightness() async {
    final int light = await _channel.invokeMethod('increaseBrightness');
    return light;
  }

  ///降低亮度，并返回当前灯光亮度级别[0...9].
  static Future<int> decreaseBrightness() async {
    final int light = await _channel.invokeMethod('decreaseBrightness');
    return light;
  }

  ///返回当前亮度级别[0...9].
  static Future<int> get light async {
    final int light = await _channel.invokeMethod('getLight');
    return light;
  }

  ///返回补光灯当前状态.
  static Future<JyLightStatus> get status async {
    final dynamic lightStatus = await _channel.invokeMethod('getLightStatus');
    return JyLightStatus(lightStatus['status'], lightStatus['light']);
  }
}
