import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_platform_interface.dart';

class NativeMethodChannel extends NativePlatformInterface {
  @visibleForTesting
  final methodChannel = const MethodChannel('urmobo');

  @override
  Future<void> startCobrowse(String license, Map customData) async {
    Map<String, dynamic> args = {
      "license": license,
      "customData": customData,
    };

    await methodChannel.invokeMethod<void>('startCobrowse', args);
  }
}
