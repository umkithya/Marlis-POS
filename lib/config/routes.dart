
import 'package:go_router/go_router.dart';
import 'package:malispos/main.dart';
import 'package:malispos/module/sales/view/sale_view.dart';

class AppRoute{

  static final GoRouter router = GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) =>  MyHomePage(key: state.pageKey),
      routes: [
        GoRoute(
      path: "sale",
      builder: (context, state) =>  SaleView(key: state.pageKey),
    )
      ]
    ),
    
  ],
);
}