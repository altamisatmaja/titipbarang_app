import 'information_binding.dart';
import 'information_page.dart';
import 'package:get/get.dart';

final informationRoute = [
  GetPage(
    name: InformationPage.route,
    page: () => const InformationPage(),
    binding: InformationBinding(),
  ),
];