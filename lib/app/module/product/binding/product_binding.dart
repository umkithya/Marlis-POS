import 'package:get/get.dart';
import 'package:malispos/app/module/product/controller/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }

}