import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/gen/assets.gen.dart';
import '../../flavors.dart';

@RoutePage()
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(F.title)),
      body: Column(
        children: [
          Assets.pngs.appLogoBg.image(width: 200, height: 200),
          Center(child: Text('Hello ${F.title}')),
        ],
      ),
    );
  }
}
