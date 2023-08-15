import 'package:flutter/material.dart';
import 'nav_transition.dart';

abstract class Nav {
  /// untuk back / kembali dari suatu screen ke screen sebelumnya
  static pop(BuildContext context) {
    return Navigator.pop(context);
  }

  /// untuk pindah dari screen 1 ke yang lainnya, menumpuk screen dan bisa kembali
  /// default push
  static push(Widget destination, BuildContext context,
      {bool? fullscreenDialog, bool? maintainState, RouteSettings? settings}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => destination,
            settings: settings,
            maintainState: maintainState ?? true,
            fullscreenDialog: fullscreenDialog ?? false));
  }

  /// untuk pindah dari screen 1 ke yang lainnya, menumpuk screen dan bisa kembali
  /// dengan transisi efek
  static pushWithTransition(
      {required Widget destination,
      required NavTransitionType transitionType,
      required BuildContext context,
      RouteSettings? settings,
      Curve? curve,
      Alignment? alignment,
      Duration? duration,
      Duration? reverseDuration,
      bool? fullscreenDialog}) {
    return Navigator.push(
        context,
        NavTransition(
            child: destination,
            type: transitionType,
            settings: settings,
            alignment: alignment,
            duration: duration,
            curve: curve,
            reverseDuration: reverseDuration,
            fullscreenDialog: fullscreenDialog));
  }

  // untuk pindah dari screen 1 ke yang lainnya, replace screen 1 jadi 2, tdk bs kembali
  static pushReplacement(Widget destination, BuildContext context) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => destination));
  }

  static pushNamed(String routeName, BuildContext context,
      {Object? arguments}) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static popAndPushNamed(String routeName, BuildContext context,
      {Object? arguments}) {
    return Navigator.popAndPushNamed(context, routeName, arguments: arguments);
  }

  static pushReplacementNamed(String routeName, BuildContext context,
      {Object? arguments}) {
    return Navigator.pushReplacementNamed(context, routeName,
        arguments: arguments);
  }
}

  // Contoh suatu argument :
  //  var arguments2 = <String, String>{
  //     'city': 'Berlin',
  //     'country': 'Germany',
  //   };