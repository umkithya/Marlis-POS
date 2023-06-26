import 'package:get/get.dart';
import 'package:malispos/app/module/sales/controller/scan_controller.dart';

class ScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanController());
  }
}
