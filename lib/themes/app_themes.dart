import 'package:flutter/material.dart';
import 'package:titipbarang_app/resources/resources.dart';

abstract class AppThemes {
  static InputDecorationTheme effectiveInputDecorationTheme(ColorScheme colorScheme) => const InputDecorationTheme(
        border: OutlineInputBorder(),
      );

  static ColorScheme effectiveColorScheme(ColorScheme colorScheme) => colorScheme.copyWith(
        primary: AppColors.primary,
      );

  static ThemeData theme(BuildContext context, ColorScheme colorScheme, ThemeData theme) => theme.copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: effectiveColorScheme(colorScheme),
        inputDecorationTheme: effectiveInputDecorationTheme(colorScheme),
      );

  static ThemeData darkTheme(BuildContext context, ColorScheme colorScheme, ThemeData theme) => theme.copyWith(
        colorScheme: effectiveColorScheme(colorScheme),
        inputDecorationTheme: effectiveInputDecorationTheme(colorScheme),
      );
}
