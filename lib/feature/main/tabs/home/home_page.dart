import 'package:easy_refresh/easy_refresh.dart';
import 'package:titipbarang_app/feature/main/tabs/home/widgets/header_section.dart';
import 'package:titipbarang_app/feature/main/tabs/home/widgets/product/product_section.dart';
import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/utils/widget/classical_refresh.dart';

import 'home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends GetView<HomeController> {
  static const String route = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => ClassicalRefresh(
        onRefresh: controller.refreshPage,
        indicatorPosition: IndicatorPosition.locator,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo, Altamis!',
                                style: context.textTheme.headlineSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Selamat siang',
                                style: context.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFA5D6A7),
                                width: 4.0,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                AppAssets.icon.titipbarangIconLauncher.path,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.green,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Gunakan kode AWALTHAHUN untuk diskon!',
                              style: context.textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Layanan Kami',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 1.35),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          final service = services[index];
                          return ServiceCard(
                            bgColor: service['bgColor'],
                            borderColor: service['borderColor'],
                            title: service['title']!,
                            price: service['price']!,
                            imageUrl: service['imageUrl']!,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final Color borderColor;
  final Color bgColor;

  const ServiceCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    super.key,
    required this.borderColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(
                color: borderColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.asset(
                imageUrl,
                height: 25,
                width: 25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
