import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/module/notification/view/notification.dart';
import 'package:malispos/app/module/product/view/product.dart';
import 'package:malispos/app/module/reports/view/reports.dart';

import '../app/module/bottom_naivigaton/view/bottom_navition.dart';
import '../app/module/home/view/home_screen.dart';
import '../app/module/splash_screen/splash_screen.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRoute {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      // / Application shell
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
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return BottomNavigation(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            pageBuilder: (_, s) {
              return CustomTransitionPage<void>(
                key: s.pageKey,
                child: const HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              );
            },
          ),
          GoRoute(
            // name: '/products',
            path: '/products',
            pageBuilder: (_, s) {
              return CustomTransitionPage<void>(
                key: s.pageKey,
                child: const ProductPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              );
            },
          ),
          GoRoute(
            path: '/reports',
            pageBuilder: (_, s) {
              return CustomTransitionPage<void>(
                key: s.pageKey,
                child: const ReportPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              );
            },
          ),
          GoRoute(
            path: '/notifications',
            pageBuilder: (_, s) {
              return CustomTransitionPage<void>(
                key: s.pageKey,
                child: const NotificationPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              );
            },
          ),
        ],
      ),
    ],
  );

//   static final GoRouter router = GoRouter(
//     initialLocation: "/",
//     debugLogDiagnostics: true,
//     routes: [
//       GoRoute(
//           path: "/",
//           pageBuilder: (context, state) => CustomTransitionPage<void>(
//                 key: state.pageKey,
//                 child: SplashScreen(key: state.pageKey),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) =>
//                         FadeTransition(opacity: animation, child: child),
//               ),
//           builder: (context, state) => SplashScreen(key: state.pageKey),
//           routes: const []),
//       GoRoute(
//         path: "/dashboard",
//         pageBuilder: (context, state) => CustomTransitionPage<void>(
//           key: state.pageKey,
//           child: HomeScreen(key: state.pageKey),
//           transitionDuration: const Duration(milliseconds: 600),
//           // reverseTransitionDuration: const Duration(milliseconds: 1500),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//               CircularRevealAnimation(
//             animation: animation,
//             child: child,
//           ),
//         ),
//         builder: (context, state) => HomeScreen(key: state.pageKey),
//         routes: [
//           GoRoute(
//             path: "sale",
//             builder: (context, state) => SaleView(key: state.pageKey),
//           )
//         ],
//       ),
//     ],
//   );
}
