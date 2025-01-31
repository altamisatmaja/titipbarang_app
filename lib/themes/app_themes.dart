import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/resources/fonts.gen.dart';
import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/utils/extension/build_context_extension.dart';

abstract class AppThemes {
  static ColorScheme effectiveColorScheme(ColorScheme colorScheme) => colorScheme.copyWith(
        surface: AppColors.white,
        primary: AppColors.primary,
      );

  static FilledButtonThemeData effectiveFilledButtonTheme(BuildContext context) => FilledButtonThemeData(
        style: FilledButton.styleFrom(
          fixedSize: const Size.fromHeight(48.0),
          textStyle: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      );

  static OutlinedButtonThemeData effectiveOutlinedButtonTheme(BuildContext context) => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          fixedSize: const Size.fromHeight(48.0),
          textStyle: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          side: const BorderSide(color: AppColors.primary),
        ),
      );

  static InputDecorationTheme effectiveInputDecorationTheme(BuildContext context, ColorScheme colorScheme) => InputDecorationTheme(
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        filled: true,
        fillColor: colorScheme.surface,
        hintStyle: context.secondaryTextTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400, color: const Color(0xFF8897AD)),
      );

  static TextTheme effectiveTextTheme(BuildContext context, ColorScheme colorScheme) => TextTheme(
        displayLarge: context.textTheme.displayLarge!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        displayMedium: context.textTheme.displayMedium!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        displaySmall: context.textTheme.displaySmall!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        headlineLarge: context.textTheme.headlineLarge!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        headlineMedium: context.textTheme.headlineMedium!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        headlineSmall: context.textTheme.headlineSmall!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        titleLarge: context.textTheme.titleLarge!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        titleMedium: context.textTheme.titleMedium!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        titleSmall: context.textTheme.titleSmall!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        bodyLarge: context.textTheme.bodyLarge!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        bodyMedium: context.textTheme.bodyMedium!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        bodySmall: context.textTheme.bodySmall!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        labelLarge: context.textTheme.labelLarge!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        labelMedium: context.textTheme.labelMedium!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
        labelSmall: context.textTheme.labelSmall!.copyWith(fontFamily: FontFamily.raleway, color: colorScheme.onSurface),
      );

  static ThemeData theme(BuildContext context, ColorScheme colorScheme, ThemeData theme) => theme.copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: effectiveColorScheme(colorScheme),
        filledButtonTheme: effectiveFilledButtonTheme(context),
        outlinedButtonTheme: effectiveOutlinedButtonTheme(context),
        inputDecorationTheme: effectiveInputDecorationTheme(context, colorScheme),
        textTheme: effectiveTextTheme(context, colorScheme),
      );

  static ThemeData darkTheme(BuildContext context, ColorScheme colorScheme, ThemeData theme) => theme.copyWith(
        colorScheme: effectiveColorScheme(colorScheme),
        filledButtonTheme: effectiveFilledButtonTheme(context),
        outlinedButtonTheme: effectiveOutlinedButtonTheme(context),
        inputDecorationTheme: effectiveInputDecorationTheme(context, colorScheme),
        textTheme: effectiveTextTheme(context, colorScheme),
      );
}
