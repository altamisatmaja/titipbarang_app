import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/model/product/product.dart';
import 'package:titipbarang_app/utils/widget/image_load.dart';
import 'package:m_widget/m_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Product item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: ImageLoad(imageUrl: item.thumbnail),
        title: Text(
          item.title ?? '-',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(kShapeSmall)),
              ),
              child: Text(
                '\$ ${(item.price ?? 0.0).toThousandFormat(includeDecimalPart: true)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, color: context.theme.colorScheme.onPrimary),
              ),
            ),
          ],
        ),
        onTap: onTap,
      );
}
