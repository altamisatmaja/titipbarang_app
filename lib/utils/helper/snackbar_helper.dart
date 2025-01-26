import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SnackbarHelper {
  static void showSnackbar({required String messageText}) {
    if (Get.context == null) return;

    Get.closeCurrentSnackbar();
    Get.showSnackbar(
      GetSnackBar(
        message: messageText,
        duration: const Duration(seconds: 4),
        animationDuration: Durations.medium3,
      ),
    );
  }
}
