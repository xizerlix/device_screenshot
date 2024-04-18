
import 'device_screenshot_platform_interface.dart';

class DeviceScreenshot {
  DeviceScreenshot._();

  static final DeviceScreenshot instance = DeviceScreenshot._();

  Future<bool> overTheAppPermissionCheck() {
    return DeviceScreenshotPlatform.instance.overTheAppPermissionCheck();
  }

  void requestOverlayPermission() {
    DeviceScreenshotPlatform.instance.requestOverlayPermission();
  }

  Future<Uri?> takeScreenshot() {
    return DeviceScreenshotPlatform.instance.takeScreenshot();
  }

  void mediaProjectionRequest() {
    DeviceScreenshotPlatform.instance.mediaProjectionRequest();
  }
}
