import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_screenshot_method_channel.dart';

abstract class DeviceScreenshotPlatform extends PlatformInterface {
  /// Constructs a DeviceScreenshotPlatform.
  DeviceScreenshotPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceScreenshotPlatform _instance = MethodChannelDeviceScreenshot();

  /// The default instance of [DeviceScreenshotPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceScreenshot].
  static DeviceScreenshotPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceScreenshotPlatform] when
  /// they register themselves.
  static set instance(DeviceScreenshotPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> overTheAppPermissionCheck() {
    throw UnimplementedError('overTheAppPermissionCheck() has not been implemented.');
  }

  void requestOverlayPermission() {
    throw UnimplementedError('requestOverlayPermission() has not been implemented.');
  }

  Future<Uri?> takeScreenshot() {
    throw UnimplementedError('takeScreenshot() has not been implemented.');
  }
}
