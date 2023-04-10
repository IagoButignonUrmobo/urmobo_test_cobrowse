import 'native_platform_interface.dart';

class NativeMethods {
  Future<void> startCobrowse(String license, Map customData) async {
    await NativePlatformInterface.instance.startCobrowse(
      license,
      customData,
    );
  }
}
