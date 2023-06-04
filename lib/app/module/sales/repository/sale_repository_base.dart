import 'package:malispos/app/module/sales/model/sale_model.dart';

abstract class SaleRepositoryBase {
  Future<SaleModel> getSaleData();
}
