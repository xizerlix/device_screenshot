
import 'device_screenshot_platform_interface.dart';

class DeviceScreenshot {
  DeviceScreenshot._();

  static final DeviceScreenshot instance = DeviceScreenshot._();

  Future<bool> checkOverTheAppPermission() {
    return DeviceScreenshotPlatform.instance.checkOverTheAppPermission();
  }

  Future<bool> checkMediaProjectionService() {
    return DeviceScreenshotPlatform.instance.checkMediaProjectionService();
  }

  void requestOverlayPermission() {
    DeviceScreenshotPlatform.instance.requestOverlayPermission();
  }

  Future<Uri?> takeScreenshot() {
    return DeviceScreenshotPlatform.instance.takeScreenshot();
  }

  void requestMediaProjection() {
    DeviceScreenshotPlatform.instance.requestMediaProjection();
  }

  void stopMediaProjectionService() {
    DeviceScreenshotPlatform.instance.stopMediaProjectionService();
  }
}
