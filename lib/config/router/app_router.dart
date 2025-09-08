import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: RouteTwo.page),
    AutoRoute(page: GetItTest.page),
    AutoRoute(page: JphPostsRoute.page, initial: true),
    AutoRoute(page: SliversRoute.page),
  ];
}
