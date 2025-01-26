import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/feature/product/list/product_list_page.dart';
import 'package:m_widget/m_widget.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) => Card(
        child: InkWell(
          onTap: () => Get.toNamed(ProductListPage.route),
          borderRadius: const BorderRadius.all(Radius.circular(kShapeMedium)),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 8.0),
                Text('Apple AirPods Max Silver'),
              ],
            ),
          ),
        ),
      );
}
