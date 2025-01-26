import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/feature/auth/auth_controller.dart';
import 'package:titipbarang_app/feature/main/tabs/home/widgets/search_container.dart';
import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/utils/widget/image_load.dart';

class HeaderSection extends SliverPersistentHeaderDelegate {
  const HeaderSection({required this.viewPaddingTop});

  final double viewPaddingTop;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double currentExtent = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);
    // double opacity = ((149.0 - currentExtent) / (149.0 - minExtent)).clamp(0.0, 1.0);
    double negateOpacity = ((currentExtent - minExtent) / ((130.0 + viewPaddingTop) - minExtent)).clamp(0.0, 1.0);

    return FlexibleSpaceBarSettings(
      toolbarOpacity: 1.0,
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: currentExtent,
      child: SizedBox(
        height: currentExtent,
        child: Stack(
          children: [
            Container(
              height: 100.0 + viewPaddingTop,
              color: AppColors.primary,
            ),
            Positioned(
              left: 16.0,
              right: 16.0,
              top: 16.0 + viewPaddingTop,
              child: Opacity(
                opacity: negateOpacity,
                child: Row(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4.0,
                          color: context.theme.colorScheme.onPrimary.withOpacity(0.5),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                        child: ImageLoad(
                          imageUrl: AuthController.find.currentUser.value?.image,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      'txt_welcome'.trArgs([AuthController.find.currentUser.value?.username ?? '-']),
                      style: context.textTheme.titleMedium!.copyWith(color: context.theme.colorScheme.onPrimary),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              right: 16.0,
              top: currentExtent - 70.0,
              child: const SearchContainer(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 135.0 + viewPaddingTop;

  @override
  double get minExtent => kToolbarHeight + viewPaddingTop + 16.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
