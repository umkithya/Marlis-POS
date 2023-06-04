class SaleModel {
  int? id;
  int? totalProduct;
  int? stockInhand;
  List<ProductModel>? listProduct;
  SaleModel({this.id, this.totalProduct, this.stockInhand, this.listProduct});
}

class ProductModel {
  String? imageProduct;
  String? nameProduct;
  ProductModel({this.imageProduct, this.nameProduct});
}
