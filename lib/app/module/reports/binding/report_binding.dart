
import 'package:get/get.dart';
import 'package:malispos/app/module/reports/controller/report_controller.dart';


class ReportBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController());
  }

}