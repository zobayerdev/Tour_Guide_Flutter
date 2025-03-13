import 'dart:io';

import 'package:boylar_plate/features/auth_screen/forget_pass_screen/presentation/forget_pass_screen.dart';
import 'package:boylar_plate/features/auth_screen/new_pass_screen/presentation/new_pass_screen.dart';
import 'package:boylar_plate/features/auth_screen/otp_screen/presentation/otp_screen.dart';
import 'package:boylar_plate/features/auth_screen/sign_in_screen/presentation/sign_in_screen.dart';
import 'package:boylar_plate/features/auth_screen/sign_up_screen/presentation/sign_up_screen.dart';
import 'package:boylar_plate/features/exprole_screen/presentation/details_screen.dart';
import 'package:boylar_plate/features/home_screen/presentation/home_screen.dart';
import 'package:boylar_plate/features/notification_screen/presentation/notification.dart';
import 'package:boylar_plate/features/profile_screen/presentation/edit_profile_screen.dart';
import 'package:boylar_plate/features/profile_screen/presentation/profile_screen.dart';
import 'package:boylar_plate/navigation_screen.dart';
import 'package:flutter/cupertino.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  // ################## Auth User #####################
  static const String signInScreen = '/sign_in_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String forgotPassScreen = '/forget_password_screen';
  static const String createNewPassScreen = '/create-new_password_screen';
  static const String userOTPScreen = '/user_otp_screen';

  // ################## Navigation Screen #####################
  static const String navigationScreen = '/navigation_screen';

  // ################## Home User #############################
  static const String homeScreen = '/home_screen';

  // ################## Profile User #############################
  static const String profileScreen = '/profile_screen';
  static const String editProfileScreen = '/edit_profile_screen';

  // ################## Explore User #############################
  static const String exploreScreen = '/explore_screen';
  static const String detailsScreen = '/details_screen';

  // ################## Notification User #############################
  static const String notificationScreen = '/notification_screen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: SignInScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => SignInScreen());

      case Routes.signUpScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: SignUpScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => SignUpScreen());

      case Routes.forgotPassScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ForgetPassScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => ForgetPassScreen());

      case Routes.createNewPassScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CreateNewPassScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => CreateNewPassScreen());

      case Routes.userOTPScreen:
        final Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: UserOTPScreen(
                  email: args['email'],
                  action: args['action'],
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => UserOTPScreen(
                  email: args['email'],
                  action: args['action'],
                ),
              );

      case Routes.homeScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: HomeScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => HomeScreen());

      case Routes.navigationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: NavigationScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => NavigationScreen());

      case Routes.detailsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: DetailsScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => DetailsScreen());

      case Routes.profileScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: ProfileScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => ProfileScreen());

      case Routes.editProfileScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: EditProfileScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => EditProfileScreen());

      case Routes.notificationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: NotificationScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => NotificationScreen());

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
