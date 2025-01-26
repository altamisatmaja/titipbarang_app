import 'package:flutter/foundation.dart';

abstract class Environments {
  static EnvironmentsMode mode = !kReleaseMode ? EnvironmentsMode.development : EnvironmentsMode.production;
  // static EnvironmentsMode mode = EnvironmentsMode.production;

  static String get apiUrl => mode.isDevelopment ? 'https://dummyjson.com/' : 'https://dummyjson.com/';
}

enum EnvironmentsMode {
  development,
  production;

  bool get isDevelopment => this == development;

  bool get isProduction => this == production;
}
