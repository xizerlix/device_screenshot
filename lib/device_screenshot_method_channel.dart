import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_screenshot_platform_interface.dart';

/// An implementation of [DeviceScreenshotPlatform] that uses method channels.
class MethodChannelDeviceScreenshot extends DeviceScreenshotPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_screenshot');

  @override
  Future<bool> checkOverTheAppPermission() async {
    final permission = await methodChannel.invokeMethod<bool>('checkOverTheAppPermission');
    return permission ?? false;
  }

  @override
  Future<bool> checkMediaProjectionService() async {
    final permission = await methodChannel.invokeMethod<bool>('checkMediaProjectionService');
    return permission ?? false;
  }

  @override
  Future<Uri?> takeScreenshot() async {
    final uriPath = await methodChannel.invokeMethod<String>('takeScreenshot');
    Uri uri = Uri.file(uriPath ?? '');
    return uriPath == null ? null : uri;
  }

  @override
  void requestOverlayPermission() async {
    await methodChannel.invokeMethod('requestOverlayPermission');
  }

  @override
  void requestMediaProjection() async {
    await methodChannel.invokeMethod('requestMediaProjection');
  }

  @override
  void stopMediaProjectionService() async {
    await methodChannel.invokeMethod('stopMediaProjectionService');
  }
}
