import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  bool overTheAppPermission = await DeviceScreenshot.instance.checkOverTheAppPermission();
                  print('overTheAppPermission : $overTheAppPermission');
                },
                child: const Text('Check Over The App Permission'),
              ),
              TextButton(
                onPressed: () async {
                  if(!await DeviceScreenshot.instance.checkOverTheAppPermission()){
                    DeviceScreenshot.instance.requestMediaProjection();
                  }
                },
                child: const Text('Request Over The App Permission'),
              ),
              TextButton(
                onPressed: () async {
                  bool mediaProjectionService = await DeviceScreenshot.instance.checkMediaProjectionService();
                  print('mediaProjectionService : $mediaProjectionService');
                },
                child: const Text('Check Media Projection Service'),
              ),
              TextButton(
                onPressed: () async {
                  if(!await DeviceScreenshot.instance.checkMediaProjectionService()) {
                    DeviceScreenshot.instance.requestMediaProjection();
                  }
                },
                child: const Text('Request Media Projection Service'),
              ),
              TextButton(
                onPressed: () async {
                  if(await DeviceScreenshot.instance.checkMediaProjectionService()) {
                    DeviceScreenshot.instance.stopMediaProjectionService();
                  }
                },
                child: const Text('Stop Media Projection Service'),
              ),
              TextButton(
                onPressed: () async {
                  Uri? uri = await DeviceScreenshot.instance.takeScreenshot();
                  if(uri!=null) {
                    print('hello screenshot is::: ${uri?.path}');
                  } else {
                    print('uri is null!!!');
                  }
                },
                child: const Text('TAKE SCREENSHOT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
