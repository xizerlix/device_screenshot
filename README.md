<img src="https://raw.githubusercontent.com/HasanToufiqAhamed/device_screenshot/main/assets/poster.png" width="100%" alt="Device Screenshot Banner" />
<h2 align="center">
  Device Screenshot
</h2>

## 💡 Overview

A Flutter plugin that can helps you to take screenshot your overall device using media projection and foreground service.

*The plugin currently supports **Android** only and **doesn't support IOS because** the feature of media projection is not available there*


## 💻 Usage

First, add ```flutter_native_splash``` as a dependency in your pubspec.yaml file.

```yml
dependencies:
  flutter:
    sdk: flutter

  device_screenshot: ^0.0.6
```
Don't forget to ```flutter pub get```.

## 🔧 Setup

Set the minimum SDK version to `21` or higher in your `android/app/build.gradle` file:

```gradle
android {
    defaultConfig {
        ...
        minSdkVersion 21 // Set this to 21 or higher
        ...
    }
}
```

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools" package="com.example">
  ...

  <application
        android:label="example"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        ...>

        <activity
            android:name=".MainActivity"
            android:exported="true"
            ...>

        <!--Add this-->
        <service
            android:name="com.flutter.device_screenshot.src.MediaProjectionService"
            android:enabled="true"
            android:exported="false"
            android:foregroundServiceType="mediaProjection"
            android:permission="TODO"
            android:stopWithTask="false"
            />
        <!--end-->

        ...
  ...
  </application>
</manifest>
```

Import the package:

```dart
import 'package:device_screenshot/device_screenshot.dart';
```

Use the singleton instance of `DeviceScreenshot` to access all the available methods, for example:

```dart
DeviceScreenshot.instance.checkMediaProjectionService()
```