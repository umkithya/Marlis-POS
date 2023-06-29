import 'package:get/instance_manager.dart';

import '../controller/bottom_nav_controller.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarController());
  }
}
