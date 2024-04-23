<img src="https://github.com/HasanToufiqAhamed/device_screenshot/blob/main/assets/poster.png" width="100%" alt="Device Screenshot Banner" />
<h2 align="center">
  Device Screenshot
</h2>

## 💡 Overview

A Flutter plugin that can helps you to take screenshot your overall device using media projection and foreground service.

*The plugin currently supports **Android** only and **doesn't support IOS because** the feature of display over other apps is not available there*

<br>
<p align="center">
<img src="https://github.com/HasanToufiqAhamed/device_screenshot/blob/main/assets/example.gif" width="25%" alt="Example" />
<br>
This GIF is taken from the <a href="https://github.com/HasanToufiqAhamed/device_screenshot/tree/main/example">Example Project</a>
</p>

## 💻 Usage

Import the package:

```dart
import 'package:device_screenshot/device_screenshot.dart';
```

Use the singleton instance of `DeviceScreenshot` to access all the available methods, for example:

```dart
DeviceScreenshot.instance.checkOverTheAppPermission()
DeviceScreenshot.instance.requestOverlayPermission();
```