import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/module/bottom_naivigaton/view/widget/custom_drawer.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';
import 'widget/custom_itembar.dart';
import 'widget/itembar_model.dart';

final advancedDrawerController = AdvancedDrawerController();

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, this.child});
  final Widget? child;

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
          animateChildDecoration: false,
          rtlOpening: false,
          // openScale: 0.9,
          openRatio: 0.7,
          disabledGestures: true,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            // key: scaffoldKey,

            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                GoRouter.of(context).go('/sales');
                // GoRouterState.of(context).location.startsWith("/sales");
              },
              shape: const CircleBorder(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.images.addOrder,
                    color: GoRouterState.of(context).location == "/sales"
                        ? AppColors.pageBackground
                        : AppColors.colorUnselect,
                  ),
                  Text("Sales",
                      style: TextStyle(
                          fontWeight:
                              GoRouterState.of(context).location == "/sales"
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                          fontSize: 10))
                ],
              ),
            ),
            body: child!,
            bottomNavigationBar: BottomAppBar(
              // ****** APP BAR ******************
              // surfaceTintColor: Colors.red,
              color: Theme.of(context).primaryColor,
              clipBehavior: Clip.antiAlias,
              shape: const CircularNotchedRectangle(),
              notchMargin: 6,
              padding: const EdgeInsets.all(0),
              shadowColor: Colors.transparent,
              elevation: 10,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...listItem
                      .asMap()
                      .entries
                      .map((e) => Padding(
                            padding: EdgeInsets.only(
                                left: e.key == 2 ? 30 : 0,
                                right: e.key == 1 ? 30 : 0),
                            child: ItemBar(
                              activeAssetPath: e.value.activeImagePath!,
                              onTap: () {
                                // Get.put(BottomNavigationBarController())
                                //     .currentIndex
                                //     .value = e.key;
                                _onItemTapped(e.key, context);
                              },
                              currentIndex: e.key,
                              onTapIndex: _calculateSelectedIndex(context),
                              assetPath: e.value.imagePath!,
                              label: e.value.label!,
                            ),
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

final listItem = <ItemModel>[
  ItemModel(
    imagePath: Assets.images.home,
    activeImagePath: Assets.images.home,
    label: "Home",
  ),
  ItemModel(
    imagePath: Assets.images.product,
    activeImagePath: Assets.images.product,
    label: "Products",
  ),
  ItemModel(
    imagePath: Assets.images.report,
    activeImagePath: Assets.images.report,
    label: "Reports",
  ),
  ItemModel(
    imagePath: Assets.images.notificaiton,
    activeImagePath: Assets.images.notificaiton,
    label: "Notificaiton",
  ),
];

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
  return 4;
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
