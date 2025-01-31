import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/resources/fonts.gen.dart';

extension SecondaryTextThemeExtension on BuildContext {
  TextTheme get secondaryTextTheme => textTheme.copyWith(
        displayLarge: textTheme.displayLarge!.copyWith(fontFamily: FontFamily.montserrat),
        displayMedium: textTheme.displayMedium!.copyWith(fontFamily: FontFamily.montserrat),
        displaySmall: textTheme.displaySmall!.copyWith(fontFamily: FontFamily.montserrat),
        headlineLarge: textTheme.headlineLarge!.copyWith(fontFamily: FontFamily.montserrat),
        headlineMedium: textTheme.headlineMedium!.copyWith(fontFamily: FontFamily.montserrat),
        headlineSmall: textTheme.headlineSmall!.copyWith(fontFamily: FontFamily.montserrat),
        titleLarge: textTheme.titleLarge!.copyWith(fontFamily: FontFamily.montserrat),
        titleMedium: textTheme.titleMedium!.copyWith(fontFamily: FontFamily.montserrat),
        titleSmall: textTheme.titleSmall!.copyWith(fontFamily: FontFamily.montserrat),
        bodyLarge: textTheme.bodyLarge!.copyWith(fontFamily: FontFamily.montserrat),
        bodyMedium: textTheme.bodyMedium!.copyWith(fontFamily: FontFamily.montserrat),
        bodySmall: textTheme.bodySmall!.copyWith(fontFamily: FontFamily.montserrat),
        labelLarge: textTheme.labelLarge!.copyWith(fontFamily: FontFamily.montserrat),
        labelMedium: textTheme.labelMedium!.copyWith(fontFamily: FontFamily.montserrat),
        labelSmall: textTheme.labelSmall!.copyWith(fontFamily: FontFamily.montserrat),
      );
}