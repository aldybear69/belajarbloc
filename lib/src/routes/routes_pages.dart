import 'package:flutter/material.dart';

import '../utils/barrel_custom_navigator.dart';
import '../ui/pages/barrel_pages.dart';

part 'routes_name.dart';

class AppRoutes {
  static const initialRoute = RouteName.root;

  static Map<String, Widget Function(BuildContext)> routes = {
    RouteName.root: (context) => const HomePage(),
  };

  static routesWithTransition(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.firstPage:
        return NavTransition(
          child: const FirstPage(),
          type: NavTransitionType.rightToLeft,
          settings: routeSettings,
        );

      case RouteName.secondPage:
        return NavTransition(
          child: const SecondPage(),
          type: NavTransitionType.rightToLeft,
          settings: routeSettings,
        );

      case RouteName.counter:
        return NavTransition(
          child: const CounterPageDenganBlocProvider(),
          type: NavTransitionType.rightToLeft,
          settings: routeSettings,
        );

      case RouteName.counterTanpaBlockProvider:
        return NavTransition(
          child: const CounterPageTanpaBlocProvider(),
          type: NavTransitionType.rightToLeft,
          settings: routeSettings,
        );

      default:
        return debugPrint("ERR : NO ROUTE FOUND!");
    }
  }
}
