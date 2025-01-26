import 'loading_controller.dart';
import 'package:get/get.dart';

class LoadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoadingController());
  }
}