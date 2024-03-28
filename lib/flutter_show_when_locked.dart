import 'flutter_show_when_locked_platform_interface.dart';

class FlutterShowWhenLocked {
  Future<String?> getPlatformVersion() {
    return FlutterShowWhenLockedPlatform.instance.getPlatformVersion();
  }

  Future<void> show() {
    return FlutterShowWhenLockedPlatform.instance.show();
  }

  Future<void> hide() {
    return FlutterShowWhenLockedPlatform.instance.hide();
  }
}
