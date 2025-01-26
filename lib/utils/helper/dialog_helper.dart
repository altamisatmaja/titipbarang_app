import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/utils/widget/version_widget.dart';

abstract class DialogHelper {
  static Future<void> showFailedDialog(String messageText, {String? titleText}) async {
    if (Get.context == null) return;

    return Get.dialog(
      Dialog(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
          children: [
            AppAssets.images.illustrationFailedDialog.image(),
            const SizedBox(height: 16.0),
            Text(
              titleText ?? 'txt_error'.tr,
              style: Get.textTheme.titleLarge!.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(messageText, style: Get.context!.textTheme.bodyLarge),
            const SizedBox(height: 8.0),
            OutlinedButton(
              onPressed: Get.back,
              child: Text('txt_ok'.tr),
            ),
            const SizedBox(height: 8.0),
            const VersionWidget(),
          ],
        ),
      ),
    );
  }
}
