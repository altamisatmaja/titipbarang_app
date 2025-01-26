import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_widget/m_widget.dart';

class RadioBorderedTile<T> extends StatelessWidget {
  const RadioBorderedTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.titleText,
    required this.onChanged,
    required this.selected,
  });

  final T value;
  final T groupValue;
  final String titleText;
  final ValueChanged<T> onChanged;
  final bool selected;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(kShapeSmall)),
          border: Border.all(color: selected ? context.theme.colorScheme.primary : Colors.transparent),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(kShapeSmall)),
          child: RadioListTile<T>(
            value: value,
            groupValue: groupValue,
            title: Text(titleText),
            onChanged: (value) => onChanged(value as T),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kShapeSmall))),
          ),
        ),
      );
}
