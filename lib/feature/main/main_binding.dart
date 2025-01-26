import 'package:titipbarang_app/feature/main/tabs/home/home_binding.dart';

import 'main_controller.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
    Get.put(MainController());
  }
}
