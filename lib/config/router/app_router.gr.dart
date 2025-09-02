// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter_base/features/jsonPlaceHolder/presentation/pages/jph_posts.dart'
    as _i2;
import 'package:flutter_base/features/R&D/get_it/get_it_test.dart' as _i1;
import 'package:flutter_base/features/R&D/my_home_page.dart' as _i3;
import 'package:flutter_base/features/R&D/page_two.dart' as _i4;

/// generated route for
/// [_i1.GetItTest]
class GetItTest extends _i5.PageRouteInfo<void> {
  const GetItTest({List<_i5.PageRouteInfo>? children})
    : super(GetItTest.name, initialChildren: children);

  static const String name = 'GetItTest';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.GetItTest();
    },
  );
}

/// generated route for
/// [_i2.JphPostsPage]
class JphPostsRoute extends _i5.PageRouteInfo<void> {
  const JphPostsRoute({List<_i5.PageRouteInfo>? children})
    : super(JphPostsRoute.name, initialChildren: children);

  static const String name = 'JphPostsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.WrappedRoute(child: const _i2.JphPostsPage());
    },
  );
}

/// generated route for
/// [_i3.MyHomePage]
class MyHomeRoute extends _i5.PageRouteInfo<void> {
  const MyHomeRoute({List<_i5.PageRouteInfo>? children})
    : super(MyHomeRoute.name, initialChildren: children);

  static const String name = 'MyHomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.MyHomePage();
    },
  );
}

/// generated route for
/// [_i4.PageTwo]
class RouteTwo extends _i5.PageRouteInfo<void> {
  const RouteTwo({List<_i5.PageRouteInfo>? children})
    : super(RouteTwo.name, initialChildren: children);

  static const String name = 'RouteTwo';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.PageTwo();
    },
  );
}
