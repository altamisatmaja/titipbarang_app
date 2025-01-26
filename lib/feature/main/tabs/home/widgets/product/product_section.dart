import 'package:titipbarang_app/feature/main/tabs/home/widgets/product/widgets/product_section_item.dart';
import 'product_section_controller.dart';
import 'package:titipbarang_app/utils/widget/classical_refresh.dart';
import 'package:titipbarang_app/utils/widget/state_handle_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductSection extends GetView<ProductSectionController> {
  static const String route = '/product/section';

  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) => StateHandleWidget(
        controller: controller,
        onErrorPressed: controller.refreshPage,
        onEmptyPressed: controller.refreshPage,
        onSuccess: (state) => SizedBox(
          height: 170.0,
          child: ClassicalRefresh(
            onLoad: controller.loadNextPage,
            canLoadMore: controller.hasNextPage,
            scrollDirection: Axis.horizontal,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state!.length,
              itemBuilder: (context, index) {
                final item = state[index];

                return ProductSectionItem(
                  item: item,
                  onTap: () => controller.toDetail(item),
                );
              },
            ),
          ),
        ),
      );
}
