import 'package:binding_router/binding_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/module/home/Binding/home_binding.dart';
import 'package:malispos/app/module/home/controller/home_controller.dart';
import 'package:malispos/app/module/notification/Binding/notification_binding.dart';
import 'package:malispos/app/module/notification/controller/notification_controller.dart';
import 'package:malispos/app/module/notification/view/notification.dart';
import 'package:malispos/app/module/product/binding/product_binding.dart';
import 'package:malispos/app/module/product/controller/product_controller.dart';
import 'package:malispos/app/module/product/view/product.dart';
import 'package:malispos/app/module/reports/binding/report_binding.dart';
import 'package:malispos/app/module/reports/controller/report_controller.dart';
import 'package:malispos/app/module/reports/view/reports.dart';
import 'package:malispos/app/module/sales/binding/sale_binding.dart';
import 'package:malispos/app/module/sales/controller/sale_controller.dart';
import 'package:malispos/app/module/sales/view/sale_view.dart';

import '../module/bottom_naivigaton/view/bottom_navition.dart';
import '../module/home/view/home_screen.dart';
import '../module/splash_screen/splash_screen.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRoute {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/sales',
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
          BindingRouter(
            SaleController(),
            path: '/sales',
            // parentNavigatorKey: _shellNavigatorKey,
            binding: SaleBinding(),
            page: (context, state) => const SaleView(),
          ),
          BindingRouter(HomeController(),
              path: '/home',
              binding: HomeBinding(),
              page: (context, state) => const HomeScreen(),
              routes: [
                BindingRouter(
                  ProductController(),
                  path: 'productsdetail',
                  binding: ProductBinding(),
                  parentNavigatorKey: _rootNavigatorKey,
                  page: (context, state) => const ProductPage(),
                ),
              ]),
          BindingRouter(
            ProductController(),
            path: '/products',
            binding: ProductBinding(),
            page: (context, state) => const ProductPage(),
          ),
          BindingRouter(
            ReportController(),
            path: '/reports',
            binding: ReportBinding(),
            page: (context, state) => const ReportPage(),
          ),

          BindingRouter(
            NotificaitonController(),
            path: '/notifications',
            binding: NotificationBinding(),
            page: (context, state) => const NotificationPage(),
          ),
          //  BindingRouter(
          //   NotificaitonController(),
          //   path: '/notifications',
          //   binding: NotificationBinding(),
          //   page: (context, state) => const NotificationPage(),
          // ),
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
