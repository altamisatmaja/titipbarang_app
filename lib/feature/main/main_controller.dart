import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainController extends GetxController {
  String tag = 'Main::->';

  RxInt selectedIndex = RxInt(0);

  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  void onTabTapped(int index) {
    selectedIndex.value = index;
    persistentTabController.index = index;
  }

  @override
  void onClose() {
    persistentTabController.dispose();
    super.onClose();
  }
}
