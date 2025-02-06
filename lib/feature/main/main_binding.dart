import 'package:titipbarang_app/feature/main/tabs/home/home_binding.dart';
import 'package:titipbarang_app/feature/main/tabs/home/home_controller.dart';
import 'package:titipbarang_app/feature/main/tabs/home/widgets/product/product_section_controller.dart';

import 'main_controller.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
    Get.put(MainController());
    Get.put(ProductSectionController());
  }
}
