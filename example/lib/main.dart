import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_screenshot/device_screenshot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  // final _deviceScreenshotPlugin = DeviceScreenshot();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // platformVersion = await DeviceScreenshot.instance.getPlatformVersion();

      // print('------------------------?>>> $v');
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            TextButton(
              onPressed: () async {
                if (!await DeviceScreenshot.instance.overTheAppPermissionCheck()) {
                  DeviceScreenshot.instance.requestOverlayPermission();
                } else {
                  log('overTheAppPermission already allowed!!');
                }
              },
              child: Text('PERMISSION'),
            ),
            TextButton(
              onPressed: () {
                DeviceScreenshot.instance.mediaProjectionRequest();
              },
              child: Text('START SERVICE'),
            ),
            TextButton(
              onPressed: () async {
                print('hello screenshot is:::');
                Uri? uri = await DeviceScreenshot.instance.takeScreenshot();
                print('hello screenshot is::: ${uri?.path}');
              },
              child: Text('SCREENSHOT'),
            ),
          ],
        ),
      ),
    );
  }
}
