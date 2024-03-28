import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_show_when_locked/flutter_show_when_locked.dart';
import 'package:flutter_show_when_locked/flutter_show_when_locked_platform_interface.dart';
import 'package:flutter_show_when_locked/flutter_show_when_locked_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterShowWhenLockedPlatform
    with MockPlatformInterfaceMixin
    implements FlutterShowWhenLockedPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterShowWhenLockedPlatform initialPlatform = FlutterShowWhenLockedPlatform.instance;

  test('$MethodChannelFlutterShowWhenLocked is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterShowWhenLocked>());
  });

  test('getPlatformVersion', () async {
    FlutterShowWhenLocked flutterShowWhenLockedPlugin = FlutterShowWhenLocked();
    MockFlutterShowWhenLockedPlatform fakePlatform = MockFlutterShowWhenLockedPlatform();
    FlutterShowWhenLockedPlatform.instance = fakePlatform;

    expect(await flutterShowWhenLockedPlugin.getPlatformVersion(), '42');
  });
}
