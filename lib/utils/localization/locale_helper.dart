import 'dart:ui';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:titipbarang_app/model/storage/storage.dart';
import 'package:titipbarang_app/utils/widget/my_bottom_sheet.dart';
import 'package:titipbarang_app/utils/widget/radio_bordered_tile.dart';

abstract class LocaleHelper {
  static Map<String, Locale> get locales => {
        'txt_language_english'.tr: const Locale('en'),
        'txt_language_indonesian'.tr: const Locale('id'),
      };

  static Locale get fallbackLocale => const Locale('id');

  static Locale get currentLocale {
    String currentLocale = Hive.box<Storage>((Storage).toString()).get((Locale).toString())?.value?.toString() ?? fallbackLocale.languageCode;

    return Locale(currentLocale);
  }

  static Future<void> showLocaleDialog() => Get.bottomSheet(
        isScrollControlled: true,
        ValueBuilder(
          initialValue: currentLocale,
          onUpdate: (value) => updateLocale(value!.languageCode),
          builder: (Locale? snapshot, void Function(Locale?) updater) => MyBottomSheetBody(
            titleText: 'Choose language',
            subtitleText: 'Customize the language to your liking!',
            children: locales.entries
                .map(
                  (e) => RadioBorderedTile(
                    value: e.value,
                    groupValue: snapshot,
                    titleText: e.key,
                    onChanged: (value) => updater(value),
                    selected: e.value == snapshot,
                  ),
                )
                .toList(),
          ),
        ),
      );

  static Future<void> updateLocale(String languageCode) async {
    Get.updateLocale(Locale(languageCode));
    return Hive.box<Storage>((Storage).toString()).put((Locale).toString(), Storage(key: (Locale).toString(), value: languageCode));
  }
}
