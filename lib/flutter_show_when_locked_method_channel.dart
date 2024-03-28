import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_show_when_locked_platform_interface.dart';

/// An implementation of [FlutterShowWhenLockedPlatform] that uses method channels.
class MethodChannelFlutterShowWhenLocked extends FlutterShowWhenLockedPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_show_when_locked');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> show() async {
    await methodChannel.invokeMethod('show');
  }

  @override
  Future<void> hide() async {
    await methodChannel.invokeMethod('hide');
  }
}
