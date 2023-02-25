// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../modules/game/game_screen.dart' as _i3;
import '../../modules/high_scores/high_scores_screen.dart' as _i4;
import '../../modules/instructions/instructions_screen.dart' as _i2;
import '../screens/menu_screen.dart' as _i1;

class AppAutoRouter extends _i5.RootStackRouter {
  AppAutoRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MenuRoute.name: (routeData) {
      return _i5.CustomPage<void>(
          routeData: routeData,
          child: const _i1.MenuScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    InstructionsRoute.name: (routeData) {
      return _i5.CustomPage<void>(
          routeData: routeData,
          child: const _i2.InstructionsScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    GameRoute.name: (routeData) {
      return _i5.CustomPage<void>(
          routeData: routeData,
          child: const _i3.GameScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    HighScoresRoute.name: (routeData) {
      return _i5.CustomPage<void>(
          routeData: routeData,
          child: const _i4.HighScoresScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(MenuRoute.name, path: '/'),
        _i5.RouteConfig(InstructionsRoute.name, path: '/instructions-screen'),
        _i5.RouteConfig(GameRoute.name, path: '/game-screen'),
        _i5.RouteConfig(HighScoresRoute.name, path: '/high-scores-screen')
      ];
}

/// generated route for [_i1.MenuScreen]
class MenuRoute extends _i5.PageRouteInfo<void> {
  const MenuRoute() : super(name, path: '/');

  static const String name = 'MenuRoute';
}

/// generated route for [_i2.InstructionsScreen]
class InstructionsRoute extends _i5.PageRouteInfo<void> {
  const InstructionsRoute() : super(name, path: '/instructions-screen');

  static const String name = 'InstructionsRoute';
}

/// generated route for [_i3.GameScreen]
class GameRoute extends _i5.PageRouteInfo<void> {
  const GameRoute() : super(name, path: '/game-screen');

  static const String name = 'GameRoute';
}

/// generated route for [_i4.HighScoresScreen]
class HighScoresRoute extends _i5.PageRouteInfo<void> {
  const HighScoresRoute() : super(name, path: '/high-scores-screen');

  static const String name = 'HighScoresRoute';
}
