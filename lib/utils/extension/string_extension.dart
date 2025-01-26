extension StringExtension on String? {
  bool get isNotNullAndNotEmpty => this != null && this != '' && this != 'null' && this != '[]' && this != '{}';
}
