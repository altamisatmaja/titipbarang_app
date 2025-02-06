import 'information_controller.dart';
import 'package:get/get.dart';

class InformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InformationController());
  }
}