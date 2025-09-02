import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/di/get_it.dart';
import 'package:flutter_base/core/error/app_error.dart';
import 'package:flutter_base/features/jsonPlaceHolder/presentation/cubit/jph_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class JphPostsPage extends StatelessWidget implements AutoRouteWrapper {
  const JphPostsPage({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<JphCubit>()..fetchPosts(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JPH Posts')),
      body: Column(
        children: [
          SafeArea(
            child: BlocConsumer<JphCubit, JphState>(
              listener: (context, state) {
                if (state is JphError) {
                  return context.showSnackBar(
                    SnackBar(content: Text('Error: ${state.error}')),
                  );
                }
              },
              builder: (context, state) {
                if (state is JphLoading) {
                  return CircularProgressIndicator();
                } else if (state is JphError) {
                  return Text('Error: ${state.error}');
                } else if (state is JphLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                        );
                      },
                    ),
                  );
                }
                return Text('Press the button to fetch posts');
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension on BuildContext {
  void showSnackBar(SnackBar snackBar) {}
}
