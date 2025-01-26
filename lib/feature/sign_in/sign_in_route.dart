import 'sign_in_binding.dart';
import 'sign_in_page.dart';
import 'package:get/get.dart';

final signInRoute = [
  GetPage(
    name: SignInPage.route,
    page: () => const SignInPage(),
    binding: SignInBinding(),
  ),
];
