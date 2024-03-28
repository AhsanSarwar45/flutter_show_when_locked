import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_show_when_locked_method_channel.dart';

abstract class FlutterShowWhenLockedPlatform extends PlatformInterface {
  /// Constructs a FlutterShowWhenLockedPlatform.
  FlutterShowWhenLockedPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterShowWhenLockedPlatform _instance =
      MethodChannelFlutterShowWhenLocked();

  /// The default instance of [FlutterShowWhenLockedPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterShowWhenLocked].
  static FlutterShowWhenLockedPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterShowWhenLockedPlatform] when
  /// they register themselves.
  static set instance(FlutterShowWhenLockedPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> show() {
    throw UnimplementedError('show() has not been implemented.');
  }

  Future<void> hide() {
    throw UnimplementedError('hide() has not been implemented.');
  }
}
