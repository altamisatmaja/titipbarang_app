import 'profile_binding.dart';
import 'profile_page.dart';
import 'package:get/get.dart';

final profileRoute = [
  GetPage(
    name: ProfilePage.route,
    page: () => const ProfilePage(),
    binding: ProfileBinding(),
  ),
];