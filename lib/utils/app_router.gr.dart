// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter_base/R&D/my_home_page.dart' as _i1;
import 'package:flutter_base/R&D/page_two.dart' as _i2;

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i3.PageRouteInfo<void> {
  const MyHomeRoute({List<_i3.PageRouteInfo>? children})
    : super(MyHomeRoute.name, initialChildren: children);

  static const String name = 'MyHomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.MyHomePage();
    },
  );
}

/// generated route for
/// [_i2.PageTwo]
class RouteTwo extends _i3.PageRouteInfo<void> {
  const RouteTwo({List<_i3.PageRouteInfo>? children})
    : super(RouteTwo.name, initialChildren: children);

  static const String name = 'RouteTwo';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.PageTwo();
    },
  );
}
