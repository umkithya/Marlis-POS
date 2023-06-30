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
import '../module/bottom_navigation_bar/view/bottom_navigation_bar.dart';
import '../module/home/view/home_screen.dart';
import '../module/sales/binding/sale_binding.dart';
import '../module/sales/binding/scan_binding.dart';
import '../module/sales/controller/sale_controller.dart';
import '../module/sales/controller/scan_controller.dart';
import '../module/sales/model/sale_model.dart';
import '../module/sales/view/make_payment_screen.dart';
import '../module/sales/view/sale_view.dart';
import '../module/sales/view/scan_page.dart';
import '../module/splash_screen/splash_screen.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRoute {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/sales',
    // redirect: (context, state) => "/sales",
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
          BindingRouter<SaleController>(
              path: '/sales',
              // parentNavigatorKey: _shellNavigatorKey,
              binding: SaleBinding(),
              builderPage: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    transitionDuration: const Duration(milliseconds: 0),
                    child: const SaleView(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
              routes: [
                BindingRouter<ScanController>(
                    path: 'scansale',
                    binding: ScanBinding(),
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const ScanPage(),
                    routes: [
                      GoRoute(
                          path: 'makepayment',
                          parentNavigatorKey: _rootNavigatorKey,
                          builder: (context, state) {
                            var listproduct =
                                state.extra as Map<String, dynamic>;
                            return MakePaymentScreen(
                              listProduct:
                                  listproduct['prductlist'] as List<CartModel>,
                            );
                          }),
                    ]),
              ]),
          BindingRouter<HomeController>(
              path: '/home',
              binding: HomeBinding(),
              builderPage: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    transitionDuration: const Duration(milliseconds: 0),
                    child: const HomeScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
              routes: [
                BindingRouter<ProductController>(
                  path: 'productsdetail',
                  binding: ProductBinding(),
                  parentNavigatorKey: _rootNavigatorKey,
                  builderPage: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    transitionDuration: const Duration(milliseconds: 0),
                    child: const ProductPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
              ]),
          BindingRouter<ProductController>(
            path: '/products',
            binding: ProductBinding(),
            builderPage: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 0),
              child: const ProductPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          BindingRouter<ReportController>(
            path: '/reports',
            binding: ReportBinding(),
            builderPage: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 0),
              child: const ReportPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),

          BindingRouter<NotificaitonController>(
            path: '/notifications',
            binding: NotificationBinding(),
            builderPage: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 0),
              child: const NotificationPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
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
                  reverseTransitionDuration: const Duration(seconds: 4),
                  transitionDuration: const Duration(seconds: 4));
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
