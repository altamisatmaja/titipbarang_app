import 'package:get/get.dart';
import 'package:titipbarang_app/resources/resources.dart';

class HomeController extends GetxController {
  String tag = 'Home::->';

  // Future<IndicatorResult> refreshPage() =>
  //     Get.find<ProductSectionController>().refreshPage();

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Titip Barang',
      'price': 'Rp 135,000',
      'imageUrl': AppAssets.icon.homeTitipbarangIcon.path,
      'borderColor': AppColors.homeTitipBarangBorder,
      'bgColor': AppColors.homeTitipBarangBg,
    },
    {
      'title': 'Transit',
      'price': 'Rp 50,000',
      'imageUrl': AppAssets.icon.homeTransitIcon.path,
      'borderColor': AppColors.homeTransitBorder,
      'bgColor': AppColors.homeTransitBg,
    },
    {
      'title': 'Tenaga Angkut',
      'price': 'Rp 50,000',
      'imageUrl': AppAssets.icon.homeTenagaangkutIcon.path,
      'borderColor': AppColors.homeTenagaAngkutBorder,
      'bgColor': AppColors.homeTenagaAngkutBg,
    },
    {
      'title': 'Antar Jemput',
      'price': 'Rp 20,000',
      'imageUrl': AppAssets.icon.homeAntarjemputIcon.path,
      'borderColor': AppColors.homeAntarJemputBorder,
      'bgColor': AppColors.homeAntarJemputBg,
    },
    {
      'title': 'Packing Barang',
      'price': 'Rp 25,000',
      'imageUrl': AppAssets.icon.homePackingbarangIcon.path,
      'borderColor': AppColors.homePackingBarangBorder,
      'bgColor': AppColors.homePackingBarangBg,
    },
    {
      'title': 'Self Storage',
      'price': 'Coming Soon',
      'imageUrl': AppAssets.icon.homeSelfstorageIcon.path,
      'borderColor': AppColors.homeSelfStorageBorder,
      'bgColor': AppColors.homeSelfStorageBg,
    },
  ];
}
