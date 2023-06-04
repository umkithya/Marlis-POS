import 'package:malispos/app/module/sales/model/sale_model.dart';
import 'package:malispos/app/module/sales/repository/sale_repository_base.dart';
import 'package:malispos/gen/assets.gen.dart';

class SaleRepo extends SaleRepositoryBase {
  @override
  Future<SaleModel> getSaleData() async {
    var response;
    await Future.delayed(const Duration(seconds: 3), () {
      response =
          SaleModel(id: 1, totalProduct: 2000, stockInhand: 1400, listProduct: [
        ProductModel(
          imageProduct: 'coca',
          nameProduct: 'coca',
        ),
        ProductModel(
          imageProduct: 'pipsi',
          nameProduct: 'pipsi',
        ),
        ProductModel(nameProduct: 'ganzberg', imageProduct: Assets.ganzberg)
      ]);
    });
    if (response != null) return response;
    return SaleModel();
  }
}
