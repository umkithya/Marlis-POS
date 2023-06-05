import '../widget/product_card.dart';

class ProductsModel {
  int? id;
  int? totalProduct;
  int? stockInhand;
  List<ProductListModel>? listProduct;
  ProductsModel(
      {this.id, this.totalProduct, this.stockInhand, this.listProduct});
}

class ProductListModel {
  ProductStockType? type;
  String? imageProduct;
  String? nameProduct;
  int? buy, sell;
  int? price;
  ProductListModel(
      {this.price,
      this.imageProduct,
      this.nameProduct,
      this.type,
      this.buy,
      this.sell});
}
