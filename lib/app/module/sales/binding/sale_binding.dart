import 'package:get/get.dart';

import '../controller/sale_controller.dart';

class SaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaleController());
  }
}
