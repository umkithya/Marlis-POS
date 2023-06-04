import 'package:get/get.dart';
import 'package:malispos/app/module/sales/controller/sale_controller.dart';

class SaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaleController());
  }
}
