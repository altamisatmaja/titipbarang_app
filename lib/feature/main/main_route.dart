import 'main_binding.dart';
import 'main_page.dart';
import 'package:get/get.dart';

final mainRoute = [
  GetPage(
    name: MainPage.route,
    page: () => const MainPage(),
    binding: MainBinding(),
  ),
];