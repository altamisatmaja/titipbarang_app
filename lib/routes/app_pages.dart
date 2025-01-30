import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:titipbarang_app/feature/loading/loading_page.dart';
import 'package:titipbarang_app/feature/loading/loading_route.dart';
import 'package:titipbarang_app/feature/onboarding/onboarding_route.dart';
import 'package:titipbarang_app/feature/product/detail/product_detail_route.dart';
import 'package:titipbarang_app/feature/product/list/product_list_route.dart';
import 'package:titipbarang_app/feature/sign_in/sign_in_route.dart';
import 'package:titipbarang_app/feature/main/main_route.dart';

abstract class AppRoute {
  static String initial = LoadingPage.route;

  static final List<GetPage<dynamic>> routes = [
    ...loadingRoute,
    ...signInRoute,
    ...mainRoute,
    ...productDetailRoute,
    ...productListRoute,
    ...onboardingRoute,
  ];
}
