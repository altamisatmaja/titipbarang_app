import 'package:easy_refresh/easy_refresh.dart';
import 'package:titipbarang_app/utils/extension/string_extension.dart';
import 'package:titipbarang_app/utils/helper/controller/base_controller.dart';
import 'package:titipbarang_app/utils/helper/map_helper.dart';
import 'package:titipbarang_app/data/model/converter.dart' as converter;
import 'package:titipbarang_app/utils/helper/parsing_helper.dart';

mixin BaseObjectMixin<T> on BaseController<T> {
  @override
  IndicatorResult getCache() {
    var cache = box.get(cacheKey);
    if (cache != null && cache.value.toString().isNotNullAndNotEmpty) {
      initialDataFromCache = true;
      value = converter.Converter<T>().fromJson(MapHelper.convertDynamicMap(ParsingHelper.jsonFromString(cache.value)));
      return finishLoadData();
    }
    return IndicatorResult.fail;
  }
}
