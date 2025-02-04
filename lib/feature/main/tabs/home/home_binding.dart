import 'package:titipbarang_app/feature/main/tabs/home/widgets/product/product_section_binding.dart';

import 'home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    ProductSectionBinding().dependencies();
    Get.put(HomeController());
  }
}
