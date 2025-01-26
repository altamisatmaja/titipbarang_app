import 'package:easy_refresh/easy_refresh.dart';
import 'package:titipbarang_app/utils/widget/image_load.dart';
import 'package:m_widget/m_widget.dart';

import 'product_detail_controller.dart';
import 'package:titipbarang_app/utils/widget/classical_refresh.dart';
import 'package:titipbarang_app/utils/widget/state_handle_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  static const String route = '/product/detail';

  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StateHandleWidget(
          controller: controller,
          onErrorPressed: controller.refreshPage,
          onEmptyPressed: controller.refreshPage,
          onSuccess: (state) => ClassicalRefresh(
            onRefresh: controller.refreshPage,
            indicatorPosition: IndicatorPosition.locator,
            child: CustomScrollView(
              slivers: [
                const HeaderLocator.sliver(paintExtent: 100.0),
                SliverAppBar(
                  expandedHeight: 300.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ImageLoad(
                      imageUrl: state?.images?.firstWhereOrNull((element) => element.trim().isNotEmpty),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      state?.title ?? '-',
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      '\$ ${(state?.price ?? 0.0).toThousandFormat(includeDecimalPart: true)}',
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      state?.description ?? '-',
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
