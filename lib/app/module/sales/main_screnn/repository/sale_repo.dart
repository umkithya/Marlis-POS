import 'package:malispos/app/module/product/model/product_model.dart';
import 'package:malispos/app/module/sales/main_screnn/model/sale_model.dart';
import 'package:malispos/app/module/sales/main_screnn/repository/sale_repo_base.dart';
import 'package:malispos/gen/assets.gen.dart';

import '../../../product/widget/product_card.dart';

class SaleRepo extends SaleRepositoryBase {
  @override
  Future<SaleModel> getSaleData() async {
    SaleModel? response;
    await Future.delayed(const Duration(milliseconds: 500), () {
      response = SaleModel(listCategory: [
        Category(imagepath: Assets.images.saleImage.food1, name: "food1"),
        Category(imagepath: Assets.images.saleImage.food2, name: "food2"),
        Category(imagepath: Assets.images.saleImage.food3, name: "food3"),
        Category(imagepath: Assets.images.saleImage.food4, name: "food4"),
        Category(imagepath: Assets.images.saleImage.food1, name: "food1"),
        Category(imagepath: Assets.images.saleImage.food2, name: "food2"),
        Category(imagepath: Assets.images.saleImage.food3, name: "food3"),
        Category(imagepath: Assets.images.saleImage.food4, name: "food4")
      ], listProduct: [
        ProductListModel(
          price: 12,
          imageProduct: Assets.images.productPng.coca.path,
          nameProduct: 'Coca Cola',
          buy: 120,
          sell: 110,
          type: ProductStockType.low,
        ),
        ProductListModel(
          price: 14,
          imageProduct: Assets.images.productPng.hotdog.path,
          nameProduct: 'Bet Ham SS',
          buy: 120,
          sell: 30,
        ),
        ProductListModel(
            price: 15,
            nameProduct: 'Water Lemon',
            buy: 420,
            sell: 420,
            imageProduct: Assets.images.productPng.melon.path,
            type: ProductStockType.outofstock),
        ProductListModel(
          price: 12,
          imageProduct: Assets.images.productPng.coca.path,
          nameProduct: 'Coca Cola',
          buy: 120,
          sell: 110,
          type: ProductStockType.low,
        ),
        ProductListModel(
          price: 14,
          imageProduct: Assets.images.productPng.hotdog.path,
          nameProduct: 'Bet Ham SS',
          buy: 120,
          sell: 30,
        ),
        ProductListModel(
            price: 15,
            nameProduct: 'Water Lemon',
            buy: 420,
            sell: 420,
            imageProduct: Assets.images.productPng.melon.path,
            type: ProductStockType.outofstock),
        ProductListModel(
          price: 12,
          imageProduct: Assets.images.productPng.coca.path,
          nameProduct: 'Coca Cola',
          buy: 120,
          sell: 110,
          type: ProductStockType.low,
        ),
        ProductListModel(
          price: 14,
          imageProduct: Assets.images.productPng.hotdog.path,
          nameProduct: 'Bet Ham SS',
          buy: 120,
          sell: 30,
        ),
        ProductListModel(
            price: 15,
            nameProduct: 'Water Lemon',
            buy: 420,
            sell: 420,
            imageProduct: Assets.images.productPng.melon.path,
            type: ProductStockType.outofstock)
      ]);
    });
    if (response != null) return response!;
    return SaleModel();
  }
}
