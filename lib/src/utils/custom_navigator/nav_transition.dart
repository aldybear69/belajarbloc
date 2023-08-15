import 'package:flutter/material.dart';
part 'nav_enum.dart';

class NavTransition<T> extends PageRouteBuilder<T> {
  NavTransition({
    Key? key,
    required Widget child,
    required NavTransitionType type,
    BuildContext? ctx,
    bool inheritTheme = false,
    bool maintainState = true,
    Curve? curve,
    Alignment? alignment,
    Duration? duration,
    Duration? reverseDuration,
    bool? fullscreenDialog, // => default false,
    bool? opaque, // => default true,
    RouteSettings? settings,
  })  : assert(inheritTheme ? ctx != null : true,
            "set ctx = context if inheritTheme = true"),
        super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return inheritTheme
                ? InheritedTheme.captureAll(
                    ctx!,
                    child,
                  )
                : child;
          },
          opaque: opaque ?? true,
          fullscreenDialog: fullscreenDialog ?? false,
          transitionDuration: duration ??= const Duration(milliseconds: 200),
          reverseTransitionDuration: reverseDuration ??=
              const Duration(milliseconds: 200),
          settings: settings,
          maintainState: maintainState,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            switch (type) {
              case NavTransitionType.fade:
                return FadeTransition(opacity: animation, child: child);
                // ignore: dead_code
                break;

              case NavTransitionType.leftToRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                // ignore: dead_code
                break;

              case NavTransitionType.rightToLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                // ignore: dead_code
                break;

              case NavTransitionType.bottomToTop:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                // ignore: dead_code
                break;

              case NavTransitionType.topToBottom:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
                // ignore: dead_code
                break;

              case NavTransitionType.rotate:
                return RotationTransition(
                  alignment: alignment ?? Alignment.center,
                  turns: animation,
                  child: ScaleTransition(
                    alignment: alignment ?? Alignment.center,
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                );
                // ignore: dead_code
                break;

              /// can be custom the Curve (default Curves.bounceIn);
              case NavTransitionType.scale:
                return ScaleTransition(
                  alignment: alignment ?? Alignment.center,
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Interval(
                      0.00,
                      0.50,
                      curve: curve ?? Curves.linear,
                    ),
                  ),
                  child: child,
                );
                // ignore: dead_code
                break;

              /// can be custom the Curve (default Curves.bounceIn);
              case NavTransitionType.size:
                return Align(
                  alignment: alignment ?? Alignment.center,
                  child: SizeTransition(
                    sizeFactor: CurvedAnimation(
                      parent: animation,
                      curve: curve ?? Curves.linear,
                    ),
                    child: child,
                  ),
                );
                // ignore: dead_code
                break;

              /// can be custom the Curve (default Curves.bounceIn)
              case NavTransitionType.rightToLeftWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve ?? Curves.linear,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
                // ignore: dead_code
                break;

              /// can be custom the Curve (default Curves.bounceIn);
              case NavTransitionType.leftToRightWithFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: curve ?? Curves.linear,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
                // ignore: dead_code
                break;

              default:
                return FadeTransition(opacity: animation, child: child);
            }
          },
        );
}
