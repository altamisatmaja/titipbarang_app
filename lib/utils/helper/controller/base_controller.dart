import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:titipbarang_app/data/model/converter.dart' as converter;
import 'package:titipbarang_app/model/storage/storage.dart';
import 'package:titipbarang_app/utils/extension/string_extension.dart';
import 'package:titipbarang_app/utils/helper/controller/base_list_mixin.dart';
import 'package:titipbarang_app/utils/helper/controller/base_object_mixin.dart';
import 'package:titipbarang_app/utils/helper/controller/state_controller.dart';

abstract class BaseListController<T> extends BaseController<List<T>> with BaseListMixin<T> {}

abstract class BaseObjectController<T> extends BaseController<T> with BaseObjectMixin<T> {}

abstract class BaseController<T> extends StateController<T> {
  CancelToken cancelToken = CancelToken();

  int page = 1;
  int perPage = 30;
  bool hasNextPage = false;
  bool initialDataFromCache = false;

  final box = Hive.box<Storage>((Storage).toString());

  String get cacheKey => isList ? '${T.toString()}_list' : T.toString();

  bool get isList => value is Iterable?;

  bool get isRefreshing => !value.toString().isNotNullAndNotEmpty;

  @mustCallSuper
  Future<IndicatorResult> refreshPage({bool setValueToNull = false}) async {
    page = 1;
    if (setValueToNull) value = null;
    IndicatorResult result = await onLoadData();
    initialDataFromCache = false;
    return result;
  }

  @mustCallSuper
  Future<IndicatorResult> loadNextPage() {
    page++;
    return onLoadData();
  }

  Future<IndicatorResult> onLoadData();

  IndicatorResult getCache();

  IndicatorResult saveCacheAndFinish() {
    box.put(cacheKey, Storage(key: cacheKey, value: json.encode(isList ? (value ?? []) : (value != null ? converter.Converter<T>().toJson(value as T) : ''))));
    return finishLoadData();
  }

  IndicatorResult finishLoadData() {
    if (!value.toString().isNotNullAndNotEmpty) {
      emptyState();
    } else {
      successState(value);
    }
    return IndicatorResult.success;
  }
}
