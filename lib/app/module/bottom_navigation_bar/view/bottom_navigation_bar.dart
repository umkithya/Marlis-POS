// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';
import 'package:malispos/app/module/bottom_navigation_bar/view/widget/custom_drawer.dart';

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
          animateChildDecoration: true,
          rtlOpening: false,
          // openScale: 0.9,
          openRatio: 0.7,
          disabledGestures: true,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            // key: scaffoldKey,
            extendBody: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            resizeToAvoidBottomInset: false,
            floatingActionButton: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.primaryColor.withOpacity(.5),
                    width: 5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    "assets/images/add order.svg",
                    color: context.primaryColor,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              onTap: () {
                GoRouter.of(context).go('/sales');
              },
            ),

            body: child!,
            bottomNavigationBar: Container(
              height: 110,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.4),
                        // blurStyle: BlurStyle.outer,
                        blurRadius: 4,
                        spreadRadius: 1)
                  ]),
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
                              activeIcon: e.value.activeIcon!,
                              icon: e.value.icon!,
                              onTap: () {
                                _onItemTapped(e.key, context);
                              },
                              currentIndex: e.key,
                              onTapIndex: _calculateSelectedIndex(context),
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
    icon: PhosphorIcons.house,
    activeIcon: PhosphorIcons.house_fill,
    label: "Home",
  ),
  ItemModel(
    icon: PhosphorIcons.stack,
    activeIcon: PhosphorIcons.stack_fill,
    label: "Product",
  ),
  ItemModel(
    icon: PhosphorIcons.bell,
    activeIcon: PhosphorIcons.bell_fill,
    label: "Notification",
  ),
  ItemModel(
    icon: PhosphorIcons.files,
    activeIcon: PhosphorIcons.files_fill,
    label: "Report",
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
  if (location.startsWith('/notifications')) {
    return 2;
  }
  if (location.startsWith('/reports')) {
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
      GoRouter.of(context).go('/notifications');

      break;
    case 3:
      GoRouter.of(context).go('/reports');
      break;
  }
}