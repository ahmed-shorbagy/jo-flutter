import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Abstract class responsible for defining app routes and navigation.
/// Contains static constants for route paths and a `GoRouter` instance
/// configured with the defined routes and necessary dependencies.
abstract class AppRouter {
  static const String kSignInView = '/SignInView';
  static const String kSignupView = '/signupView';

  static final router = GoRouter(routes: []);

  static Page<dynamic> _fadeTransitionPage(
      {required Widget child, required Duration duration}) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: duration,
    );
  }
}
