import 'package:get/get.dart';

class SaleController extends GetxController {
  @override
  void onInit() {
    print("onInit");
    super.onInit();
  }

  int count = 0;
  void increase() {
    count = count + 1;
    update();
  }
}
