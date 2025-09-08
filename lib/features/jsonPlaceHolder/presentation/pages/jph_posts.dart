import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/di/get_it.dart';
import 'package:flutter_base/features/jsonPlaceHolder/presentation/cubit/jph_cubit.dart';
import 'package:flutter_base/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

@RoutePage()
class JphPostsPage extends StatefulWidget implements AutoRouteWrapper {
  const JphPostsPage({super.key});

  @override
  State<JphPostsPage> createState() => _JphPostsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<JphCubit>()..fetchPosts(),
      child: this,
    );
  }
}

class _JphPostsPageState extends State<JphPostsPage> {
  @override
  void initState() {
    logarte.attach(context: context, visible: kDebugMode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JPH Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<JphCubit>().fetchPosts();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverAppBar(
            //   pinned: true,
            //   expandedHeight: 150.0,
            //   flexibleSpace: const FlexibleSpaceBar(
            //     title: Text('JSON Placeholder Posts'),
            //     background: FlutterLogo(),
            //   ),
            // ),
            BlocConsumer<JphCubit, JphState>(
              listener: (context, state) {
                log('state $state');
                if (state is JphError) {
                  log('state error ${state.error}');
                }
              },
              builder: (context, state) {
                if (state is JphLoading) {
                  return SliverFillRemaining(
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else if (state is JphError) {
                  return SliverFillRemaining(
                    child: Text('Error: ${state.error}'),
                  );
                } else if (state is JphLoaded) {
                  return MultiSliver(
                    pushPinnedChildren: false,
                    children: [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        title: Text('Posts (${state.posts.length})'),
                      ),
                      SliverList.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          final post = state.posts[index];
                          return ListTile(
                            title: Text(post.title),
                            subtitle: Text(post.body),
                            leading: Text(post.id.toString()),
                          );
                        },
                      ),
                    ],
                  );
                }
                return const Text('Press the button to fetch posts');
              },
            ),
          ],
        ),
      ),
    );
  }
}
