// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter_base/features/R&D/get_it/get_it_test.dart' as _i1;
import 'package:flutter_base/features/R&D/my_home_page.dart' as _i2;
import 'package:flutter_base/features/R&D/page_two.dart' as _i3;

/// generated route for
/// [_i1.GetItTest]
class GetItTest extends _i4.PageRouteInfo<void> {
  const GetItTest({List<_i4.PageRouteInfo>? children})
    : super(GetItTest.name, initialChildren: children);

  static const String name = 'GetItTest';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.GetItTest();
    },
  );
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<void> {
  const MyHomeRoute({List<_i4.PageRouteInfo>? children})
    : super(MyHomeRoute.name, initialChildren: children);

  static const String name = 'MyHomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.MyHomePage();
    },
  );
}

/// generated route for
/// [_i3.PageTwo]
class RouteTwo extends _i4.PageRouteInfo<void> {
  const RouteTwo({List<_i4.PageRouteInfo>? children})
    : super(RouteTwo.name, initialChildren: children);

  static const String name = 'RouteTwo';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.PageTwo();
    },
  );
}
