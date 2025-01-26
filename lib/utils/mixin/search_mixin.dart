import 'dart:ui';

import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

mixin SearchMixin {
  String? querySearch;

  final Debouncer debouncer = Debouncer(delay: const Duration(milliseconds: 800));

  void onSearch({required String? query, required VoidCallback onSearch}) {
    querySearch = query;
    debouncer.call(onSearch);
  }
}
