import 'loading_binding.dart';
import 'loading_page.dart';
import 'package:get/get.dart';

final loadingRoute = [
  GetPage(
    name: LoadingPage.route,
    page: () => const LoadingPage(),
    binding: LoadingBinding(),
  ),
];