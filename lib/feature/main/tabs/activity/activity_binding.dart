import 'activity_controller.dart';
import 'package:get/get.dart';

class ActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ActivityController());
  }
}