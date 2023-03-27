import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/module/home/view/home_screen.dart';
import 'package:malispos/app/module/sales/view/sale_view.dart';

import '../app/module/splash_screen/splash_screen.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: "/",
          pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                child: SplashScreen(key: state.pageKey),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              ),
          builder: (context, state) => SplashScreen(key: state.pageKey),
          routes: const []),
      GoRoute(
        path: "/dashboard",
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: HomeScreen(key: state.pageKey),
          transitionDuration: const Duration(milliseconds: 600),
          // reverseTransitionDuration: const Duration(milliseconds: 1500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              CircularRevealAnimation(
            animation: animation,
            child: child,
          ),
        ),
        builder: (context, state) => HomeScreen(key: state.pageKey),
        routes: [
          GoRoute(
            path: "sale",
            builder: (context, state) => SaleView(key: state.pageKey),
          )
        ],
      ),
    ],
  );
}
