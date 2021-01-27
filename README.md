# JyLight

一体机灯光控制Flutter插件.

## Getting Started

```dart
import 'package:JyLight/JyLight.dart';

///开灯,true表示成功.
var r = await JyLight.turnOn();
///关灯,true表示成功.
var r = await JyLight.turnOff();
///加亮度,返回当前亮度.
var r = await JyLight.increaseBrightness();
///降低亮度,返回当前亮度.
var r = await JyLight.decreaseBrightness();
///当前是否亮灯
var r = await JyLight.isLightOn();
///获取当前亮度
var r = await JyLight.light;
///获取当前灯光状态.
var r = await JyLight.status;

```



