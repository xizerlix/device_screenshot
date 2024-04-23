import 'package:flutter_test/flutter_test.dart';
import 'package:device_screenshot/device_screenshot_platform_interface.dart';
import 'package:device_screenshot/device_screenshot_method_channel.dart';

// class MockDeviceScreenshotPlatform
//     with MockPlatformInterfaceMixin
//     implements DeviceScreenshotPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

void main() {
  final DeviceScreenshotPlatform initialPlatform = DeviceScreenshotPlatform.instance;

  test('$MethodChannelDeviceScreenshot is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceScreenshot>());
  });

  test('getPlatformVersion', () async {
    // DeviceScreenshot deviceScreenshotPlugin = DeviceScreenshot();
    // MockDeviceScreenshotPlatform fakePlatform = MockDeviceScreenshotPlatform();
    // DeviceScreenshotPlatform.instance = fakePlatform;
    //
    // expect(await deviceScreenshotPlugin.getPlatformVersion(), '42');
  });
}
