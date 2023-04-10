import 'native_method_channel.dart';

abstract class NativePlatformInterface {
  NativePlatformInterface() : super();

  static NativePlatformInterface instance = NativeMethodChannel();

  Future<void> startCobrowse(String license, Map customData) async {
    throw UnimplementedError('startCobrowse() has not been implemented.');
  }
}
