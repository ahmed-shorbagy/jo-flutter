import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jo_univ_flutter/views/home_view.dart';
import 'package:jo_univ_flutter/views/sign_in_view.dart';
import 'package:jo_univ_flutter/views/splash_view.dart';

/// Abstract class responsible for defining app routes and navigation.
/// Contains static constants for route paths and a `GoRouter` instance
/// configured with the defined routes and necessary dependencies.
abstract class AppRouter {
  static const String kSignInView = '/SignInView';

  static const String kHomeView = '/homeView';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: kSignInView,
      pageBuilder: (context, state) => _fadeTransitionPage(
        child: AccountCreationScreen(),
        duration: const Duration(milliseconds: 1000),
      ),
    ),
    GoRoute(
      path: kHomeView,
      pageBuilder: (context, state) => _fadeTransitionPage(
        child: const HomeView(),
        duration: const Duration(milliseconds: 1000),
      ),
    )
  ]);

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
