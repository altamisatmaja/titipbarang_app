import 'package:easy_refresh/easy_refresh.dart';
import 'package:titipbarang_app/feature/main/tabs/home/widgets/header_section.dart';
import 'package:titipbarang_app/feature/main/tabs/home/widgets/product/product_section.dart';
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
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: HeaderSection(viewPaddingTop: MediaQuery.viewPaddingOf(context).top),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            const HeaderLocator.sliver(),
            const SliverToBoxAdapter(child: ProductSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverList.builder(
              itemBuilder: (context, index) => const SizedBox(
                height: 100.0,
                child: Placeholder(),
              ),
            ),
          ],
        ),
      );
}
