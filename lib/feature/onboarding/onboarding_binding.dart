import 'package:titipbarang_app/feature/main/main_controller.dart';
import 'package:titipbarang_app/feature/main/tabs/home/home_controller.dart';
import 'package:titipbarang_app/feature/main/tabs/home/widgets/product/product_section_controller.dart';

import 'onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(OnboardingController());
    Get.put(ProductSectionController());
  }
}