import 'package:titipbarang_app/feature/main/tabs/history/history_page.dart';
import 'package:titipbarang_app/feature/main/tabs/home/home_page.dart';
import 'package:titipbarang_app/feature/main/tabs/profile/profile_page.dart';

import 'main_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainPage extends GetView<MainController> {
  static const String route = '/main';

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              HomePage(),
              HistoryPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home_filled),
                label: 'txt_home'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.receipt_outlined),
                activeIcon: const Icon(Icons.receipt),
                label: 'txt_history'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                activeIcon: const Icon(Icons.person),
                label: 'txt_profile'.tr,
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (value) => controller.selectedIndex.value = value,
          ),
        ),
      );
}
