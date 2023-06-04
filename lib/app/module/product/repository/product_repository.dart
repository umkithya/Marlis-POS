import 'package:malispos/app/module/product/model/product_model.dart';
import 'package:malispos/app/module/product/repository/product_repository_base.dart';
import 'package:malispos/gen/assets.gen.dart';

import '../widget/product_card.dart';

class ProductRepo extends ProductRepositoryBase {
  @override
  Future<ProductsModel> getProductData() async {
    var response;
    await Future.delayed(const Duration(milliseconds: 500), () {
      response = ProductsModel(
          id: 1,
          totalProduct: 2000,
          stockInhand: 1400,
          listProduct: [
            ProductListModel(
                imageProduct: Assets.images.salePng.coca.path,
                nameProduct: 'Coca Cola',
                buy: 120,
                sell: 110,
                type: ProductStockType.low),
            ProductListModel(
              imageProduct: Assets.images.salePng.hotdog.path,
              nameProduct: 'Bet Ham SS',
              buy: 120,
              sell: 30,
            ),
            ProductListModel(
                nameProduct: 'Water Lemon',
                buy: 420,
                sell: 420,
                imageProduct: Assets.images.salePng.melon.path,
                type: ProductStockType.outofstock)
          ]);
    });
    if (response != null) return response;
    return ProductsModel();
  }
}
