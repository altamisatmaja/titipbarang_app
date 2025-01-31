import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:titipbarang_app/data/remote/app_info.dart';
import 'package:titipbarang_app/feature/auth/auth_controller.dart';
import 'package:titipbarang_app/model/storage/storage.dart';
import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/utils/helper/connectivity_helper.dart';
import 'package:titipbarang_app/utils/localization/locale_helper.dart';
import 'package:titipbarang_app/utils/localization/localization.dart';
import 'package:m_widget/m_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

abstract class AppInitializer {
  static Future<void> initialize() async {
    Language.addData(localization);

    await initHive();

    await AppInfo.init();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    await MWidget.initialize(
      defaultLocale: LocaleHelper.currentLocale,
      defaultTheme: ThemeValue(
        themeMode: ThemeMode.light,
        color: AppColors.primary,
        useDynamicColors: true,
        withCustomColors: true,
      ),
    );

    await ConnectivityHelper.init();

    Get.put(const FlutterSecureStorage());
    Get.put(AuthController(), permanent: true);
  }

  static Future<void> initHive() async {
    Directory dir = Directory('');
    if (Platform.isIOS) {
      dir = await getLibraryDirectory();
    } else if (Platform.isAndroid) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      dir = await getApplicationSupportDirectory();
    }
    Hive
      ..init(dir.path)
      ..registerAdapter(StorageAdapter());
    await Hive.openBox<Storage>((Storage).toString());
  }


}
