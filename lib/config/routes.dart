import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/main.dart';
import 'package:malispos/module/sales/view/sale_view.dart';

import '../core/splash_screen/splash_screen.dart';

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
          builder: (context, state) => MyHomePage(key: state.pageKey),
          routes: [
            GoRoute(
              path: "sale",
              builder: (context, state) => SaleView(key: state.pageKey),
            )
          ]),
    ],
  );
}
