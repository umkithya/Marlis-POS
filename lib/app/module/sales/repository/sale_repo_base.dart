import '../model/sale_model.dart';

abstract class SaleRepositoryBase {
  Future<SaleModel> getSaleData();
}
