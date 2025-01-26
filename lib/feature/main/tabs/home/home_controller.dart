import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/feature/main/tabs/home/widgets/product/product_section_controller.dart';

class HomeController extends GetxController {
  String tag = 'Home::->';

  Future<IndicatorResult> refreshPage() => Get.find<ProductSectionController>().refreshPage();
}
