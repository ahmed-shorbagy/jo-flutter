import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jo_univ_flutter/views/account_creation_view.dart';
import 'package:jo_univ_flutter/views/application_form_view.dart';
import 'package:jo_univ_flutter/views/home_view.dart';
import 'package:jo_univ_flutter/views/sign_in_view.dart';
import 'package:jo_univ_flutter/views/splash_view.dart';

import '../../views/application_status_view.dart';

/// Abstract class responsible for defining app routes and navigation.
/// Contains static constants for route paths and a `GoRouter` instance
/// configured with the defined routes and necessary dependencies.
abstract class AppRouter {
  static const String kSignInView = '/SignInView';

  static const String kAccountCreationView = '/accountCreationView';
  static const String kCoursesView = '/coursesView';
  static const String kApplicationView = '/applicationView';
  static const String kApplyView = '/applyView';
  static const String kExploreView = '/exploreView';
  static const String kProfileView = '/profileView';

  static const String kHomeView = '/homeView';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: kSignInView,
      pageBuilder: (context, state) => _fadeTransitionPage(
        child: SignInView(),
        duration: const Duration(milliseconds: 1000),
      ),
    ),
    GoRoute(
      path: kHomeView,
      pageBuilder: (context, state) => _fadeTransitionPage(
        child: const HomeView(),
        duration: const Duration(milliseconds: 1000),
      ),
    ),
    GoRoute(
      path: kAccountCreationView,
      pageBuilder: (context, state) => _fadeTransitionPage(
        child: const AccountCreationView(),
        duration: const Duration(milliseconds: 1000),
      ),
    ),
    GoRoute(
      path: kApplyView,
      pageBuilder: (context, state) => _fadeTransitionPage(
        child: const ApplicationFormView(),
        duration: const Duration(milliseconds: 1000),
      ),
    ),
    GoRoute(
      path: kApplicationView,
      pageBuilder: (context, state) => _fadeTransitionPage(
        child: const ApplicationStatusView(),
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
