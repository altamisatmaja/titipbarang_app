import 'package:titipbarang_app/feature/product/list/widgets/product_item.dart';
import 'package:titipbarang_app/utils/widget/my_app_bar.dart';

import 'product_list_controller.dart';
import 'package:titipbarang_app/utils/widget/classical_refresh.dart';
import 'package:titipbarang_app/utils/widget/state_handle_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductListPage extends GetView<ProductListController> {
  static const String route = '/product/list';

  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(
          initialIsSearching: true,
          onSearch: (value) => controller.onSearch(query: value, onSearch: () => controller.refreshPage(setValueToNull: true)),
        ),
        body: StateHandleWidget(
          controller: controller,
          onErrorPressed: controller.refreshPage,
          onEmptyPressed: controller.refreshPage,
          onSuccess: (state) => ClassicalRefresh(
            onRefresh: controller.refreshPage,
            onLoad: controller.loadNextPage,
            canLoadMore: controller.hasNextPage,
            child: ListView.builder(
              itemCount: state!.length,
              itemBuilder: (context, index) {
                final item = state[index];

                return ProductItem(
                  item: item,
                  onTap: () => controller.toDetail(item),
                );
              },
            ),
          ),
        ),
      );
}
