import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:malispos/app/module/home/controller/home_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../bottom_naivigaton/view/bottom_navition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        backgroundColor: appColors.colorBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // title: const Text("Home"),
          leading: GestureDetector(
              onTap: () {
                advancedDrawerController.showDrawer();
              },
              child: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, bottom: 5, top: 5),
                        child: SvgPicture.asset('assets/menu.svg',
                            color: appColors.colorPrimary.value,
                            key: ValueKey<bool>(value.visible)),
                      ),
                    );
                  })),
          actions: [
            actionsHome(),
            const SizedBox(
              width: 20,
            )
          ],
          elevation: 0,
        ),
        body: Container(child: const Text("home")),
      ),
    );
  }
}

Widget actionsHome() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.only(left: 8, right: 9),
    child: Row(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(70)),
        child: const Text("99"),
      ),
      const SizedBox(
        width: 12,
      ),
      SvgPicture.asset(
        'assets/cart.svg',
        color: appColors.colorPrimary.value,
      )
    ]),
  );
}
