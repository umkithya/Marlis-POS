import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malispos/app/module/sales/main_screnn/repository/sale_repo.dart';
import '../model/sale_model.dart';

class SaleController extends GetxController with StateMixin<SaleModel> {
  SaleController._();
  static final instance = SaleController._();
  factory SaleController() => instance;
  final saleRepo = SaleRepo();
  @override
  void onInit() {
    debugPrint("onInit sale controller");
    fetchSaleData();
    super.onInit();
  }

  int count = 0;
  void increase() {
    count = count + 1;
    update();
  }

  Future fetchSaleData() async {
    change(SaleModel(), status: RxStatus.loading());
    final response = await saleRepo.getSaleData();
    // ignore: unnecessary_null_comparison
    if (response != null) {
      change(response, status: RxStatus.success());
    } else {
      change(SaleModel(), status: RxStatus.empty());
    }
  }
}
