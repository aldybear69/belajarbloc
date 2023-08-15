part of 'nav_transition.dart';

enum NavTransitionType {
  /// Left to right animation
  leftToRight,

  /// Right to left animation
  rightToLeft,

  /// bottom the top animation
  bottomToTop,

  /// Top the bottom animation
  topToBottom,

  /// Fade Animation
  fade,

  /// Rotate animation
  rotate,

  /// Scale animation,
  /// can be custom the Curve (default Curves.bounceIn);
  scale,

  /// Size animation,
  /// can be custom the Curve (default Curves.bounceIn);
  size,

  /// Left to right with fading animation,
  /// can be custom the Curve (default Curves.bounceIn);
  leftToRightWithFade,

  /// Right to left with fading animation,
  /// can be custom the Curve (default Curves.bounceIn);
  rightToLeftWithFade,
}
