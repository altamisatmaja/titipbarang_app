import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/initializer.dart';
import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/routes/app_pages.dart';
import 'package:titipbarang_app/themes/app_themes.dart';
import 'package:titipbarang_app/utils/constant/app_constant.dart';
import 'package:titipbarang_app/utils/localization/locale_helper.dart';
import 'package:m_widget/m_widget.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await AppInitializer.initialize();

  FlutterNativeSplash.remove();

  if (!kReleaseMode) {
    runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ));
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MWidgetDynamicColorBuilder(
        builder: (context, theme, darkTheme, themeMode, colorScheme,
                darkColorScheme) =>
            MWidgetTheme(
          invertThousandSeparator: true,
          child: GetMaterialApp(
            color: AppColors.primary,
            title: AppConstant.appName,
            theme: AppThemes.theme(context, colorScheme!, theme),
            darkTheme:
                AppThemes.darkTheme(context, darkColorScheme!, darkTheme),
            themeMode: themeMode,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: LocaleHelper.locales.values,
            locale: LocaleHelper.currentLocale,
            fallbackLocale: LocaleHelper.fallbackLocale,
            translations: Language(),
            initialRoute: AppRoute.initial,
            getPages: AppRoute.routes,
            debugShowCheckedModeBanner: false,
          ),
        ),
      );
}
