import 'package:titipbarang_app/feature/main/tabs/history/history_page.dart';
import 'package:titipbarang_app/feature/main/tabs/home/home_page.dart';
import 'package:titipbarang_app/feature/main/tabs/profile/profile_page.dart';
import 'package:titipbarang_app/resources/resources.dart';

import 'main_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainPage extends GetView<MainController> {
  static const String route = '/main';

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => PersistentTabView(
          decoration: NavBarDecoration(border: Border.all(color: Colors.grey)),
          context,
          controller: controller.persistentTabController,
          screens: const [
            HomePage(),
            HistoryPage(),
            ProfilePage(),
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.home_filled),
              title: 'txt_home'.tr,
              activeColorPrimary: AppColors.primary,
              inactiveColorPrimary: AppColors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.message),
              title: 'txt_history'.tr,
              activeColorPrimary: AppColors.primary,
              inactiveColorPrimary: AppColors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.person),
              title: 'txt_profile'.tr,
              activeColorPrimary: AppColors.primary,
              inactiveColorPrimary: AppColors.grey,
            ),
          ],
          hideOnScrollSettings: const HideOnScrollSettings(hideNavBarOnScroll: true,),
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
        );
}
