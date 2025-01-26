import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:m_widget/m_widget.dart';

class MyBottomSheetBody extends StatelessWidget {
  const MyBottomSheetBody({
    super.key,
    this.titleText,
    this.subtitleText,
    this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String? titleText;
  final String? subtitleText;
  final List<Widget>? children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(kShapeLarge)),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (titleText?.isNotEmpty ?? false) Text(titleText!, style: context.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
            if (subtitleText?.isNotEmpty ?? false) Text(subtitleText!),
            if ((titleText?.isNotEmpty ?? false) || (subtitleText?.isNotEmpty ?? false)) const SizedBox(height: 16.0),
            ...children ?? [],
          ],
        ),
      );
}
