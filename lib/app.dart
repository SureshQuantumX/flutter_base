import 'package:flutter/material.dart';
import 'package:flutter_base/R&D/get_it/get_it_test.dart';
import 'package:flutter_base/di/get_it.dart';
import 'package:flutter_base/utils/app_router.dart';
import 'flavors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      routerConfig: appRouter.config(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) => show
      ? Banner(
          location: BannerLocation.topStart,
          message: F.name,
          color: Colors.green.withAlpha(150),
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            letterSpacing: 1.0,
          ),
          textDirection: TextDirection.ltr,
          child: child,
        )
      : Container(child: child);
}
