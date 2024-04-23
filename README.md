<img src="https://raw.githubusercontent.com/HasanToufiqAhamed/device_screenshot/main/assets/poster.png" width="100%" alt="Device Screenshot Banner" />
<h2 align="center">
  Device Screenshot
</h2>

## 💡 Overview

A Flutter plugin that can helps you to take screenshot your overall device using media projection and foreground service.

*The plugin currently supports **Android** only and **doesn't support IOS because** the feature of media projection is not available there*


## 💻 Usage

Include dependency in your pubspec.yaml file

```yml
dependencies:
  flutter:
    sdk: flutter

  device_screenshot 0.0.2
```

Import the package:

```dart
import 'package:device_screenshot/device_screenshot.dart';
```

Use the singleton instance of `DeviceScreenshot` to access all the available methods, for example:

```dart
DeviceScreenshot.instance.checkMediaProjectionService()
```