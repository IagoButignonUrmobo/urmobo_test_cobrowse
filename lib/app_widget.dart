import 'package:flutter/material.dart';

import 'home_page.dart';
import 'keys.dart';
import 'native/native_methods.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({
    super.key,
  });

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final NativeMethods _nativeMethods;

  @override
  void initState() {
    startCobrowse();
    super.initState();
  }

  Future<void> startCobrowse() async {
    _nativeMethods = NativeMethods();

    // set values at keys.dart file
    await _nativeMethods.startCobrowse(
      Keys.license,
      {
        'device_name': Keys.deviceId,
        'EquipamentoId': Keys.deviceId,
        'entity_token': Keys.entityToken,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Urmobo Cobrowse Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
