import 'product_list_controller.dart';
import 'package:get/get.dart';

class ProductListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductListController());
  }
}