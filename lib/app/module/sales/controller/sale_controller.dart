import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../product/model/product_model.dart';
import '../../product/widget/product_card.dart';
import '../model/sale_model.dart';
import '../repository/sale_repo.dart';

class SaleController extends GetxController with StateMixin<SaleModel> {
  SaleController._();
  static final instance = SaleController._();
  factory SaleController() => instance;
  final saleRepo = SaleRepo();
  final listSellProduct = <CartModel>[].obs;
  @override
  void onInit() {
    debugPrint("onInit sale controller");
    fetchSaleData();
    listSellProduct.addAll([
      CartModel(
          productList: ProductListModel(
              imageProduct: Assets.images.productPng.coca.path,
              nameProduct: 'Coca Cola',
              buy: 120,
              sell: 110,
              price: 2500,
              type: ProductStockType.low),
          qty: 3),
      CartModel(
          productList: ProductListModel(
            imageProduct: Assets.images.productPng.hotdog.path,
            nameProduct: 'Bet Ham SS',
            buy: 120,
            price: 1000,
            sell: 30,
          ),
          qty: 3),
      CartModel(
          productList: ProductListModel(
              nameProduct: 'Water Lemon',
              buy: 420,
              sell: 420,
              price: 2000,
              imageProduct: Assets.images.productPng.melon.path,
              type: ProductStockType.outofstock),
          qty: 6),
    ]);
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
