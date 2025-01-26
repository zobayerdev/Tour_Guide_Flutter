// ignore_for_file: prefer_const_constructors

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../gen/assets.gen.dart';

final options = LiveOptions(
  // Start animation after (default zero)
  delay: Duration(seconds: 1),

  // Show each item through (default 250)
  showItemInterval: Duration(milliseconds: 500),

  // Animation duration (default 250)
  showItemDuration: Duration(seconds: 1),

  // Animations starts at 0.05 visible
  // item fraction in sight (default 0.025)
  visibleFraction: 0.05,

  // Repeat the animation of the appearance
  // when scrolling in the opposite direction (default false)
  // To get the effect as in a showcase for ListView, set true
  reAnimateOnVisibility: false,
);

Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

Widget Function(
  BuildContext context,
  Animation<double> animation,
) animationBuilder(
  Widget child, {
  double xOffset = 0,
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(xOffset, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );

Widget Function(BuildContext context, Widget child,
    ImageChunkEvent? loadingProgress) imageSimmer(
        double? size) =>
    (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return child;
      }
      return Center(
        child:
            Lottie.asset(Assets.lottie.imageShimmer, height: size, width: size),
      );
    };

Widget imageSimmerCached(double? height) {
  return SizedBox(
    height: height,
    child: Center(
      child: Lottie.asset(Assets.lottie.imageShimmer,
          height: height, width: height),
    ),
  );
}

Widget imageNotFound(double? height) {
  return Image.asset(
    Assets.images.errorImage.path,
    height: height,
    width: height,
  );
}
