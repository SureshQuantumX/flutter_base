import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SliversPage extends StatefulWidget {
  const SliversPage({super.key});

  @override
  State<SliversPage> createState() => _SliversPageState();
}

class _SliversPageState extends State<SliversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Slivers Example'),
              background: FlutterLogo(),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Text('$index')),
                title: Text('Item #$index'),
              );
            },
            itemCount: 50,
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((
          //     BuildContext context,
          //     int index,
          //   ) {
          //     return ListTile(
          //       leading: CircleAvatar(child: Text('$index')),
          //       title: Text('Item #$index'),
          //     );
          //   }, childCount: 50),
          // ),
        ],
      ),
    );
  }
}
