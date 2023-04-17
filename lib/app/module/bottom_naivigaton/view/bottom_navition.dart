import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/module/bottom_naivigaton/view/widget/main_view.dart';

import '../../../core/values/app_colors.dart';
import 'widget/custom_drawer.dart';
import 'widget/fab-button.view.dart';

final advancedDrawerController = AdvancedDrawerController();

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, this.child});
  final Widget? child;
  final String home = "home";
  final String product = 'product';
  final String reposrts = 'reports';
  final String notification = 'notification';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AdvancedDrawer(
          drawer: const CustomDrawer(),
          backdropColor: appColors.colorPrimary.value,
          controller: advancedDrawerController,
          animationCurve: Curves.linearToEaseOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          // openScale: 0.9,
          openRatio: 0.7,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            // key: scaffoldKey,
            body: Stack(
              children: [
                child!,
                Positioned(
                  bottom: 35,
                  left: Get.width / 2 - 40,
                  child: PandaBarFabButton(
                    size: 70,
                    svgimage: 'assets/add order.svg',
                    onTap: () {},
                    colors: [
                      appColors.colorPrimary.value,
                      appColors.colorPrimary.value,
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: PandaBar(
                    buttonData: [
                      PandaBarButtonData(
                        id: BottomName.home,
                        svgimage: 'assets/home.svg',
                        title: 'Home',
                      ),
                      PandaBarButtonData(
                          id: BottomName.product,
                          svgimage: 'assets/product.svg',
                          title: 'Products'),
                      PandaBarButtonData(
                          id: BottomName.reports,
                          svgimage: 'assets/report.svg',
                          title: 'Reports'),
                      PandaBarButtonData(
                          id: BottomName.notificaiton,
                          svgimage: 'assets/notificaiton.svg',
                          title: 'Notifications'),
                    ],
                    onChange: (id) {
                      debugPrint(
                          "onchange idss $id . ${BottomName.product.name}");
                      switch (id) {
                        case BottomName.home:
                          debugPrint("onchange id $id");
                          _onItemTapped(0, context);
                          break;
                        case BottomName.product:
                          debugPrint("onchange id $id");
                          _onItemTapped(1, context);
                          break;
                        case BottomName.reports:
                          _onItemTapped(2, context);
                          break;
                        case BottomName.notificaiton:
                          _onItemTapped(3, context);
                          break;
                      }
                    },
                    onFabButtonPressed: () {
                      debugPrint("onfabbuttnon ");
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum BottomName { home, product, reports, notificaiton }

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).location;
  debugPrint("location==$location");
  if (location == ('/home')) {
    return 0;
  }
  if (location.startsWith('/products')) {
    return 1;
  }
  if (location.startsWith('/reports')) {
    return 2;
  }
  if (location.startsWith('/notifications')) {
    return 3;
  }
  return 0;
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      GoRouter.of(context).go('/home');
      break;
    case 1:
      GoRouter.of(context).go('/products');
      break;
    case 2:
      GoRouter.of(context).go('/reports');
      break;
    case 3:
      GoRouter.of(context).go('/notifications');
      break;
  }
}
