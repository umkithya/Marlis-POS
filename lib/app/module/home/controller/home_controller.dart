import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:malispos/app/data/repositiory/product_repository.dart';

import '../../../data/model/product_model.dart';

class HomeController extends GetxController {
  final ProductRepository productRepository = ProductRepository();
  @override
  void onInit() {
    getProductData();
    super.onInit();
  }

  var state = DataState.onSuccess;
  List<ProductModel> itemList = <ProductModel>[];

  getProductData() async {
    state = DataState.onLoading;
    update();
    itemList = await productRepository.productList();

    debugPrint("list${itemList.length}");

    state = DataState.onSuccess;
    update();
  }
}

enum DataState {
  onLoading,
  onSuccess,
  onError,
}
