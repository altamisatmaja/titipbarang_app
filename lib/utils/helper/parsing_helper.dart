import 'dart:convert';

import 'package:m_widget/m_widget.dart';

abstract class ParsingHelper {
  static DateTime? fromEpoch(int? seconds) => seconds != null ? DateTime.fromMillisecondsSinceEpoch(seconds * 1000) : null;

  static int? toEpoch(DateTime? dateTime) => dateTime != null ? dateTime.millisecondsSinceEpoch ~/ 1000 : null;

  static Map<String, dynamic>? jsonFromString(dynamic data) => data == '' ? null : json.decode(jsonToCorrectStringFormat(data));

  static String? dynamicToString(dynamic data) => data.toString();

  static int? parseInt(dynamic number) => (number is int?)
      ? number
      : number != null && number is String
          ? int.tryParse(number)
          : null;

  static double? parseDouble(dynamic number) => number is double?
      ? number
      : number is int?
          ? number?.toDouble()
          : number != null && number is String
              ? double.tryParse(number)
              : null;
}
