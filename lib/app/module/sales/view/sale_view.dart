import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sale_controller.dart';

class SaleView extends StatelessWidget {
  const SaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SaleController.instance.obx(
        (state) => Scaffold(
              appBar: AppBar(
                title: const Text("Sale Screen"),
              ),
              body: Center(child: Text(state!.id.toString())),
            ),
        onEmpty: const Text("data is empty"),
        onLoading: const Text("data is loading"),
        onError: (e) => const Text("data is error"));
  }
}
