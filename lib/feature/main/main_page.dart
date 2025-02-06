import 'package:titipbarang_app/feature/main/tabs/activity/activity_page.dart';
import 'package:titipbarang_app/feature/main/tabs/home/home_page.dart';
import 'package:titipbarang_app/feature/main/tabs/information/information_page.dart';
import 'package:titipbarang_app/feature/main/tabs/profile/profile_page.dart';
import 'package:titipbarang_app/resources/resources.dart';

import 'main_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainPage extends GetView<MainController> {
  static const String route = '/main';

  const MainPage({super.key});

  List<PersistentBottomNavBarItem> _buildNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ClipRRect(
          child: SizedBox(
            height: 20,
            width: 20,
            child: controller.selectedIndex.value == 0
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
            child: controller.selectedIndex.value == 1
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
            child: controller.selectedIndex.value == 2
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
          borderRadius: BorderRadius.circular(
              10), // Optional: Add border radius if needed
          child: SizedBox(
            height: 20,
            width: 20,
            child: controller.selectedIndex.value == 3
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
  Widget build(BuildContext context) {
    return Obx(() => PersistentTabView(
          decoration: NavBarDecoration(border: Border.all(color: Colors.grey)),
          context,
          controller: controller.persistentTabController,
          screens: const [
            HomePage(),
            InformationPage(),
            ActivityPage(),
            ProfilePage(),
          ],
          items: _buildNavBarItems(),
          onItemSelected: (index) {
            controller.onTabTapped(index);
          },
          hideOnScrollSettings: const HideOnScrollSettings(
            hideNavBarOnScroll: true,
          ),
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          margin: EdgeInsets.zero,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          isVisible: true,
          navBarHeight: kBottomNavigationBarHeight,
          confineToSafeArea: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
          ),
          navBarStyle: NavBarStyle.style3,
          bottomScreenMargin: 0,
        ));
  }
}
