import 'package:get/get.dart';
import 'package:malispos/app/module/product/model/product_model.dart';

import '../repository/product_repository.dart';

class ProductController extends GetxController with StateMixin<ProductsModel> {
  ProductController._();
  static final instance = ProductController._();
  factory ProductController() => instance;
  final productrepo = ProductRepo();

  @override
  void onInit() {
    fetctProductData();
    super.onInit();
  }

  Future fetctProductData() async {
    change(ProductsModel(), status: RxStatus.loading());
    final response = await productrepo.getProductData();
    // ignore: unnecessary_null_comparison
    if (response != null) {
      change(response, status: RxStatus.success());
    } else {
      change(ProductsModel(), status: RxStatus.empty());
    }
  }
}
