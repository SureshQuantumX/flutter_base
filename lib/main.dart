import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/core/di/get_it.dart';

import 'app.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );
  configureDependencies();
  runApp(const App());
}
