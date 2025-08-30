import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class GetItTest extends StatefulWidget {
  const GetItTest({super.key});

  @override
  State<GetItTest> createState() => _GetItTestState();
}

class _GetItTestState extends State<GetItTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get It Test ')),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              GetIt.I.registerSingleton(A());
              setState(() {});
            },
            child: const Text('Register '),
          ),
          ElevatedButton(
            onPressed: () {
              GetIt.I.unregister<A>();
              setState(() {});
            },
            child: const Text('Unregister'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Get It Test Page ${GetIt.I.isRegistered<A>() ? "Registered" : "Not Registered"}',
          ),
        ],
      ),
    );
  }
}

class A {
  final String value = 'Hello';
}
