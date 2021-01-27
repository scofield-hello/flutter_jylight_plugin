import 'package:JyLight/JyLight.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("$_platformVersion"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: () async {
                        var r = await JyLight.turnOn();
                        setState(() {
                          _platformVersion = "开灯:$r";
                        });
                      },
                      child: Text("开灯")),
                  FlatButton(
                      onPressed: () async {
                        var r = await JyLight.turnOff();
                        setState(() {
                          _platformVersion = "关灯:$r";
                        });
                      },
                      child: Text("关灯")),
                  FlatButton(
                      onPressed: () async {
                        var r = await JyLight.increaseBrightness();
                        setState(() {
                          _platformVersion = "当前亮度:$r";
                        });
                      },
                      child: Text("加亮度")),
                  FlatButton(
                      onPressed: () async {
                        var r = await JyLight.decreaseBrightness();
                        setState(() {
                          _platformVersion = "当前亮度:$r";
                        });
                      },
                      child: Text("减亮度")),
                  FlatButton(
                      onPressed: () async {
                        var r = await JyLight.isLightOn();
                        setState(() {
                          _platformVersion = "当前是否已开灯:$r";
                        });
                      },
                      child: Text("是否开灯")),
                  FlatButton(
                      onPressed: () async {
                        var r = await JyLight.light;
                        setState(() {
                          _platformVersion = "当前亮度:$r";
                        });
                      },
                      child: Text("获取当前亮度")),
                  FlatButton(
                      onPressed: () async {
                        var r = await JyLight.status;
                        setState(() {
                          _platformVersion = "是否开灯:${r.status},亮度:${r.light}";
                        });
                      },
                      child: Text("获取当前状态")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
