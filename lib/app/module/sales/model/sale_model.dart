import '../../product/model/product_model.dart';

class SaleModel {
  List<Category>? listCategory;
  List<ProductListModel>? listProduct;
  SaleModel({this.listCategory, this.listProduct});
}

class Category {
  String? imagepath;
  String? name;
  Category({this.imagepath, this.name});
}

class CartModel {
  ProductListModel? productList;
  int? qty;
  CartModel({this.productList, this.qty});
}
