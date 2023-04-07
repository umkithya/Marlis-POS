import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/module/bottom_naivigaton/view/widget/main_view.dart';

import '../../../core/values/app_colors.dart';
import 'widget/fab-button.view.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              colors: const [
                AppColors.colorPrimary,
                AppColors.colorPrimary,
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
                  id: 'home',
                  svgimage: 'assets/home.svg',
                  title: 'Home',
                ),
                PandaBarButtonData(
                    id: 'products',
                    svgimage: 'assets/product.svg',
                    title: 'Products'),
                PandaBarButtonData(
                    id: 'reports',
                    svgimage: 'assets/report.svg',
                    title: 'Reports'),
                PandaBarButtonData(
                    id: 'notification',
                    svgimage: 'assets/notificaiton.svg',
                    title: 'Notifications'),
              ],
              onChange: (id) {
                // setState(() {
                //   page = id;
                // });
              },
              onFabButtonPressed: () {},
              // BottomNavigationBar(
              //   selectedItemColor: const Color.fromARGB(255, 227, 82, 145),
              //   unselectedItemColor: const Color.fromARGB(255, 74, 38, 86),
              //   backgroundColor: const Color(0xff753a88),
              //   iconSize: 35,
              //   items: const <BottomNavigationBarItem>[
              //     BottomNavigationBarItem(
              //       backgroundColor: Color(0xffcc2b5e),
              //       icon: Icon(Icons.home),
              //       label: '',
              //     ),
              //     BottomNavigationBarItem(
              //       backgroundColor: Color(0xff753a88),
              //       icon: Icon(Icons.folder),
              //       label: '',
              //     ),
              //     BottomNavigationBarItem(
              //       backgroundColor: Color(0xff753a88),
              //       icon: Icon(Icons.folder),
              //       label: '',
              //     ),
              //     BottomNavigationBarItem(
              //       backgroundColor: Color(0xff753a88),
              //       icon: Icon(Icons.folder),
              //       label: '',
              //     ),
              //   ],
              //   currentIndex: _calculateSelectedIndex(context),
              //   onTap: (int idx) async {
              //     _onItemTapped(idx, context);
              //     if (idx == 0) {}
              //     if (idx == 1) {}
              //   },
              // ),
            ),
          )
        ],
      ),
    );
  }
}

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
