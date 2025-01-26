import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/utils/extension/connectivity_result_extension.dart';
import 'package:titipbarang_app/utils/helper/snackbar_helper.dart';
import 'package:m_widget/m_widget.dart';

abstract class ConnectivityHelper {
  static RxList<ConnectivityResult> currentConnectivity = RxList();

  static Future<void> init() async {
    Connectivity().onConnectivityChanged.listen((result) async {
      bool areEqualTo = ConnectivityHelper.currentConnectivity.areEqualTo(result);
      if (areEqualTo) return;
      ConnectivityHelper.currentConnectivity.value = result;
    });
  }

  static bool ensureOnlineConnection({bool withMessage = true}) {
    if (currentConnectivity.isOffline) {
      if (withMessage) SnackbarHelper.showSnackbar(messageText: 'txt_offline'.tr);
      return false;
    }

    return true;
  }
}
