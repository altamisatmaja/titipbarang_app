import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/model/product/product.dart';
import 'package:titipbarang_app/utils/widget/image_load.dart';
import 'package:m_widget/m_widget.dart';

class ProductSectionItem extends StatelessWidget {
  const ProductSectionItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Product item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 4.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(kShapeMedium)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 120.0,
              height: 170.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageLoad(
                    width: 120.0,
                    height: 100.0,
                    imageUrl: item.thumbnail,
                    child: const Icon(Icons.image),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item.title ?? '-',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
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
                ],
              ),
            ),
          ),
        ),
      );
}
