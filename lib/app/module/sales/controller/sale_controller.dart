import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleController extends GetxController {
  SaleController._();
  static final instance = SaleController._();
  factory SaleController() => instance;

  @override
  void onInit() {
    debugPrint("onInit sale controller");

    super.onInit();
  }

  int count = 0;
  void increase() {
    count = count + 1;
    update();
  }
}
