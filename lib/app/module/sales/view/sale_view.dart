import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sale_controller.dart';

class SaleView extends StatelessWidget {
  const SaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaleController>(
      init: SaleController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Sale Screen"),
        ),
        body: Center(child: Text(controller.count.toString())),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.increase(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
