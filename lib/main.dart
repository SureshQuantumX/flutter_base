import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/core/di/get_it.dart';
import 'package:logarte/logarte.dart';
import 'app.dart';
import 'flavors.dart';

final Logarte logarte = Logarte(
  // Share network request
  onShare: (String content) {},

  // Add shortcut actions (optional)
  onRocketLongPressed: (context) {
    // e.g: toggle theme mode
  },
  disableDebugConsoleLogs: true,

  onRocketDoubleTapped: (context) {
    // e.g: change language
  },
);
void main() async {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );
  configureDependencies();
  runApp(const App());
}
