import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:titipbarang_app/utils/extension/string_extension.dart';
import 'package:titipbarang_app/utils/helper/controller/base_controller.dart';
import 'package:titipbarang_app/data/model/converter.dart' as converter;

mixin BaseListMixin<E> on BaseController<List<E>> {
  @override
  IndicatorResult getCache() {
    var cache = box.get(cacheKey);
    if (cache != null && cache.value.toString().isNotNullAndNotEmpty) {
      initialDataFromCache = true;
      value = List<E>.from(json.decode(cache.value).map((x) => converter.Converter<E>().fromJson(x)));
      return finishLoadData();
    }
    return IndicatorResult.fail;
  }
}
