import 'product_list_binding.dart';
import 'product_list_page.dart';
import 'package:get/get.dart';

final productListRoute = [
  GetPage(
    name: ProductListPage.route,
    page: () => const ProductListPage(),
    binding: ProductListBinding(),
  ),
];