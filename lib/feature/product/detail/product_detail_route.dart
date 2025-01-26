import 'product_detail_binding.dart';
import 'product_detail_page.dart';
import 'package:get/get.dart';

final productDetailRoute = [
  GetPage(
    name: ProductDetailPage.route,
    page: () => const ProductDetailPage(),
    binding: ProductDetailBinding(),
  ),
];