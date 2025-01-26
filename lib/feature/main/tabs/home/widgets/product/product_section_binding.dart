import 'product_section_controller.dart';
import 'package:get/get.dart';

class ProductSectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductSectionController());
  }
}