import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/feature/auth/auth_controller.dart';
import 'package:titipbarang_app/utils/helper/dialog_helper.dart';
import 'package:titipbarang_app/utils/helper/snackbar_helper.dart';

abstract class ErrorHelper {
  static Future<void> handleError(dynamic e, {bool canUseNavigator = true}) async {
    String? message;

    if (e is String) {
      message = e;

      if (message.isNotEmpty) return DialogHelper.showFailedDialog(message.tr);
    }

    if (e is DioException) {
      if (e.type == DioExceptionType.cancel) return;

      if (e.message == 'You are offline') {
        try {
          return SnackbarHelper.showSnackbar(messageText: 'txt_offline'.tr);
        } catch (e) {
          // Ignored, really
        }
      }

      if (e.response?.statusCode == 401 && canUseNavigator && Get.context != null) AuthController.find.signOut();

      if (e.response?.data?['message'] is Map) {
        Map map = e.response?.data?['message'] as Map;
        String key = map.keys.first;

        if (map[key] is List) {
          message = (map[key] as List).first;
        } else {
          message = map[key];
        }
      } else {
        message = e.response?.data?['message']?.toString() ?? e.response?.data?.toString() ?? e.message;
      }

      if (message != null && message.isNotEmpty) return DialogHelper.showFailedDialog(message.tr);

      if (e.error is HandshakeException || e.error is SocketException) {
        return DialogHelper.showFailedDialog('txt_failed_connect_to_server'.tr);
      } else if (e.error is FormatException) {
        return DialogHelper.showFailedDialog((e.error as FormatException).source.toString());
      } else {
        switch (e.response?.statusCode) {
          case 404:
            return DialogHelper.showFailedDialog('txt_url_not_found'.tr);
          case 500:
            return DialogHelper.showFailedDialog('txt_internal_server_error'.tr);
          default:
            if (e.error != null) return DialogHelper.showFailedDialog(e.error.toString());
        }
      }
    }

    if (e is HandshakeException || e is SocketException) {
      return DialogHelper.showFailedDialog('txt_failed_connect_to_server'.tr);
    } else if (e is FormatException) {
      return DialogHelper.showFailedDialog(e.source.toString());
    } else if (e == 'You are offline') {
      try {
        return SnackbarHelper.showSnackbar(messageText: 'txt_offline'.tr);
      } catch (e) {
        // Ignored, really
      }
    }

    return DialogHelper.showFailedDialog(e.toString().tr);
  }
}
