import 'package:malispos/app/module/product/model/product_model.dart';

abstract class ProductRepositoryBase {
  Future<ProductsModel> getProductData();
}
