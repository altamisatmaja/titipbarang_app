import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:titipbarang_app/resources/resources.dart';

class MainController extends GetxController {
  String tag = 'Main::->';

  RxInt selectedIndex = RxInt(0);

  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  void onTabTapped(int index) {
    selectedIndex.value = index;
    persistentTabController.index = index;
  }

  List<PersistentBottomNavBarItem> buildNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ClipRRect(
          child: SizedBox(
            height: 20,
            width: 20,
            child: selectedIndex.value == 0
                ? AppAssets.icon.homeActiveIcon.image()
                : AppAssets.icon.homeUnactiveIcon.image(),
          ),
        ),
        title: 'txt_home'.tr,
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ClipRRect(
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            height: 20,
            width: 20,
            child: selectedIndex.value == 1
                ? AppAssets.icon.informationActiveIcon.image()
                : AppAssets.icon.informationUnactiveIcon.image(),
          ),
        ),
        title: 'txt_information'.tr,
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ClipRRect(
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            height: 20,
            width: 20,
            child: selectedIndex.value == 2
                ? AppAssets.icon.activityActiveIcon.image()
                : AppAssets.icon.activityUnactiveIcon.image(),
          ),
        ),
        title: 'txt_activity'.tr,
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ClipRRect(
          child: SizedBox(
            height: 20,
            width: 20,
            child: selectedIndex.value == 3
                ? AppAssets.icon.profileActiveIcon.image()
                : AppAssets.icon.profileUnactiveIcon.image(),
          ),
        ),
        title: 'txt_profile'.tr,
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.grey,
      ),
    ];
  }

  @override
  void onClose() {
    persistentTabController.dispose();
    super.onClose();
  }
}
