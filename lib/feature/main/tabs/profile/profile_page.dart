import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/feature/auth/auth_controller.dart';
import 'package:titipbarang_app/utils/localization/locale_helper.dart';
import 'package:m_widget/m_widget.dart';

class ProfilePage extends GetView<AuthController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
        ),
        body: ListView(
          children: [
            ValueBuilder(
              initialValue: Get.isDarkMode,
              builder: (bool? snapshot, void Function(bool?) updater) => SwitchListTile(
                value: snapshot!,
                secondary: const Icon(Icons.dark_mode),
                title: Text('txt_dark_mode'.tr),
                onChanged: (bool value) async {
                  MWidget.themeValue.themeMode = value ? ThemeMode.dark : ThemeMode.light;
                  await MWidget.themeValue.saveToSharedPreferences();
                  updater(value);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Choose language'),
              subtitle: Text(LocaleHelper.locales.entries.firstWhere((element) => element.value.languageCode == LocaleHelper.currentLocale.languageCode).key),
              onTap: LocaleHelper.showLocaleDialog,
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FilledButton(
                onPressed: controller.signOut,
                child: Text('txt_sign_out'.tr),
              ),
            ),
          ],
        ),
      );
}
